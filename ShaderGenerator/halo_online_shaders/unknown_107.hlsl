
#define POSTPROCESS_USE_CUSTOM_VERTEX_SHADER

#include "global.fx"
#include "hlsl_vertex_types.fx"
#include "utilities.fx"
#include "postprocess.fx"
//@generate screen

LOCAL_SAMPLER_2D(color_sampler, 0);
LOCAL_SAMPLER_2D(gbuf_sampler, 1);

screen_output default_vs(screen_output IN)
{
	screen_output OUT;
	OUT.texcoord=		IN.texcoord;
	OUT.position.xy=	IN.position;
	OUT.position.z=     0.5f;
	OUT.position.w=     1.0f;
	return OUT;
}

accum_pixel default_ps(vertex_type IN) : SV_Target
{
    accum_pixel OUT;

    float4 color_sample = sample2Dlod(color_sampler, float4(IN.texcoord, 0, 0));
    float4 gbuf_sample = sample2Dlod(gbuf_sampler, float4(IN.texcoord, 0, 0));

    float3 color_rgb = color_sample.xyz * color_sample.w;
    float3 combined_rgb = gbuf_sample.xyz * color_rgb;

    float3 max_rgb = max(combined_rgb, float3(0, 0, 0));

    float reciprocal_exposure = 1.0 / g_exposure.y;

	OUT.color.xyz = max_rgb;
    OUT.color.w = color_sample.w * g_exposure.w;

    OUT.dark_color.xyz = max_rgb * reciprocal_exposure;
	OUT.dark_color.w = color_sample.w * g_exposure.z;

    #ifdef SSR_ENABLE
	OUT.ssr_color = 0.0f;
    #endif

    return OUT;
}