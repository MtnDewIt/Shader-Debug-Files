
#include "global.fx"
#include "hlsl_vertex_types.fx"
#include "utilities.fx"
#include "postprocess.fx"
//@generate screen

float4 default_ps(screen_output IN) : SV_Target
{
    return float4(1, 0, 0, 0);
}