//#line 2 "source\rasterizer\hlsl\shield_effect.hlsl"

#include "global.fx"
#include "hlsl_constant_mapping.fx"

#include "deform.fx"

#define LDR_ALPHA_ADJUST g_exposure.w
#define HDR_ALPHA_ADJUST g_exposure.b
#define DARK_COLOR_MULTIPLIER g_exposure.g
#include "render_target.fx"
#include "shield_impact_registers.fx"

// noise textures
LOCAL_SAMPLER_2D(shield_impact_noise_texture1, 0);
LOCAL_SAMPLER_2D(shield_impact_noise_texture2, 1);
LOCAL_SAMPLER_2D(shield_impact_depth_texture, 2);


// Magic line to compile this for various needed vertex types
//@generate rigid
//@generate world
//@generate skinned

struct s_vertex_out
{
	float4 position : SV_POSITION;
	float4 world_space_pos : TEXCOORD1;
	float4 texcoord : TEXCOORD2;
};

s_vertex_out default_vs(
	in vertex_type vertex_in
	)
{
	s_vertex_out vertex_out;

	float4 local_to_world_transform[3];
	
	deform(vertex_in, local_to_world_transform);
	 	
	vertex_in.position+= vertex_in.normal * extrusion_distance;
	
	vertex_out.world_space_pos= float4(vertex_in.position, 1.0f);	
	vertex_out.position= mul(float4(vertex_in.position, 1.0f), View_Projection);	
	vertex_out.texcoord.xyzw= vertex_in.texcoord.xyxx;
	
	return vertex_out;
}

// things to expose:
// VS
// extrusion amount
// PS
// texture 1 & 2 scroll rate
// shield color, shield hot color
// intensity exponent, bias, and scale



accum_pixel default_ps(s_vertex_out pixel_in) : SV_Target
{
    float2 pixel_position = 0.5f + pixel_in.position.xy;
    float2 inv_texture_size = rcp(texture_size.xy);
    pixel_position *= inv_texture_size;
    float4 shield_impact_depth_sample = sample2D(shield_impact_depth_texture, pixel_position);
    
    float2 depth_fade_value = (shield_impact_depth_sample.r - pixel_in.texcoord.z) * depth_fade_params.xy;
    depth_fade_value = saturate(depth_fade_value);
    
    float4 scales = pixel_in.world_space_pos.w * edge_scales + edge_offsets;

    float depth_scale_0 = min(scales.x, scales.y);
    depth_scale_0 = pow(saturate(depth_scale_0), 4) * depth_fade_value.x;
    
    float depth_scale_1 = min(scales.z, scales.w);
    depth_scale_1 = saturate(depth_scale_1) * depth_fade_value.y;

    float4 plasma_noise_scale_offset_1 = float4(plasma_scales.xx, plasma_offsets.xy);
    float2 plasma_noise_texcoord_1 = pixel_in.texcoord.xy * plasma_noise_scale_offset_1.xy + plasma_noise_scale_offset_1.zw;
    float4 plasma_noise_sample_1 = sample2D(shield_impact_noise_texture1, plasma_noise_texcoord_1);

    float4 plasma_noise_scale_offset_2 = float4(plasma_scales.yy, -plasma_offsets.zw);
    float2 plasma_noise_texcoord_2 = pixel_in.texcoord.xy * plasma_noise_scale_offset_2.xy + plasma_noise_scale_offset_2.zw;
    float4 plasma_noise_sample_2 = sample2D(shield_impact_noise_texture2, plasma_noise_texcoord_2);
    
    float plasma_noise = 1.0f - abs(plasma_noise_sample_1.r - plasma_noise_sample_2.r);
    plasma_noise = pow(saturate(plasma_noise), depth_scale_1 * plasma_scales.z + plasma_scales.w);

    float4 color = plasma_edge_color * depth_scale_1;
    color += plasma_color;
    color += impact0_color * saturate(1.0f - pixel_in.texcoord.w);
    color = depth_scale_0 * edge_glow + color * plasma_noise;
    
    color.rgb *= g_exposure.x;

    return convert_to_render_target(color, false, false
    #ifdef SSR_ENABLE
    , 0
    #endif
    );
}