
#define POSTPROCESS_USE_CUSTOM_VERTEX_SHADER

#include "global.fx"
#include "hlsl_vertex_types.fx"
#include "utilities.fx"
#include "postprocess.fx"
//@generate screen

screen_output default_vs(screen_output IN)
{
	screen_output OUT;
	OUT.texcoord=		IN.texcoord;
	OUT.position.xy=	IN.position;
	OUT.position.z=     0.0f;
	OUT.position.w=	    1.0f;
	return OUT;
}

float4 default_ps(screen_output IN) : SV_Target
{
    return float4(1, 0, 0, 0);
}