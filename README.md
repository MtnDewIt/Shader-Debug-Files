# TagTool Shader Debug Files

This is an updated version of the existing shader source for TagTool's Shader Generator, as well as some additional modified files for TagTool.

These are designed to assist in the reverse engineering of MS23 / ElDewrito shader data.  

The general idea behind this is to attempt to generate HLSL which can in turn generate shaders that are 1:1 with what exists in MS23 / ElDewrito, or barring that get as close as possible.

All modified shader source files and modified TagTool files have been pulled from their respective repositories:  
https://github.com/Beatthezombie/HaloShaderGenerator  
https://github.com/TheGuardians/TagTool

Below is a detailed breakdown of all changes and modifications that have been applied to the HLSL code included in this repository.
#

&nbsp;   

# Chud Shaders
Out of the 26 chud shaders included by default within MS23 / ElDewrito, 25 of them will compile perfectly fine by default.  

Out of the 25 that do compile, 4 of them exhibit differences between the shader data generated and the data that exists in MS23 / ElDewrito.  

One of the shaders will not compile by default, as this shader is specific to Halo Online, and thus no shader source exists for it by default.  
#

## chud_cortana_camera
Compiled shader data is 1:1.

No modifications were required.
##

## chud_cortana_composite
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

There appear to be some minor issues regarding the order of certain instructions, as well as some of the constants.

Having the ```APPLY_FIXES``` macro undefined fixes some minor differences, however, the shader still isn't 1:1.

