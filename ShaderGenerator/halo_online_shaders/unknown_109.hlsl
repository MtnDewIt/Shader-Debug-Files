
#define POSTPROCESS_USE_CUSTOM_VERTEX_SHADER

#include "global.fx"
#include "hlsl_vertex_types.fx"
#include "utilities.fx"
#include "postprocess.fx"
//@generate screen

LOCAL_SAMPLER_2D(psNormalSampler, 0);
LOCAL_SAMPLER_2D(psDepthSampler, 1);

screen_output default_vs(screen_output IN)
{
	screen_output OUT;
	OUT.texcoord=		IN.texcoord;
	OUT.position.xy=	IN.position;
	OUT.position.z=     0.0f;
	OUT.position.w=	    1.0f;
	return OUT;
}

float4 default_ps(vertex_type IN) : SV_Target
{
    float4 OUT;

    float3 normal = sample2D(psNormalSampler, IN.texcoord).xyz;

    float length = sqrt(dot(normal, normal));

    normal /= length;

    OUT.xy = normal.xy;

    float depth = sample2D(psDepthSampler, IN.texcoord).x;

    float2 constants = float2(1, 0);
    OUT.zw = depth * constants.xy + constants.yx;

    return OUT;
}