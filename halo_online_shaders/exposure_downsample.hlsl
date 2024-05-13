#line 2 "source\rasterizer\hlsl\exposure_downsample.hlsl"

#include "global.fx"
#include "hlsl_vertex_types.fx"
#include "utilities.fx"
#include "postprocess.fx"
//@generate screen

LOCAL_SAMPLER_2D(source_sampler, 0);
LOCAL_SAMPLER_2D(weight_sampler, 1);

float4 default_ps(screen_output IN) : SV_Target
{
	float3 average= 0.0f;		// weighted_sum(log(intensity)), log(weighted_sum(intensity)), total_weight

	float weight_1= tex2D_offset(weight_sampler, IN.texcoord, -3, -7).g;		
//	float intensity_1= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -3, -7));
	float intensity_1= tex2D_offset(source_sampler, IN.texcoord, -3, -7).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_1 * float3(log2( 0.00001f + intensity_1 ), intensity_1, 1.0f);
	
	float weight_2= tex2D_offset(weight_sampler, IN.texcoord, -3, -5).g;		
//	float intensity_2= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -3, -5));
	float intensity_2= tex2D_offset(source_sampler, IN.texcoord, -3, -5).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_2 * float3(log2( 0.00001f + intensity_2 ), intensity_2, 1.0f);

	float weight_3= tex2D_offset(weight_sampler, IN.texcoord, -3, -3).g;		
//	float intensity_3= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -3, -3));
	float intensity_3= tex2D_offset(source_sampler, IN.texcoord, -3, -3).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_3 * float3(log2( 0.00001f + intensity_3 ), intensity_3, 1.0f);

	float weight_4= tex2D_offset(weight_sampler, IN.texcoord, -3, -1).g;		
//	float intensity_4= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -3, -1));
	float intensity_4= tex2D_offset(source_sampler, IN.texcoord, -3, -1).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_4 * float3(log2( 0.00001f + intensity_4 ), intensity_4, 1.0f);

	float weight_5= tex2D_offset(weight_sampler, IN.texcoord, -3, 1).g;		
//	float intensity_5= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -3, 1));
	float intensity_5= tex2D_offset(source_sampler, IN.texcoord, -3, 1).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_5 * float3(log2( 0.00001f + intensity_5 ), intensity_5, 1.0f);

	float weight_6= tex2D_offset(weight_sampler, IN.texcoord, -3, 3).g;		
//	float intensity_6= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -3, 3));
	float intensity_6= tex2D_offset(source_sampler, IN.texcoord, -3, 3).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_6 * float3(log2( 0.00001f + intensity_6 ), intensity_6, 1.0f);

	float weight_7= tex2D_offset(weight_sampler, IN.texcoord, -3, 5).g;		
//	float intensity_7= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -3, 5));
	float intensity_7= tex2D_offset(source_sampler, IN.texcoord, -3, 5).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_7 * float3(log2( 0.00001f + intensity_7 ), intensity_7, 1.0f);

	float weight_8= tex2D_offset(weight_sampler, IN.texcoord, -3, 7).g;		
//	float intensity_8= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -3, 7));
	float intensity_8= tex2D_offset(source_sampler, IN.texcoord, -3, 7).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_8 * float3(log2( 0.00001f + intensity_8 ), intensity_8, 1.0f);

    float weight_9= tex2D_offset(weight_sampler, IN.texcoord, -1, -7).g;		
//	float intensity_9= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -1, -7));
	float intensity_9= tex2D_offset(source_sampler, IN.texcoord, -1, -7).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_9 * float3(log2( 0.00001f + intensity_9 ), intensity_9, 1.0f);
	
	float weight_10= tex2D_offset(weight_sampler, IN.texcoord, -1, -5).g;		
//	float intensity_10= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -1, -5));
	float intensity_10= tex2D_offset(source_sampler, IN.texcoord, -1, -5).a;					// actual intensity stored in the alpha channel
	average.xyz += weight_10 * float3(log2( 0.00001f + intensity_10 ), intensity_10, 1.0f);

	float weight_11= tex2D_offset(weight_sampler, IN.texcoord, -1, -3).g;		
//	float intensity_11= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -1, -3));
	float intensity_11= tex2D_offset(source_sampler, IN.texcoord, -1, -3).a;					// actual intensity stored in the alpha channel
	average.xyz += weight_11 * float3(log2( 0.00001f + intensity_11 ), intensity_11, 1.0f);

	float weight_12= tex2D_offset(weight_sampler, IN.texcoord, -1, -1).g;		
//	float intensity_12= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -1, -1));
	float intensity_12= tex2D_offset(source_sampler, IN.texcoord, -1, -1).a;				    // actual intensity stored in the alpha channel
	average.xyz += weight_12 * float3(log2( 0.00001f + intensity_12 ), intensity_12, 1.0f);

	float weight_13= tex2D_offset(weight_sampler, IN.texcoord, -1, 1).g;		
//	float intensity_13= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -1, 1));
	float intensity_13= tex2D_offset(source_sampler, IN.texcoord, -1, 1).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_13 * float3(log2( 0.00001f + intensity_13 ), intensity_13, 1.0f);

	float weight_14= tex2D_offset(weight_sampler, IN.texcoord, -1, 3).g;		
//	float intensity_14= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -1, 3));
	float intensity_14= tex2D_offset(source_sampler, IN.texcoord, -1, 3).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_14 * float3(log2( 0.00001f + intensity_14 ), intensity_14, 1.0f);

	float weight_15= tex2D_offset(weight_sampler, IN.texcoord, -1, 5).g;		
//	float intensity_15= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -1, 5));
	float intensity_15= tex2D_offset(source_sampler, IN.texcoord, -1, 5).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_15 * float3(log2( 0.00001f + intensity_15 ), intensity_15, 1.0f);

	float weight_16= tex2D_offset(weight_sampler, IN.texcoord, -1, 7).g;		
//	float intensity_16= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, -1, 7));
	float intensity_16= tex2D_offset(source_sampler, IN.texcoord, -1, 7).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_16 * float3(log2( 0.00001f + intensity_16 ), intensity_16, 1.0f);

	float weight_17= tex2D_offset(weight_sampler, IN.texcoord, 1, -7).g;		
//	float intensity_17= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 1, -7));
	float intensity_17= tex2D_offset(source_sampler, IN.texcoord, 1, -7).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_17 * float3(log2( 0.00001f + intensity_17 ), intensity_17, 1.0f);
	
	float weight_18= tex2D_offset(weight_sampler, IN.texcoord, 1, -5).g;		
//	float intensity_18= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 1, -5));
	float intensity_18= tex2D_offset(source_sampler, IN.texcoord, 1, -5).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_18 * float3(log2( 0.00001f + intensity_18 ), intensity_18, 1.0f);

	float weight_19= tex2D_offset(weight_sampler, IN.texcoord, 1, -3).g;		
//	float intensity_19= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 1, -3));
	float intensity_19= tex2D_offset(source_sampler, IN.texcoord, 1, -3).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_19 * float3(log2( 0.00001f + intensity_19 ), intensity_19, 1.0f);

	float weight_20= tex2D_offset(weight_sampler, IN.texcoord, 1, -1).g;		
//	float intensity_20= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 1, -1));
	float intensity_20= tex2D_offset(source_sampler, IN.texcoord, 1, -1).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_20 * float3(log2( 0.00001f + intensity_20 ), intensity_20, 1.0f);

	float weight_21= tex2D_offset(weight_sampler, IN.texcoord, 1, 1).g;		
//	float intensity_21= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 1, 1));
	float intensity_21= tex2D_offset(source_sampler, IN.texcoord, 1, 1).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_21 * float3(log2( 0.00001f + intensity_21 ), intensity_21, 1.0f);

	float weight_22= tex2D_offset(weight_sampler, IN.texcoord, 1, 3).g;		
//	float intensity_22= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 1, 3));
	float intensity_22= tex2D_offset(source_sampler, IN.texcoord, 1, 3).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_22 * float3(log2( 0.00001f + intensity_22 ), intensity_22, 1.0f);

	float weight_23= tex2D_offset(weight_sampler, IN.texcoord, 1, 5).g;		
//	float intensity_23= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 1, 5));
	float intensity_23= tex2D_offset(source_sampler, IN.texcoord, 1, 5).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_23 * float3(log2( 0.00001f + intensity_23 ), intensity_23, 1.0f);

	float weight_24= tex2D_offset(weight_sampler, IN.texcoord, 1, 7).g;		
//	float intensity_24= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 1, 7));
	float intensity_24= tex2D_offset(source_sampler, IN.texcoord, 1, 7).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_24 * float3(log2( 0.00001f + intensity_24 ), intensity_24, 1.0f);

    float weight_25= tex2D_offset(weight_sampler, IN.texcoord, 3, -7).g;		
//	float intensity_25= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 3, -7));
	float intensity_25= tex2D_offset(source_sampler, IN.texcoord, 3, -7).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_25 * float3(log2( 0.00001f + intensity_25 ), intensity_25, 1.0f);
	
	float weight_26= tex2D_offset(weight_sampler, IN.texcoord, 3, -5).g;		
//	float intensity_26= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 3, -5));
	float intensity_26= tex2D_offset(source_sampler, IN.texcoord, 3, -5).a;					    // actual intensity stored in the alpha channel
	average.xyz += weight_26 * float3(log2( 0.00001f + intensity_26 ), intensity_26, 1.0f);

	float weight_27= tex2D_offset(weight_sampler, IN.texcoord, 3, -3).g;		
//	float intensity_27= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 3, -3));
	float intensity_27= tex2D_offset(source_sampler, IN.texcoord, 3, -3).a;					    // actual intensity stored in the alpha channel
	average.xyz += weight_27 * float3(log2( 0.00001f + intensity_27 ), intensity_27, 1.0f);

	float weight_28= tex2D_offset(weight_sampler, IN.texcoord, 3, -1).g;		
//	float intensity_28= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 3, -1));
	float intensity_28= tex2D_offset(source_sampler, IN.texcoord, 3, -1).a;				        // actual intensity stored in the alpha channel
	average.xyz += weight_28 * float3(log2( 0.00001f + intensity_28 ), intensity_28, 1.0f);

	float weight_29= tex2D_offset(weight_sampler, IN.texcoord, 3, 1).g;		
//	float intensity_29= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 3, 1));
	float intensity_29= tex2D_offset(source_sampler, IN.texcoord, 3, 1).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_29 * float3(log2( 0.00001f + intensity_29 ), intensity_29, 1.0f);

	float weight_30= tex2D_offset(weight_sampler, IN.texcoord, 3, 3).g;		
//	float intensity_30= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 3, 3));
	float intensity_30= tex2D_offset(source_sampler, IN.texcoord, 3, 3).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_30 * float3(log2( 0.00001f + intensity_30 ), intensity_30, 1.0f);

	float weight_31= tex2D_offset(weight_sampler, IN.texcoord, 3, 5).g;		
//	float intensity_31= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 3, 5));
	float intensity_31= tex2D_offset(source_sampler, IN.texcoord, 3, 5).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_31 * float3(log2( 0.00001f + intensity_31 ), intensity_31, 1.0f);

	float weight_32= tex2D_offset(weight_sampler, IN.texcoord, 3, 7).g;		
//	float intensity_32= color_to_intensity( tex2D_offset(source_sampler, IN.texcoord, 3, 7));
	float intensity_32= tex2D_offset(source_sampler, IN.texcoord, 3, 7).a;						// actual intensity stored in the alpha channel
	average.xyz += weight_32 * float3(log2( 0.00001f + intensity_32 ), intensity_32, 1.0f);

//	average /= (8.0f * 4.0f);
	average.xy /= average.z;
	average.y= log2( 0.00001f + average.y );
	
	return (average.y * scale.x + average.x * (1.0f - scale.x));
}