A more accurate pixel shader implementation exists in an older version of TagTool's shader source files:  
[chud_cortana_composite.hlsl](https://github.com/Beatthezombie/HaloShaderGenerator/blob/74c0aaf386299ac3c35143c73fd2708b669e59e7/HaloShaderGenerator/hlsl/explicit/chud_cortana_composite.hlsl)

This implementation does still have minor differences but at least the order of instructions is mostly accurate.

More research is required before 1:1 shader data can be generated.
##

## chud_cortana_offscreen
Compiled shader data is 1:1.

No modifications were required.
##

## chud_cortana_screen
Compiled shader data is 1:1.

No modifications were required.
##

## chud_cortana_screen_final
Compiled shader data is 1:1.

No modifications were required.
##

## chud_crosshair
Compiled shader data is 1:1.

No modifications were required.
##

## chud_directional_damage
Compiled shader data is 1:1.

No modifications were required.
##

## chud_directional_damage_apply
Compiled shader data is 1:1.

No modifications were required.
##

## chud_emblem
Compiled shader data is 1:1.

No modifications were required.
##

## chud_medal
Compiled shader data is 1:1.

No modifications were required.
##

## chud_meter
Compiled shader data is 1:1.

No modifications were required.
##

## chud_meter_chapter
Compiled shader data is 1:1.

No modifications were required.
##

## chud_meter_double_gradient
Compiled shader data is 1:1.

No modifications were required.
##

## chud_meter_gradient
Compiled shader data is 1:1.

No modifications were required.
##

## chud_meter_gradient_inverse
No shader source exists by default for this shader.

Most of the issues are with the pixel shader data.

The vertex shader data uses the default vertex shader function from ```chud_meter_gradient```, which generates 1:1 vertex shader data, so no custom implementation was required.

Looking at the disassembled pixel shader data from MS23 / ElDewrito, the data is fairly similar to the ```chud_meter_gradient``` shader.

The only difference between the pixel data for this shader and the pixel data for ```chud_meter_gradient``` is that the texture coordinates are inverted before being parsed into the current meter value.

By default, this shader is unknown and thus does not have a name.

Given that the only difference between this shader and the ```chud_meter_gradient``` shader is that the texture coordinates get inverted, the name ```chud_meter_gradient_inverse``` seemed the most appropriate.

The name does not affect the functionality of the shader and is purely for semantics, and maintaining consistency.

This implementation generates 1:1 shader data.
##

## chud_meter_radial_gradient
Compiled shader data is 1:1.

No modifications were required.
##

## chud_meter_shield
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

Having the ```APPLY_FIXES``` macro undefined generates a pixel shader with 1:1 data.
##

## chud_meter_single_color
Compiled shader data is 1:1.

No modifications were required.
##

## chud_navpoint
Compiled shader data is 1:1.

No modifications were required.
##

## chud_really_simple
Compiled shader data is 1:1.

No modifications were required.
##

## chud_sensor
Compiled shader data is 1:1.

No modifications were required.
##

## chud_simple
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

Having the ```APPLY_FIXES``` macro undefined generates a pixel shader with 1:1 data.
##

## chud_solid
Compiled shader data is 1:1.

No modifications were required.
##

## chud_text_simple
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

Having the ```APPLY_FIXES``` macro undefined generates a pixel shader with 1:1 data.
##

## chud_texture_cam
Compiled shader data is 1:1.

No modifications were required.
##

## chud_turbulence
Compiled shader data is 1:1.

No modifications were required.
##

&nbsp;    

# Explicit Shaders
Out of the 110 explicit shaders included by default within MS23 / ElDewrito, 78 of them will compile perfectly fine by default.

Out of the 78 that do compile, 33 of them exhibit differences between the shader data generated and the data that exists in MS23 / ElDewrito.

There are also 12 shaders that lack existing shader code by default, and thus are unable to be compiled.

Out of these 12 shaders, 10 are completely unknown, and thus do not currently have functional shader code.
#

## add
Compiled shader data is 1:1.

No modifications were required.
##

## add_downsampled
Compiled shader data is 1:1.

No modifications were required.
##

## alpha_test_explicit
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The disassembled pixel shader data for this shader contains an extra instruction when compared to the pixel shader data generated by default.

This extra instruction corresponds to the ```ssr_color``` value in the ```accum_pixel``` struct, which in this instance is being set to 0 in the ```convert_to_render_target``` function.

Having the ```SSR_ENABLE``` macro defined, along with the corresponding code added to the return function in the default pixel shader function in [alpha_test_explicit.hlsl #L54](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/alpha_test_explicit.hlsl#L54), generates a pixel shader with 1:1 data.
```
return convert_to_render_target(pixel, false, false
#ifdef SSR_ENABLE  
, 0  
#endif
);
```
##

## apply_color_matrix
Compiled shader data is 1:1.

No modifications were required.
##

## beam_update
This shader does not compile at all by default

The reason why this shader doesn't compile is due to missing ```#ifdef``` functions.

By default, this shader will attempt to compile for PC GPU, which the compiler and HLSL don't fully support, so naturally it'll throw an exception at some point during compilation.

The fix for this issue is to add some additional ```#ifdef``` functions to check if the ```PC_GPU``` macro has been defined.

If the macro hasn't been defined, then we can run the default functions for the shader, which by default are never called on due to the missing flags.

The ```#ifdef``` functions themselves were pulled from [contrail_update.hlsl #L101](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/contrail_update.hlsl#L101) as it has similar functions and a similar implementation.

Applying the following patches allows the shader to compile, and generates 1:1 shader data.

[beam_update.hlsl #L87](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/beam_update.hlsl#L87)
```
#if DX_VERSION == 9

#ifndef PC_CPU
float4 default_vs(vertex_type vIN) : SV_Position
#else
void default_vs( vertex_type vIN )
#endif
{
//	asm {
//		config VsExportMode=multipass   // export only shader
//	};
#ifndef PC_CPU 
	return float4(1,2,3,4);
#else
	beam_main(vIN);
#endif
}
#elif DX_VERSION == 11
```
##

## blend3
Compiled shader data is 1:1.

No modifications were required.
##

## bloom_add_alpha1
Compiled shader data is 1:1.

No modifications were required.
##

## bloom_curve
No shader source exists by default for this shader.

Looking at the disassembled shader data from MS23 / ElDewrito, there are a few discrepancies when compared to some of the other shader data.

The header for the disassembled pixel shader data states that this shader was generated using the D3DX9 Shader Compiler rather than the HLSL Shader Compiler.  
```Generated by Microsoft (R) D3DX9 Shader Compiler```

There is also an issue with one of the pixel shader constants where it appears to be using a NaN value.  
```def c0, -1.#IND, 0, 0, 0```

Since the version of the compiler that TagTool uses can't accept NaN values, recreating 1:1 pixel shader data is next to impossible.

The current implementation matches the original shader data almost perfectly. Due to the aforementioned issue, however, the NaN value was replaced with the equivalent valid floating point value.  
```def c0, -1, 0, 0, 0```

The vertex shader data was generated using the default vertex shader function in [postprocess.fx](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/postprocess.fx#L30) which generates 1:1 shader data so no modifications were required.

Looking at the differences between the data from the MS23 shader, and the Halo 3 / Halo 3 ODST shader, the 360 shader does have a lot more going on internally.

However, since a PC implementation of this shader data doesn't exist, it would be next to impossible to replicate easily.
##

## blur_11_horizontal
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The main issue with the pixel shader data is that by default, the compiled data does not line up with what exists by default in MS23 / ElDewrito.

This is because some of the functions within the HLSL have been modified.

While these functions do not affect the functionality of the shader when compiled, having the ability to generate the original data may prove useful if the original shader data is required.

Having the ```APPLY_FIXES``` macro undefined, and applying the following patches to the default pixel shader function generates 1:1 data.

[blur_11_horizontal.hlsl #L46](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/blur_11_horizontal.hlsl#L46)
```
#ifdef APPLY_FIXES
    return blur_13_h(sample);
#endif
```
[blur_11_horizontal.hlsl #L112](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/blur_11_horizontal.hlsl#L112)
```
#ifdef APPLY_FIXES
    float2 pixel_size_scale = float2(1.0f / 1152, 1.0f / 640) / pixel_size.xy;
	
	  float4 color=	(1.0   + 9.0)	* sample2D(target_sampler, sample + offset[0] * pixel_size * pixel_size_scale) +
					(36.0  + 84.0)	* sample2D(target_sampler, sample + offset[1] * pixel_size * pixel_size_scale) +
					(126.0 + 126.0)	* sample2D(target_sampler, sample + offset[2] * pixel_size * pixel_size_scale) +
					(84.0  + 36.0)	* sample2D(target_sampler, sample + offset[3] * pixel_size * pixel_size_scale) +
					(1.0   + 9.0)	* sample2D(target_sampler, sample + offset[4] * pixel_size * pixel_size_scale);
#else
    float4 color=	(1.0   + 9.0)	* sample2D(target_sampler, sample + offset[0] * pixel_size) +
					(36.0  + 84.0)	* sample2D(target_sampler, sample + offset[1] * pixel_size) +
					(126.0 + 126.0)	* sample2D(target_sampler, sample + offset[2] * pixel_size) +
					(84.0  + 36.0)	* sample2D(target_sampler, sample + offset[3] * pixel_size) +
					(1.0   + 9.0)	* sample2D(target_sampler, sample + offset[4] * pixel_size);
#endif
```

These modifications do not impact the ability to generate shader data using the modified HLSL which exists by default.
##

## blur_11_vertical
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The main issue with the pixel shader data is that by default, the compiled data does not line up with what exists by default in MS23 / ElDewrito.

This is because some of the functions within the HLSL have been modified.

While these functions do not affect the functionality of the shader when compiled, having the ability to generate the original data may prove useful if the original shader data is required.

Having the ```APPLY_FIXES``` macro undefined, and applying the following patches to the default pixel shader function generates 1:1 data.

[blur_11_vertical #L46](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/blur_11_vertical.hlsl#L46)
```
#ifdef APPLY_FIXES
    return blur_13_v(sample);
#endif
```
[blur_11_vertical #L111](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/blur_11_vertical.hlsl#L111)
```
#ifdef APPLY_FIXES
    float2 pixel_size_scale = float2(1.0f / 1152, 1.0f / 640) / pixel_size.xy;
	
	float4 color=	(1.0   + 9.0)	* sample2D(target_sampler, sample + offset[0] * pixel_size * pixel_size_scale) +
					(36.0  + 84.0)	* sample2D(target_sampler, sample + offset[1] * pixel_size * pixel_size_scale) +
					(126.0 + 126.0)	* sample2D(target_sampler, sample + offset[2] * pixel_size * pixel_size_scale) +
					(84.0  + 36.0)	* sample2D(target_sampler, sample + offset[3] * pixel_size * pixel_size_scale) +
					(1.0   + 9.0)	* sample2D(target_sampler, sample + offset[4] * pixel_size * pixel_size_scale);
#else
    float4 color=	(1.0   + 9.0)	* sample2D(target_sampler, sample + offset[0] * pixel_size) +
					(36.0  + 84.0)	* sample2D(target_sampler, sample + offset[1] * pixel_size) +
					(126.0 + 126.0)	* sample2D(target_sampler, sample + offset[2] * pixel_size) +
					(84.0  + 36.0)	* sample2D(target_sampler, sample + offset[3] * pixel_size) +
					(1.0   + 9.0)	* sample2D(target_sampler, sample + offset[4] * pixel_size);
#endif
```

These modifications do not impact the ability to generate shader data using the modified HLSL which exists by default.
##

## bspline_resample
Compiled shader data is 1:1.

No modifications were required.
##

## chud_overlay_blend
Compiled shader data is 1:1.

No modifications were required.
##

## contrail_spawn
This shader does not compile at all by default

This is due to a missing include statement.

This shader calls on ```BEGIN_REGISTER_GROUP``` which is defined in [register_group.fx #L10](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/) which isn't included by default.

Applying the following patches allows the shader to compile, and generates 1:1 shader data.

[contrail_profile.fx #L1](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/contrail_profile.fx#L1)
```
#include "register_group.fx"

#ifndef _CONTRAIL_PROFILE_FX_
#define _CONTRAIL_PROFILE_FX_
```
##

## contrail_update
Compiled shader data is 1:1.

No modifications were required.
##

## copy
Compiled shader data is 1:1.

No modifications were required.
##

## copy_rgbe_to_rgb
Compiled shader data is 1:1.

No modifications were required.
##

## copy_surface
This shader does not compile at all by default

This is due to the pixel shader function trying to parse data through the vertex shader function when a vertex type hasn't been defined yet.

The solution for this is to add ```#ifdef``` functions to check if the shader being compiled is a vertex shader.

This should avoid the issue of an undefined vertex type being parsed into the vertex shader function.

Applying the following patches allows the shader to compile, and generates 1:1 shader data.

[postprocess.fx #L28](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/postprocess.fx#L28)
```
#ifdef VERTEX_SHADER

#ifndef POSTPROCESS_USE_CUSTOM_VERTEX_SHADER

screen_output default_vs(vertex_type IN)
{
	screen_output OUT;
	OUT.texcoord=		IN.texcoord;
	OUT.position.xy=	IN.position;
	OUT.position.zw=	1.0f;
#ifdef POSTPROCESS_COLOR	
	OUT.color=			IN.color;
#endif // POSTPROCESS_COLOR
	return OUT;
}

#endif

#endif
```
##

## crop
Compiled shader data is 1:1.

No modifications were required.
##

## cubemap_clamp
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The only issue with the shader data generated by default is that one of the parameters uses a different name compared to what exists in MS23 / ElDewrito by default.

This doesn't affect the functionality of the shader at all and is purely an issue of mismatched identifiers.

Applying the following patches to the default pixel shader function and the associated registers generates 1:1 data.

[cubemap_clamp.hlsl #L11](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/cubemap_clamp.hlsl#L11)
```
#define scale scale
```
[cubemap_registers.fx #L15](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/cubemap_registers.fx#L15)
```
PIXEL_CONSTANT(float4, scale, k_ps_cubemap_param);
```

These changes DO NOT affect the functionality of the shader whatsoever and are purely for maintaining consistency between the shader data which exists by default, and the data generated by the shader source.
##

## cubemap_divide
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The only issue with the shader data generated by default is that one of the parameters uses a different name compared to what exists in MS23 / ElDewrito by default.

This doesn't affect the functionality of the shader at all and is purely an issue of mismatched identifiers.

Applying the following patches to the default pixel shader function and the associated registers generates 1:1 data.

[cubemap_divide.hlsl #L12](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/cubemap_divide.hlsl#L12)
```
#define scale scale
```
[cubemap_registers.fx #L15](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/cubemap_registers.fx#L15)
```
PIXEL_CONSTANT(float4, scale, k_ps_cubemap_param);
```

These changes DO NOT affect the functionality of the shader whatsoever and are purely for maintaining consistency between the shader data which exists by default, and the data generated by the shader source.
##

## cubemap_phi_blur
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The only issue with the shader data generated by default is that one of the parameters uses a different name compared to what exists in MS23 / ElDewrito by default.

This doesn't affect the functionality of the shader at all and is purely an issue of mismatched identifiers.

Applying the following patches to the default pixel shader function and the associated registers generates 1:1 data.

[cubemap_phi_blur.hlsl #L12](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/cubemap_phi_blur.hlsl#L12)
```
#define delta delta.x
```
[cubemap_registers.fx #L11](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/cubemap_registers.fx#L11)
```
PIXEL_CONSTANT(float, delta, k_ps_cubemap_param);
PIXEL_CONSTANT(float2, source_size, k_ps_cubemap_source_size);
```

These changes DO NOT affect the functionality of the shader whatsoever and are purely for maintaining consistency between the shader data which exists by default, and the data generated by the shader source.
##

## cubemap_theta_blur
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The only issue with the shader data generated by default is that one of the parameters uses a different name compared to what exists in MS23 / ElDewrito by default.

This doesn't affect the functionality of the shader at all and is purely an issue of mismatched identifiers.

Applying the following patches to the default pixel shader function and the associated registers generates 1:1 data.

[cubemap_theta_blur.hlsl #L12](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/cubemap_theta_blur.hlsl#L12)
```
#define delta delta.x
```
[cubemap_registers.fx #L11](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/cubemap_registers.fx#L11)
```
PIXEL_CONSTANT(float, delta, k_ps_cubemap_param);
PIXEL_CONSTANT(float2, source_size, k_ps_cubemap_source_size);
```

These changes DO NOT affect the functionality of the shader whatsoever and are purely for maintaining consistency between the shader data which exists by default, and the data generated by the shader source.
##

## custom_gamma_correct
This shader does not compile at all by default

This is due to the pixel shader function trying to parse data through the vertex shader function when a vertex type hasn't been defined yet.

The solution for this is to add ```#ifdef``` functions to check if the shader being compiled is a vertex shader.

This should avoid the issue of an undefined vertex type being parsed into the vertex shader function.

Applying the following patches allows the shader to compile, and generates 1:1 shader data.

[postprocess.fx #L28](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/postprocess.fx#L28)
```
#ifdef VERTEX_SHADER

#ifndef POSTPROCESS_USE_CUSTOM_VERTEX_SHADER

screen_output default_vs(vertex_type IN)
{
	screen_output OUT;
	OUT.texcoord=		IN.texcoord;
	OUT.position.xy=	IN.position;
	OUT.position.zw=	1.0f;
#ifdef POSTPROCESS_COLOR	
	OUT.color=			IN.color;
#endif // POSTPROCESS_COLOR
	return OUT;
}

#endif

#endif
```
##

## debug
This shader does not compile at all by default

This is due to the pixel shader function trying to parse data through the vertex shader function when a vertex type hasn't been defined yet.

The solution for this is to add ```#ifdef``` functions to check if the shader being compiled is a vertex shader.

This should avoid the issue of an undefined vertex type being parsed into the vertex shader function.

Applying the following patches allows the shader to compile, and generate shader data that is almost 1:1

[debug.hlsl #L30](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/debug.hlsl#L30)
```
#ifdef VERTEX_SHADER

debug_output default_vs(vertex_type IN)
{
    debug_output OUT;

    OUT.HPosition= mul(float4(IN.position, 1.0f), View_Projection);
	OUT.Color= IN.color;
	
    return OUT;
}

#endif
```

Having the ```SSR_ENABLE``` macro defined, along with the corresponding code added to the return function in the default pixel shader function in [debug.hlsl #L44](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/debug.hlsl#L44), generates a pixel shader with 1:1 data.
```
return convert_to_render_target(IN.Color, false, false
#ifdef SSR_ENABLE
, 0
#endif
);
```
##

## debug2d
This shader does not compile at all by default

This is due to the pixel shader function trying to parse data through the vertex shader function when a vertex type hasn't been defined yet.

The solution for this is to add ```#ifdef``` functions to check if the shader being compiled is a vertex shader.

This should avoid the issue of an undefined vertex type being parsed into the vertex shader function.

Applying the following patches allows the shader to compile, and generates 1:1 shader data.

[debug2d.hlsl #L16](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/debug2d.hlsl#L16)
```
#ifdef VERTEX_SHADER

debug_output default_vs(vertex_type IN)
{
   debug_output OUT;

   OUT.HPosition.xy= IN.position.xy;
   OUT.HPosition.zw= 1.f;
   OUT.Color= IN.color;

   return OUT;
}

#endif
```
##

## decorator_default
Compiled shader data is 1:1.

No modifications were required.

Compiled shader data doesn't match what exists by default in MS23, but does match the data that exists by default in ElDewrito 0.7.1
##

## decorator_edit
Compiled shader data isn't entirely 1:1 by default.

There are issues with both the pixel shader data and the vertex shader data.

The main issue with the vertex shader data is caused by some changes made to the functions which the default vertex function calls on.

Applying the following patches to the quaternion functions generates 1:1 vertex shader data.

[quaternions.fx #L23](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/quaternions.fx#L23)
```
#ifdef DECORATOR_EDIT
    result = float4(cross(q0.xyz, q1.xyz),							// crs result.xyz_, q0.xyz ,  q1.xyz
    		-dot(q0.xyz, q1.xyz));									// dp3 result.___w, q0.xyz , -q1.xyz
    result.xyz  += q0.w * q1.xyz;									// mad result.xyz_, q0.www ,  q1.xyz ,  result.xyz 
    result.xyzw += q1.w * q0.xyzw;									// mad result.xyzw, q1.wwww,  q0.xyzw,  result.xyzw
#else
    result.w = dot(q0.xyz, -q1.xyz);
    result.xyz = q0.zxy * q1.yzx;
    result.xyz = q0.yzx * q1.zxy + -result.xyz;
    result.xyz = q0.w * q1.xyz + result.xyz;
    result.xyzw = q1.w * q0 + result;
#endif
```
[quaternions.fx #L53](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/quaternions.fx#L53)
```
#ifdef DECORATOR_EDIT
    result= quaternion_multiply(q0, float4(-q1.xyz, q1.w));
#else
    result.w = dot(q0.xyz, q1.xyz);
    result.xyz = q0.zxy * -q1.yzx;
    result.xyz = q0.yzx * -q1.zxy + -result.xyz;
    result.xyz = q0.w * -q1.xyz + result.xyz;
    result.xyzw = q1.w * q0 + result;
#endif
```

The disassembled pixel shader data for this shader contains an extra instruction when compared to the pixel shader data generated by default.

This extra instruction corresponds to the ```ssr_color``` value in the ```accum_pixel``` struct, which in this instance is being set to 0 in the ```convert_to_render_target``` function.

Having the ```SSR_ENABLE``` macro defined, along with the corresponding code added to the return function in the default pixel shader function in [decorators.hlsl #L106](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/decorators.hlsl#L106), generates a pixel shader with 1:1 data.
```
return convert_to_render_target(color, true, false
#ifdef SSR_ENABLE
, 0
#endif
);
```
A minor note about this shader, the rest of the decorator shaders do appear to use the unmodified quaternion functions in ElDewrito 0.7.1, so the changes made to the quaternion functions may not be entirely necessary, however to maintain parity with the default data, these fixes are necessary.
##

## decorator_no_wind
Compiled shader data is 1:1.

No modifications were required.

Compiled shader data doesn't match what exists by default in MS23, but does match the data that exists by default in ElDewrito 0.7.1
##

## decorator_shaded
Compiled shader data is 1:1.

No modifications were required.

Compiled shader data doesn't match what exists by default in MS23, but does match the data that exists by default in ElDewrito 0.7.1
##

## decorator_static
Compiled shader data is 1:1.

No modifications were required.

Compiled shader data doesn't match what exists by default in MS23, but does match the data that exists by default in ElDewrito 0.7.1
##

## decorator_sun
Compiled shader data is 1:1.

No modifications were required.

Compiled shader data doesn't match what exists by default in MS23, but does match the data that exists by default in ElDewrito 0.7.1
##

## decorator_wavy
Compiled shader data is 1:1.

No modifications were required.

Compiled shader data doesn't match what exists by default in MS23, but does match the data that exists by default in ElDewrito 0.7.1
##

## displacement
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The main issue with the pixel shader data is that it is missing a single instruction when compared to the pixel shader data generated by default

Applying the following patches to the default pixel shader function generates 1:1 pixel shader data.

[displacement.hlsl #L59](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/displacement.hlsl#L59)
```
float2 displacement= 0.5f * 2.0f * max_displacement * (screen_constants.zw + screen_constants.zw) * (sample2D(displacement_sampler, IN.Texcoord).xy - distortion_offset);		// screen_constants.zw is distortion scale in x and y directions
```
[displacement.hlsl #L61](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/displacement.hlsl#L61)
```
float2 displacement= 2.0f * max_displacement * (screen_constants.zw + screen_constants.zw) * (sample2D(displacement_sampler, IN.Texcoord).xy - distortion_offset);		// screen_constants.zw is distortion scale in x and y directions
```
##

## displacement_motion_blur
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

There are a few issues with this shader.

Some of the issues can be mitigated by leaving the ```DISTORTION_MULTISAMPLED``` macro undefined, which results in slightly more accurate shader data when compared to what gets generated by default.

This can be done by commenting out the shader ```#define``` in the HLSL file.  
[displacement_motion_blur.hlsl #L8](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/displacement_motion_blur.hlsl#L8)
```
//#define DISTORTION_MULTISAMPLED 1
```

The other issue with the pixel shader data is slightly more complex.

The pixel shader data that exists by default appears to ignore the check performed on ```combined_weight``` and just loops based on the ```num_taps``` variable, inverting the alpha channel for each texture sample and then accumulating the color values.

After this loop is performed, some extra extraneous functions prepare certain variables for use in the output function by inverting the alpha channel, and then checking if the accumulated color value does not equal zero.

Applying the following patches to the default pixel shader function, which essentially replaces the existing check performed on ```combined_weight``` with a new loop generates 1:1 vertex shader data.

[displacement_motion_blur.hlsl #L116](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/displacement_motion_blur.hlsl#L116)
```
for (int i = 0; i < num_taps; ++ i)
{
	current_texcoords+= uv_delta;
	float4 ldr_value= sample2D(ldr_buffer, current_texcoords);
	ldr_value.a= 1-ldr_value.a;
	accum_color.rgb+= ldr_value.rgb * ldr_value.a;
	accum_color.a+= ldr_value.a;
}

center_falloff_scale_factor = center_color.a * -center_falloff_scale_factor + 0.01;
accum_color = center_falloff_scale_factor < 0.0f ? accum_color : 0.0f;
```
##

## double_gradient
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

Having the ```APPLY_FIXES``` macro undefined generates a pixel shader with 1:1 data.
##

## downsample_2x2
Compiled shader data is 1:1.

No modifications were required.
##

## downsample_4x4_block
Compiled shader data is 1:1.

No modifications were required.
##

## downsample_4x4_block_bloom
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The main issue with the pixel shader data is that by default it appears to be using some Xbox-specific functions instead of the PC functions.

Every time the shader increments the ```color``` variable based on the texture sample offsets, it is missing an extra instruction, where it is only adding the ```rgb``` components from the texture offset, instead of adding the ```rgb``` component squared

The solution here is to invert all the ```#ifdef``` statements to ```#ifndef``` so that instead of using the PC functions, it'll use the Xbox functions.

Applying the following patches to the default pixel shader function generates 1:1 pixel shader data.

[downsample_4x4_block_bloom.hlsl #L24](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/downsample_4x4_block_bloom.hlsl#L24)
```
#ifndef pc
		color += sample.rgb;
#else
		color += sample.rgb * sample.rgb;
#endif
	sample= tex2D_offset(dark_source_sampler, IN.texcoord, +1, -1);
#ifndef pc
		color += sample.rgb;
#else
		color += sample.rgb * sample.rgb;
#endif
	sample= tex2D_offset(dark_source_sampler, IN.texcoord, -1, +1);
#ifndef pc
		color += sample.rgb;
#else
		color += sample.rgb * sample.rgb;
#endif
	sample= tex2D_offset(dark_source_sampler, IN.texcoord, +1, +1);
#ifndef pc
		color += sample.rgb;
#else
		color += sample.rgb * sample.rgb;
#endif
```
##

## downsample_4x4_block_bloom_ldr
Compiled shader data is 1:1.

No modifications were required.
##

## downsample_4x4_block_bloom_new
No shader source exists by default for this shader.

Looking at the disassembled shader data from MS23 / ElDewrito, there are a few discrepancies when compared to some of the other shader data.

The header for the disassembled pixel shader data states that this shader was generated using the D3DX9 Shader Compiler rather than the HLSL Shader Compiler.  
```Generated by Microsoft (R) D3DX9 Shader Compiler```

There is also an issue with one of the pixel shader constants where it appears to be using a NaN value.  
```def c0, -1.#IND, 0, 0, 0```

Since the version of the compiler that TagTool uses can't accept NaN values, recreating 1:1 pixel shader data is next to impossible.

The current implementation matches the original shader data almost perfectly. Due to the aforementioned issue, however, the NaN value was replaced with the equivalent valid floating point value.  
```def c0, -1, 0, 0, 0```

The vertex shader data was generated using the default vertex shader function in [postprocess.fx](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/postprocess.fx#L30) which generates 1:1 shader data so no modifications were required.

Looking at the differences between the data from the MS23 shader, and the Halo 3 / Halo 3 ODST shader, the 360 shader does have a lot more going on internally.

However, since a PC implementation of this shader data doesn't exist, it would be next to impossible to replicate easily.
##

## downsample_4x4_bloom_dof
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The disassembled pixel shader data for this shader contains an extra instruction when compared to the pixel shader data generated by default.

This extra instruction corresponds to the ```ssr_color``` value in the ```accum_pixel``` struct, which in this instance is being set to 0 in the ```convert_to_render_target``` function.

Having the ```SSR_ENABLE``` macro defined, along with the corresponding code added to the pixel shader function in [downsample_4x4_bloom_dof.hlsl](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/downsample_4x4_bloom_dof.hlsl#L46), generates a pixel shader with 1:1 data.
```
#ifdef SSR_ENABLE
result.ssr_color = 0.0f;
#endif

return result;
```
##

## downsample_4x4_gaussian
Compiled shader data is 1:1.

No modifications were required.
##

## downsample_4x4_gaussian_bloom
Compiled shader data is 1:1.

No modifications were required.
##

## downsample_4x4_gaussian_bloom_ldr
Compiled shader data is 1:1.

No modifications were required.
##

## downsize_2x_target
Compiled shader data is 1:1.

No modifications were required.
##

## downsize_2x_to_bloom
Compiled shader data is 1:1.

No modifications were required.
##

## exposure_downsample
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The main issue with the pixel shader data that exists by default and the data that is generated is that default data appears to use an unrolled loop, whereas the generated data uses loops to generate the data for the ```average``` variable.

An implementation of an unrolled loop for ```exposure_downsample``` can be found here:

[exposure_downsample.hlsl](https://github.com/MtnDewIt/Shader-Debug-Files/blob/main/ShaderGenerator/halo_online_shaders/exposure_downsample.hlsl)
##

## final_composite
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The main issue with the pixel shader is that one of the ```#ifdef``` functions in the HLSL has been commented out.

This causes the Xbox, or rather the Xenon-specific function to execute instead of the PC function.

Applying the following patches to the ```default_calc_blend``` function, which gets called on by the default pixel shader function, generates 1:1 pixel shader data.

[final_composite_base.hlsl #L101](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/final_composite_base.hlsl#L101)
```
#ifdef pc
	return combined + bloom;
#else // XENON
    return combined.rgb * (texcoord.x > 0.5f ? 1.0f : bloom.a) + bloom.rgb;
#endif // XENON
```
##

## final_composite_debug
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The main issue with the pixel shader is that one of the ```#ifdef``` functions in the HLSL has been commented out.

This causes the Xbox, or rather the Xenon-specific function to execute instead of the PC function.

Applying the following patches to the ```default_calc_blend``` function, which gets called on by the default pixel shader function, generates 1:1 pixel shader data.

[final_composite_base.hlsl #L101](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/final_composite_base.hlsl#L101)
```
#ifdef pc
	return combined + bloom;
#else // XENON
    return combined.rgb * (texcoord.x > 0.5f ? 1.0f : bloom.a) + bloom.rgb;
#endif // XENON
```
##

## final_composite_dof
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The main issue with the pixel shader is that one of the ```#ifdef``` functions in the HLSL has been commented out.

This causes the Xbox, or rather the Xenon-specific function to execute instead of the PC function.

Applying the following patches to the ```default_calc_blend``` function, which gets called on by the default pixel shader function, generates 1:1 pixel shader data.

[final_composite_base.hlsl #L101](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/final_composite_base.hlsl#L101)
```
#ifdef pc
	return combined + bloom;
#else // XENON
    return combined.rgb * (texcoord.x > 0.5f ? 1.0f : bloom.a) + bloom.rgb;
#endif // XENON
```
##

## final_composite_zoom
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The main issue with the pixel shader is that one of the ```#ifdef``` functions in the HLSL has been commented out.

This causes the Xbox, or rather the Xenon-specific function to execute instead of the PC function.

Applying the following patches to the ```default_calc_blend``` function, which gets called on by the default pixel shader function, generates 1:1 pixel shader data.

[final_composite_base.hlsl #L101](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/final_composite_base.hlsl#L101)
```
#ifdef pc
	return combined + bloom;
#else // XENON
    return combined.rgb * (texcoord.x > 0.5f ? 1.0f : bloom.a) + bloom.rgb;
#endif // XENON
```
##

## fxaa
Compiled shader data is 1:1.

No modifications were required.
##

## gamma_correct
Compiled shader data is 1:1.

No modifications were required.
##

## gradient
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

Having the ```APPLY_FIXES``` macro undefined generates a pixel shader with 1:1 data.
##

## hdr_retrieve
Compiled shader data is 1:1.

No modifications were required.
##

## implicit_hill
This shader does not compile at all by default

This shader uses an invalid vertex type.

For some reason, the compiler is unable to properly parse the vertex type ```implicit_vertex``` even though it should be able to in theory

The solution to this issue is to simply replace the vertex type with its base value in the generator, which is ```implicit```.

Applying the following patches allows the shader to compile and solves the issue of invalid vertex types

[implicit_hill.hlsl #L16](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/implicit_hill.hlsl#L16)
```
//@generate implicit
```

This shader also contains an undefined register.

This is caused by a typo in the register declaration.

Applying the following patches allows the shader to compile, and generate shader data that is almost 1:1

[implicit_hill_registers.h #L20](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/implicit_hill_registers.h#L20)
```
#define k_vs_implicit_hill_use_zscales 	BOOL_CONSTANT_NAME(7)
```

Having the ```SSR_ENABLE``` macro defined, along with the corresponding code added to the return function in the default pixel shader function in [implicit_hill.hlsl #L79](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/implicit_hill.hlsl#L79), generates a pixel shader with 1:1 data.
```
return convert_to_render_target(float4(1.0f, 1.0f, 1.0f, 0.0f), false, false
#ifdef SSR_ENABLE
, 0
#endif
);
```
##

## kernel_5
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The main issue with the pixel shader data is that by default, the compiled data does not line up with what exists by default in MS23 / ElDewrito.

This is because some of the functions within the HLSL have been modified.

While these functions do not affect the functionality of the shader when compiled, having the ability to generate the original data may prove useful if the original shader data is required.

Having the ```APPLY_FIXES``` macro undefined, and applying the following patches to the default pixel shader function generates 1:1 data.

[kernel_5.hlsl #L18](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/kernel_5.hlsl#L18)
```
#ifdef APPLY_FIXES
	float4 color=	kernel[0].z * sample2D(target_sampler, sample + kernel[0].xy * pixel_size.xy * pixel_size_scale) +
					kernel[1].z * sample2D(target_sampler, sample + kernel[1].xy * pixel_size.xy * pixel_size_scale) +
					kernel[2].z * sample2D(target_sampler, sample + kernel[2].xy * pixel_size.xy * pixel_size_scale) +
					kernel[3].z * sample2D(target_sampler, sample + kernel[3].xy * pixel_size.xy * pixel_size_scale) +
					kernel[4].z * sample2D(target_sampler, sample + kernel[4].xy * pixel_size.xy * pixel_size_scale);
#else
   float4 color=	kernel[0].z * sample2D(target_sampler, sample + kernel[0].xy * pixel_size.xy) +
					kernel[1].z * sample2D(target_sampler, sample + kernel[1].xy * pixel_size.xy) +
					kernel[2].z * sample2D(target_sampler, sample + kernel[2].xy * pixel_size.xy) +
					kernel[3].z * sample2D(target_sampler, sample + kernel[3].xy * pixel_size.xy) +
					kernel[4].z * sample2D(target_sampler, sample + kernel[4].xy * pixel_size.xy);
#endif
```
##

## legacy_hud_bitmap
This shader does not compile at all by default

This is due to the pixel shader function trying to parse data through the vertex shader function when a vertex type hasn't been defined yet.

The solution for this is to add ```#ifdef``` functions to check if the shader being compiled is a vertex shader.

This should avoid the issue of an undefined vertex type being parsed into the vertex shader function.

Applying the following patches allows the shader to compile, and generates 1:1 shader data.

[postprocess.fx #L28](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/postprocess.fx#L28)
```
#ifdef VERTEX_SHADER

#ifndef POSTPROCESS_USE_CUSTOM_VERTEX_SHADER

screen_output default_vs(vertex_type IN)
{
	screen_output OUT;
	OUT.texcoord=		IN.texcoord;
	OUT.position.xy=	IN.position;
	OUT.position.zw=	1.0f;
#ifdef POSTPROCESS_COLOR	
	OUT.color=			IN.color;
#endif // POSTPROCESS_COLOR
	return OUT;
}

#endif

#endif
```
##

## legacy_meter
Compiled shader data is 1:1.

No modifications were required.
##

## lens_flare
Compiled shader data isn't entirely 1:1.

Most of the issues are with the vertex shader data.

The pixel shader data is 1:1, so no modifications were required.

There are 2 issues which specifically relate to the vertex shader data.

The first issue with the vertex shader data generated by default is that some of the parameters uses a different name compared to what exists in MS23 / ElDewrito by default.

This doesn't affect the functionality of the shader at all and is purely an issue of mismatched identifiers.

Applying the following patches to the HLSL parameters and the associated registers generates 1:1 data.

[lens_flare.hlsl #L18](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/lens_flare.hlsl#L18)
```
#define FLARE_ORIGIN flareOrigin_offsetBounds.xy
#define OFFSET_MIN flareOrigin_offsetBounds.z
#define OFFSET_MAX flareOrigin_offsetBounds.w
```
[lens_flare_registers.fx #L15](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/lens_flare_registers.fx#L15)
```
VERTEX_CONSTANT(float4, flareOrigin_offsetBounds, k_vs_lens_flare_origin_and_offset_bounds);
VERTEX_CONSTANT(float4, transformedAxes, k_vs_lens_flare_transformed_axes);
```
[lens_flare_registers.fx #L35](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/lens_flare.hlsl#L35)
```
position.xy = position.x * transformedAxes.xy + position.y * transformedAxes.zw;
```

These changes DO NOT affect the functionality of the shader whatsoever and are purely for maintaining consistency between the shader data which exists by default, and the data generated by the shader source.

The second issue has to do with the vertex shader function itself.

The entire default vertex shader function has been commented out, and replaced with a new vertex shader function

The solution, in this case, is to uncomment the unused default vertex function [default_vs](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/lens_flare.hlsl#L22) then comment out the second default vertex function.

[lens_flare.hlsl #L59](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/lens_flare.hlsl#L59)
```
//void default_vs(
//	vertex_type IN,
//	out float4 position : POSITION,
//	out float2 texcoord : TEXCOORD0)
//{
//	float sin_theta= sin(center_rotation.z);
//	float cos_theta= cos(center_rotation.z);
//
//	position.y= dot(float2(cos_theta, -sin_theta),	IN.position.xy);
//	position.x= dot(float2(sin_theta, cos_theta),	IN.position.xy);
//	position.xy= position.xy * flare_scale.xy * flare_scale.z + center_rotation.xy;
//
//	position.zw=	1.0f;
//	texcoord=		IN.texcoord;
//}
```

This will in turn generate vertex shader data that is 1:1 with MS23 / ElDewrito.
##

## light_volume_update
This shader does not compile at all by default

This is due to a missing include statement.

The shader calls on the struct ```s_property``` which is defined in [light_volume_property.fx #L8](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/light_volume_property.fx#L8), which isn't included by default.

Applying the following patches allows the shader to compile, and generates 1:1 shader data.

[light_volume_common.fx #L23](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/light_volume_common.fx#L23)
```
#include "light_volume_profile.fx"
#include "light_volume_property.fx"
#include "light_volume_state.fx"
```
##

## lightshafts
Compiled shader data is 1:1.

No modifications were required.
##

## overhead_map_geometry
Compiled shader data is 1:1.

No modifications were required.
##

## particle_spawn
This shader does not compile at all by default

This is due to a missing include statement.

This shader calls on ```BEGIN_REGISTER_GROUP``` which is defined in [register_group.fx #L10](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/) which isn't included by default.

Applying the following patches allows the shader to compile, and generates 1:1 shader data.

[particle_state.fx #L1](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/particle_state.fx#L1)
```
#include "register_group.fx"

struct s_particle_state
```
##

## particle_update
This shader does not compile at all by default

This is due to a missing include statement.

This shader calls on ```BEGIN_REGISTER_GROUP``` which is defined in [register_group.fx #L10](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/) which isn't included by default.

Applying the following patches allows the shader to compile, and generates 1:1 shader data.

[particle_state.fx #L1](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/particle_state.fx#L1)
```
#include "register_group.fx"

struct s_particle_state
```
##

## patchy_fog
Compiled shader data isn't entirely 1:1 by default.

There are issues with both the pixel shader data and the vertex shader data.

This is because some of the functions within the HLSL have been modified.

While these functions do not affect the functionality of the shader when compiled, having the ability to generate the original data may prove useful if the original shader data is required.

Having the ```APPLY_FIXES``` macro undefined, and applying the following patches to the default pixel shader function generates 1:1 data.

[patchy_fog.hlsl #L29](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/patchy_fog.hlsl#L29)
```
#ifdef APPLY_FIXES
	float3 texcoord : TEXCOORD0;
#else
    float2 texcoord : TEXCOORD0;
#endif
```
[patchy_fog.hlsl #L52](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/patchy_fog.hlsl#L52)
```
#ifdef APPLY_FIXES
	vertex_out.texcoord.z = vertex_out.position.w;
#endif
```
[patchy_fog.hlsl #L216](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/patchy_fog.hlsl#L216)
```
#ifdef APPLY_FIXES
	// the fog have to be faded near opaque surfaces:
	float fog_depth = pixel_in.texcoord.z;
	float depth_diff = view_space_scene_depth.x - fog_depth;
	float full_fade_edge = 0.03; // full fade closer then 0.3 ft.
	float no_fade_edge = 0.3; // no fade beyond the 3 ft. range
	float fog_fade = smoothstep(full_fade_edge, no_fade_edge, depth_diff);

	inscatter *= fog_fade;
#endif
```
The disassembled pixel shader data for this shader also contains an extra instruction when compared to the pixel shader data generated by default.

This extra instruction corresponds to the ```ssr_color``` value in the ```accum_pixel``` struct, which in this instance is being set to 0 in the ```convert_to_render_target``` function.

Having the ```SSR_ENABLE``` macro defined, along with the corresponding code added to the return function in the default pixel shader function in [patchy_fog.hlsl #L225](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/patchy_fog.hlsl#L225), generates a pixel shader with 1:1 data.
```
return convert_to_render_target(float4(inscatter * g_exposure.r, extinction), false, true
#ifdef SSR_ENABLE  
, 0  
#endif
);
```
##

## pixel_copy
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The main issue with the pixel shader data is that it appears to be missing some instructions when compared to the pixel shader data generated by default.

Applying the following patches to the default pixel shader function generates 1:1 data.

[pixel_copy.hlsl #L14](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/pixel_copy.hlsl#L14)
```
return sample2D(source_sampler, IN.texcoord) * scale.x + scale.y;
```
##

## player_emblem_screen
This shader does not compile at all by default

This is due to the pixel shader function trying to parse data through the vertex shader function when a vertex type hasn't been defined yet.

The solution for this is to add ```#ifdef``` functions to check if the shader being compiled is a vertex shader.

This should avoid the issue of an undefined vertex type being parsed into the vertex shader function.

Applying the following patches allows the shader to compile, and generate shader data that is almost 1:1.

[postprocess.fx #L28](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/postprocess.fx#L28)
```
#ifdef VERTEX_SHADER

#ifndef POSTPROCESS_USE_CUSTOM_VERTEX_SHADER

screen_output default_vs(vertex_type IN)
{
	screen_output OUT;
	OUT.texcoord=		IN.texcoord;
	OUT.position.xy=	IN.position;
	OUT.position.zw=	1.0f;
#ifdef POSTPROCESS_COLOR	
	OUT.color=			IN.color;
#endif // POSTPROCESS_COLOR
	return OUT;
}

#endif

#endif
```

There are still a few minor differences in the pixel shader data even after the shader compiles.

The main issue with the pixel shader data is that by default, one of the output variables is being defined using a dedicated function ```generate_emblem_pixel```.

When comparing the disassembled data from MS23 / ElDewrito, the output variable isn't defined using a dedicated function but rather is parsed through the  ```sample2D``` function before being parsed through the ```convert_to_render_target``` function.

Applying the following patches to the default pixel shader function resolves this issue.

[player_emblem_screen.hlsl #L35](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/player_emblem_screen.hlsl#L35)
```
float4 emblem_pixel= sample2D(tex0_sampler, IN.texcoord);
```

The disassembled pixel shader data for this shader also contains an extra instruction when compared to the pixel shader data generated by default.

This extra instruction corresponds to the ```ssr_color``` value in the ```accum_pixel``` struct, which in this instance is being set to 0 in the ```convert_to_render_target``` function.

Having the ```SSR_ENABLE``` macro defined, along with the corresponding code added to the return function in the default pixel shader function in [player_emblem_screen.hlsl #L40](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/player_emblem_screen.hlsl#L40), generates a pixel shader with 1:1 data.
```
return convert_to_render_target(emblem_pixel, false, false
#ifdef SSR_ENABLE
, 0
#endif
);
```
##

## player_emblem_world
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The main issue with the pixel shader data is that by default, one of the output variables is being defined using a dedicated function ```generate_emblem_pixel```.

When comparing the disassembled data from MS23 / ElDewrito, the output variable isn't defined using a dedicated function but rather is parsed through the  ```sample2D``` function before being parsed through the ```convert_to_render_target``` function.

Applying the following patches to the default pixel shader function resolves this issue.

[player_emblem_world.hlsl #L51](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/player_emblem_world.hlsl#L51)
```
float4 emblem_pixel= sample2D(tex0_sampler, IN.texcoord);
```

The disassembled pixel shader data for this shader also contains an extra instruction when compared to the pixel shader data generated by default.

This extra instruction corresponds to the ```ssr_color``` value in the ```accum_pixel``` struct, which in this instance is being set to 0 in the ```convert_to_render_target``` function.

Having the ```SSR_ENABLE``` macro defined, along with the corresponding code added to the return function in the default pixel shader function in [player_emblem_world.hlsl #L53](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/player_emblem_world.hlsl#L53), generates a pixel shader with 1:1 data.
```
return convert_to_render_target(emblem_pixel, false, false
#ifdef SSR_ENABLE
, 0
#endif
);
```
##

## radial_blur
Compiled shader data is 1:1.

No modifications were required.
##

## restore_ldr_hdr_depth
Compiled shader data is 1:1.

No modifications were required.
##

## rotate_2d
Compiled shader data is 1:1.

No modifications were required.
##

## screenshot_combine
Compiled shader data isn't entirely 1:1 by default.

There are issues with both the pixel shader data and the vertex shader data.

The main issue with this shader as a whole has to do with one of the dependencies of the shader, and how it uses certain macros.

Looking at the disassembled data from MS23 / ElDewrito, it appears to ignore the  ```POSTPROCESS_USE_CUSTOM_VERTEX_SHADER``` macro defined in [final_composite_base.hlsl](https://github.com/Beatthezombie/HaloShaderGenerator/blob/master/halo_online_shaders/final_composite_base.hlsl), where as every other shader which makes use of the same dependencies will make use of that macro.

The fix for this is to add some extra ```#ifdef``` functions to tell the shader to ignore the ```POSTPROCESS_USE_CUSTOM_VERTEX_SHADER``` macro when it is compiling any screenshot combine shader.

Apply the following patches resolves this issue, and generates 1:1 vertex shader data.

[screenshot_combine.hlsl #L8](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/screenshot_combine.hlsl#L8)
```
float4 calc_bloom_screenshot(in float2 texcoord);

#define SCREENSHOT_COMBINE

#include "final_composite_base.hlsl"
```
[final_composite_base.hlsl #L3](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/final_composite_base.hlsl#L3)
```
#ifndef SCREENSHOT_COMBINE
#define POSTPROCESS_USE_CUSTOM_VERTEX_SHADER 1
#endif
```
[final_composite_base.hlsl #L127](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/final_composite_base.hlsl#L127)
```
#ifndef SCREENSHOT_COMBINE

s_final_composite_output default_vs(vertex_type IN)
{
    s_final_composite_output OUT;
	OUT.texcoord=		IN.texcoord;
	OUT.position.xy=	IN.position;
	OUT.position.zw=	1.0f;
	
    // Convert the [0,1] input texture coordinates into pixel space. Note that this transform must include the appropriate
	// scale and bias for screenshot tile offsets
	float2 pixel_space_texcoord= IN.texcoord * pixel_space_xform.xy + pixel_space_xform.zw;

	// Transform pixel space texture coordinates to tile the noise texture such as to maintain 1:1 fetch ratio
	float2 noise_space_texcoord= pixel_space_texcoord * noise_space_xform.xy + noise_space_xform.zw;

	OUT.xformed_texcoord= float4( pixel_space_texcoord, noise_space_texcoord );
	
	return OUT;
}

#endif // !SCREENSHOT_COMBINE
```

Having the ```APPLY_FIXES``` macro undefined generates a pixel shader with 1:1 data.
##

## screenshot_combine_dof
Compiled shader data isn't entirely 1:1 by default.

There are issues with both the pixel shader data and the vertex shader data.

The main issue with this shader as a whole has to do with one of the dependencies of the shader, and how it uses certain macros.

Looking at the disassembled data from MS23 / ElDewrito, it appears to ignore the  ```POSTPROCESS_USE_CUSTOM_VERTEX_SHADER``` macro defined in [final_composite_base.hlsl](https://github.com/Beatthezombie/HaloShaderGenerator/blob/master/halo_online_shaders/final_composite_base.hlsl), whereas every other shader which makes use of the same dependencies will make use of that macro.

The fix for this is to add some extra ```#ifdef``` functions to tell the shader to ignore the ```POSTPROCESS_USE_CUSTOM_VERTEX_SHADER``` macro when it is compiling any screenshot combine shader.

Apply the following patches resolves this issue, and generates 1:1 vertex shader data.

[screenshot_combine_dof.hlsl #L14](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/screenshot_combine_dof.hlsl#L14)
```
float4 calc_bloom_screenshot(in float2 texcoord);

#define SCREENSHOT_COMBINE

#include "final_composite_base.hlsl"
```
[final_composite_base.hlsl #L3](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/final_composite_base.hlsl#L3)
```
#ifndef SCREENSHOT_COMBINE
#define POSTPROCESS_USE_CUSTOM_VERTEX_SHADER 1
#endif
```
[final_composite_base.hlsl #L127](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/final_composite_base.hlsl#L127)
```
#ifndef SCREENSHOT_COMBINE

s_final_composite_output default_vs(vertex_type IN)
{
    s_final_composite_output OUT;
	OUT.texcoord=		IN.texcoord;
	OUT.position.xy=	IN.position;
	OUT.position.zw=	1.0f;
	
    // Convert the [0,1] input texture coordinates into pixel space. Note that this transform must include the appropriate
	// scale and bias for screenshot tile offsets
	float2 pixel_space_texcoord= IN.texcoord * pixel_space_xform.xy + pixel_space_xform.zw;

	// Transform pixel space texture coordinates to tile the noise texture such as to maintain 1:1 fetch ratio
	float2 noise_space_texcoord= pixel_space_texcoord * noise_space_xform.xy + noise_space_xform.zw;

	OUT.xformed_texcoord= float4( pixel_space_texcoord, noise_space_texcoord );
	
	return OUT;
}

#endif // !SCREENSHOT_COMBINE
```

Having the ```APPLY_FIXES``` macro undefined generates a pixel shader with 1:1 data.
##

## screenshot_display
Compiled shader data is 1:1.

No modifications were required.
##

## screenshot_memexport
Compiled shader data is 1:1.

No modifications were required.
##

## shadow_apply
Compiled shader data is 1:1.

No modifications were required.
##

## shadow_apply_bilinear
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The only issue with the pixel shader data is that when compared to the disassembled data from MS23 / ElDewrito, the ```FASTER_SHADOWS``` macro has been left undefined.

Apply the following patches resolves this issue, and generates 1:1 pixel shader data.

[shadow_apply_bilinear.hlsl #L9](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/shadow_apply_bilinear.hlsl#L9)
```
//#define FASTER_SHADOWS
```
##

## shadow_apply_fancy
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The only issue with the pixel shader data is that when compared to the disassembled data from MS23 / ElDewrito, the ```FASTER_SHADOWS``` macro has been left undefined.

Apply the following patches resolves this issue, and generates 1:1 pixel shader data.

[shadow_apply_fancy.hlsl #L5](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/shadow_apply_fancy.hlsl#L5)
```
//#define FASTER_SHADOWS
```
##

## shadow_apply_faster
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The only issue with the pixel shader data is that when compared to the disassembled data from MS23 / ElDewrito, the ```FASTER_SHADOWS``` macro has been left undefined.

Apply the following patches resolves this issue, and generates 1:1 pixel shader data.

[shadow_apply_faster.hlsl #L5](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/shadow_apply_faster.hlsl#L5)
```
//#define FASTER_SHADOWS
```
##

## shadow_apply_point
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

The only issue with the pixel shader data is that when compared to the disassembled data from MS23 / ElDewrito, the ```FASTER_SHADOWS``` macro has been left undefined.

Apply the following patches resolves this issue, and generates 1:1 pixel shader data.

[shadow_apply_point.hlsl #L5](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/shadow_apply_point.hlsl#L5)
```
//#define FASTER_SHADOWS
```
##

## shadow_geometry
This shader does not compile at all by default

This is due to a missing include statement.

This include statement contains all the register declarations, which is required by the compiler.

Applying the following patches allows the shader to compile, and generate shader data that is almost 1:1.

[shadow_geometry_registers.fx #L6](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/shadow_geometry_registers.fx#L6)
```
#if DX_VERSION == 9

#include "shadow_geometry_registers.h"

PIXEL_CONSTANT(float4, shadow_color, 	k_ps_shadow_geometry_color)
```
There are still a few minor differences in the pixel shader data even after the shader compiles.

The disassembled pixel shader data for this shader also contains an extra instruction when compared to the pixel shader data generated by default.

This extra instruction corresponds to the ```ssr_color``` value in the ```accum_pixel``` struct, which in this instance is being set to 0 in the ```convert_to_render_target``` function.

Another minor difference is that the ```convert_to_render_target``` takes the variable ```p_lighting_constant_0``` instead of the variable ```shadow_color``` as an input. 

This doesn't affect the functionality of the shader at all and is purely an issue of mismatched identifiers.

These changes DO NOT affect the functionality of the shader whatsoever and are purely for maintaining consistency between the shader data which exists by default, and the data generated by the shader source.

Having the ```SSR_ENABLE``` macro defined, along with the corresponding code added to the return function in the default pixel shader function in [shadow_geometry.hlsl #L40](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/shadow_geometry.hlsl#L40), generates a pixel shader with 1:1 data.
```
return convert_to_render_target(p_lighting_constant_0, false, false
#ifdef SSR_ENABLE
, 0
#endif
);
```
##

## shield_impact
Compiled data does not match data in MS23 / ElDewrito by default.

It appears that this is a completely custom shader, specific to MS23 / ElDewrito as this data is completely different from the data generated by both Halo 3's shader source and ODST's shader source.

Most of the issues are with the vertex shader data, as while the pixel shader data is not entirely accurate, a more accurate implementation exists in an older version of TagTool's shader source files:  
[shield_impact.hlsl](https://github.com/Beatthezombie/HaloShaderGenerator/blob/74c0aaf386299ac3c35143c73fd2708b669e59e7/HaloShaderGenerator/hlsl/explicit/shield_impact.hlsl)

This shader also has an extra vertex type, when compared to the default vertex types in the Halo 3 and ODST shader source. 

Currently, there is no accurate implementation for the vertex shader data.

More research is required before 1:1 shader data can be generated.
##

## shield_meter
Compiled shader data is 1:1.

No modifications were required.
##

## sky_dome_simple
This shader does not compile at all by default

This shader uses an invalid vertex type.

For some reason, the shader is using ```sky``` as a vertex type instead of ```world```.

The solution to this issue is to simply replace the vertex type with its proper equivalent value in the generator, which is ```world```

Applying the following patches allows the shader to compile, and generate shader data that is almost 1:1.

[sky_dome_simple.hlsl #L13](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/sky_dome_simple.hlsl#L13)
```
//@generate world
```

There are still a few minor differences in the pixel shader data even after the shader compiles.

The disassembled pixel shader data for this shader also contains an extra instruction when compared to the pixel shader data generated by default.

This extra instruction corresponds to the ```ssr_color``` value in the ```accum_pixel``` struct, which in this instance is being set to 0 in the ```convert_to_render_target``` function.

Having the ```SSR_ENABLE``` macro defined, along with the corresponding code added to the return function in the default pixel shader function in [sky_dome_simple.hlsl #L51](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/sky_dome_simple.hlsl#L51), generates a pixel shader with 1:1 data.
```
return convert_to_render_target(out_color, true, false
#ifdef SSR_ENABLE
, 0
#endif
);
```
##

## smirnov
This shader does not compile at all by default

This is due to the pixel shader function trying to parse data through the vertex shader function when a vertex type hasn't been defined yet.

The solution for this is to add ```#ifdef``` functions to check if the shader being compiled is a vertex shader.

This should avoid the issue of an undefined vertex type being parsed into the vertex shader function.

Applying the following patches allows the shader to compile, and generates 1:1 shader data.

[smirnov.hlsl #L13](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/smirnov.hlsl#L13)
```
#ifdef VERTEX_SHADER

s_interpolators default_vs(vertex_type IN)
{
	s_interpolators OUT;
	OUT.position= float4(IN.position, 0, 1);
	OUT.texcoord= IN.texcoord;
	OUT.color= IN.color;
	return OUT;
}

#endif
```
##

## sniper_scope
This shader does not compile at all by default

This is due to a variable not being properly defined.

The ```stencil``` variable which is used to define one of the return variables doesn't get properly initialized, due to missing PC ```#ifdef``` functions.

The solution to this issue is to simply replace the ```stencil``` variable with zero, as the stencil variable is never properly defined no matter what macros get defined in the compiler.

Applying the following patches allows the shader to compile, and generate shader data that is almost 1:1.

[sniper_scope.hlsl #L111](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/sniper_scope.hlsl#L111)
```
result.g= step(64.0f / 255.0f, 0);
```

There are still a few minor differences in the pixel shader data even after the shader compiles.

The only issue with the shader data generated by default is that one of the parameters uses a different name compared to what exists in MS23 / ElDewrito by default.

This doesn't affect the functionality of the shader at all and is purely an issue of mismatched identifiers.

Applying the following patches to the default pixel shader function and the associated registers generates 1:1 data.

[sniper_scope.hlsl #L11](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/sniper_scope.hlsl#L11)
```
#define ZBUFFER_SCALE (p_lighting_constant_8.r)
#define ZBUFFER_BIAS (p_lighting_constant_8.g)
#define TEXEL_SIZE_X (p_lighting_constant_8.b)
#define TEXEL_SIZE_Y (p_lighting_constant_8.a)
```

[sniper_scope_registers.fx #L10](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/sniper_scope_registers.fx#L10)
```
PIXEL_CONSTANT(float4, p_lighting_constant_8, k_ps_sniper_scope_texture_params);
```

These changes DO NOT affect the functionality of the shader whatsoever and are purely for maintaining consistency between the shader data which exists by default, and the data generated by the shader source.
##

## sniper_scope_stencil_pc
Compiled shader data is 1:1.

No modifications were required.
##

## spike_blur_horizontal
Compiled shader data is 1:1.

No modifications were required.
##

## spike_blur_vertical
Compiled shader data is 1:1.

No modifications were required.
##

## ssao
Compiled shader data isn't entirely 1:1.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1, so no modifications were required.

There appear to be some minor issues regarding the order of certain instructions, as well as some of the constants.

There is currently no implementation that can generate 1:1 pixel shader data.

More research is required before 1:1 shader data can be generated.
##

## ssao_blur
Compiled shader data is 1:1.

No modifications were required.
##

## stencil_stipple
Compiled shader data is 1:1.

No modifications were required.
##

## transparent
This shader does not compile at all by default

This is due to the pixel shader function trying to parse data through the vertex shader function when a vertex type hasn't been defined yet.

The solution for this is to add ```#ifdef``` functions to check if the shader being compiled is a vertex shader.

This should avoid the issue of an undefined vertex type being parsed into the vertex shader function.

Applying the following patches allows the shader to compile, and generate shader data that is almost 1:1.

[transparent.hlsl #L23](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/transparent.hlsl#L23)
```
#ifdef VERTEX_SHADER

transparent_output default_vs(vertex_type IN)
{
    transparent_output OUT;

    OUT.HPosition= mul(float4(IN.position, 1.0f), View_Projection);
	OUT.Color= IN.color;
	OUT.Texcoord= IN.texcoord;
	
    return OUT;
}

#endif
```
There are still a few minor differences in the pixel shader data even after the shader compiles.

The disassembled pixel shader data for this shader also contains an extra instruction when compared to the pixel shader data generated by default.

This extra instruction corresponds to the ```ssr_color``` value in the ```accum_pixel``` struct, which in this instance is being set to 0 in the ```convert_to_render_target``` function.

Having the ```SSR_ENABLE``` macro defined, along with the corresponding code added to the return function in the default pixel shader function in [transparent.hlsl #L37](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/transparent.hlsl#L37), generates a pixel shader with 1:1 data.
```
return convert_to_render_target(IN.Color * sample2D(basemap_sampler, IN.Texcoord), false, false
#ifdef SSR_ENABLE
, 0
#endif
);
```
##

## update_persistence
Compiled shader data is 1:1.

No modifications were required.
##

## water_ripple
This shader does not compile at all by default

This is due to some of the shader registers not being named correctly.

Applying the following patches allows the shader to compile, however the data isn't entirely 1:1.

[water_ripple.hlsl #L893](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/water_ripple.hlsl#L893)
```
texcoord_ss= k_ps_water_player_view_constant.xy + texcoord_ss*k_ps_water_player_view_constant.zw;
```

[water_ripple.hlsl #L907](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/water_ripple.hlsl#L907)
```
pixel_position= mul(pixel_position, k_ps_water_view_xform_inverse);
```

There are still a few minor differences in the pixel shader data even after the shader compiles.

Firstly, the order of the entry points does not line up with what exists by default, this can be fixed by defining a new order.

[water_ripple.hlsl #L8](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/water_ripple.hlsl#L8)
```
//@generate s_ripple_vertex
//@entry default
//@entry albedo
//@entry dynamic_light
//@entry shadow_apply
//@entry active_camo
```

The disassembled pixel shader data for this shader also contains an extra instruction when compared to the pixel shader data generated by default.

This extra instruction corresponds to the ```ssr_color``` value in the ```accum_pixel``` struct, which in this instance is being set to 0 in the ```convert_to_render_target``` function.

Having the ```SSR_ENABLE``` macro defined, along with the corresponding code added to the return function in the default pixel shader function in [water_ripple.hlsl #L922](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/water_ripple.hlsl#L922), generates a pixel shader with 1:1 data.
```
return convert_to_render_target(float4(output_color, 1.0f), true, true
#ifdef SSR_ENABLE
, 0
#endif
);
```

### Minor Note:
Everything specified here has to do with fixes for underwater fog, which is specific to ElDewrito 0.7 and is not featured in any capacity in MS23.

There is an extra entry point that defines the updated underwater fog functions.

[water_ripple.hlsl #L8](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/water_ripple.hlsl#L8)
```
//@generate s_ripple_vertex
//@entry default
//@entry albedo
//@entry dynamic_light
//@entry shadow_apply
//@entry active_camo
//@entry lightmap_debug_mode
```

Since we added a new entry point for the underwater fog fixes, we also need to define new functions for the pixel and vertex shader data

[water_ripple.hlsl #L44](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/water_ripple.hlsl#L44)
```
#define underwater_vs			shadow_apply_vs
#define underwater_ps			shadow_apply_ps
#define underwater_new_vs       lightmap_debug_mode_vs
#define underwater_new_ps       lightmap_debug_mode_ps
```

Now we have defined the functions themselves, we can now add the updated underwater fog functions.

The code for these functions was pulled from an earlier version of the shader source [water_ripple.hlsl](https://github.com/Beatthezombie/HaloShaderGenerator/blob/74c0aaf386299ac3c35143c73fd2708b669e59e7/HaloShaderGenerator/hlsl/explicit/water_ripple.hlsl).

[water_ripple.hlsl #L760](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/water_ripple.hlsl#L760)
```

s_underwater_interpolators underwater_new_vs(s_underwater_interpolators _IN)
{
	s_underwater_interpolators _OUT;
	_OUT.position = float4(_IN.position.xy, 0, 1);
	_OUT.position_ss = float4(_IN.position_ss.xy, 0, 0);
	return _OUT;
}
```

[water_ripple.hlsl #L924](https://github.com/Beatthezombie/HaloShaderGenerator/blob/3e9945db51dd27f30f99975b0a15cff3dba1fc4e/halo_online_shaders/water_ripple.hlsl#L924)
```

#define k_underwater_murkiness_multiplier 1.44269502;

accum_pixel underwater_new_ps( s_underwater_interpolators INTERPOLATORS ) : COLOR
{
	float scene_depth = (k_ps_water_view_depth_constant.x / tex2D(tex_depth_buffer, INTERPOLATORS.position_ss.xy).r) + k_ps_water_view_depth_constant.y;
    float3 scene_color = tex2D(tex_ldr_buffer, INTERPOLATORS.position_ss.xy).rgb;

	float4 transform_tex = float4(INTERPOLATORS.position_ss.xy, 1.0f - scene_depth, 1.0f);
    transform_tex.y = 1.0f - transform_tex.y;
    transform_tex.xy -= 0.5f;
    transform_tex.xy /= 0.5f;
    
    float4 water_view = mul(transform_tex, k_ps_water_view_xform_inverse);
    
    water_view.xyz = water_view.xyz / water_view.w - k_ps_camera_position.xyz;
    float view_murkiness = rcp(rsqrt(dot(water_view.xyz, water_view.xyz))) * k_ps_underwater_murkiness;
    view_murkiness *= k_underwater_murkiness_multiplier;
    view_murkiness = saturate(1.0f / exp2(view_murkiness));
    
    view_murkiness = -view_murkiness + 1.0f;
    view_murkiness = -view_murkiness + 1.0f;
    view_murkiness *= 0.5f;
    
    float3 fog_color = lerp(k_ps_underwater_fog_color, scene_color, view_murkiness);
    
    fog_color = max(fog_color, 0);
    
    return convert_to_render_target(float4(fog_color, 1.0f), true, true
	#ifdef SSR_ENABLE
	, 0
    #endif
    );
}

```
##

## write_depth
Compiled shader data is 1:1.

No modifications were required.
##

## yuv_to_rgb
Compiled shader data is 1:1.

No modifications were required.
##

## 94

This is currently an unknown shader.

Most of the issues are with the pixel shader data.

The vertex shader data is 1:1 with the ```fxaa``` shader, so no modifications or custom implementations are required.

The pixel shader data is almost 1:1 with the pixel data in the ```fxaa``` shader.

The disassembled pixel shader data for this shader contains an extra texture sampler register ```alpha_sampler``` when compared against the ```fxaa``` shader.

Name is currently unknown.

```fxaa_alpha``` seems like a suitable name, as looking at the disassembled data, the order of instructions appears to be almost 1:1 with the existing ```fxaa``` implementation, with the only difference being the addition of the ```alpha_sampler``` texture sampler, and its supporting code.

More research is required before 1:1 shader data can be generated.
##

## 98

This is currently an unknown shader.

More research is required before 1:1 shader data can be generated.
##

## 101

This is currently an unknown shader.

More research is required before 1:1 shader data can be generated.
##

## 102

This is currently an unknown shader.

More research is required before 1:1 shader data can be generated.
##

## 103

This is currently an unknown shader.

More research is required before 1:1 shader data can be generated.
##

## 104

This is currently an unknown shader.

More research is required before 1:1 shader data can be generated.
##

## 105

This is currently an unknown shader.

More research is required before 1:1 shader data can be generated.
##

## 106

This is currently an unknown shader.

More research is required before 1:1 shader data can be generated.
##

## 107

This is currently an unknown shader.

More research is required before 1:1 shader data can be generated.
##

## 108

This is currently an unknown shader.

Looking at the disassembled pixel shader data from MS23 / ElDewrito, the data is fairly similar to the ```hud_camera_nightvision``` shader.

The only real similarities between the data are the registers.

All other data is unknown.

By default, the ```hud_camera_nightvision``` HLSL from the ODST shader source generates an empty pixel shader

A more accurate pixel shader implementation exists in an older version of TagTool's shader source files: 

[pixl_vision_mode.hlsl](https://github.com/Beatthezombie/HaloShaderGenerator/blob/74c0aaf386299ac3c35143c73fd2708b669e59e7/HaloShaderGenerator/hlsl/explicit/pixl_vision_mode.hlsl)

The vertex shader data generated using the files that exist in the ODST shader source do generate 1:1 data.

More research is required before 1:1 shader data can be generated.
##

## 109

This is currently an unknown shader.

More research is required before 1:1 shader data can be generated.
##
