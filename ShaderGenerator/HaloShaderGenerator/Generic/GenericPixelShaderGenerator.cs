using System.Collections.Generic;
using System.Linq;
using HaloShaderGenerator.DirectX;
using HaloShaderGenerator.Generator;
using HaloShaderGenerator.Globals;

namespace HaloShaderGenerator.Shader
{
    public class GenericPixelShaderGenerator
    {
        public static ShaderGeneratorResult GeneratePixelShader(string name, string entry, bool applyFixes = false)
        {
            //string template = $"{(chud ? "chud" : "explicit")}\\{name}.hlsl
            string template = $"{name}.hlsl";

            List<D3D.SHADER_MACRO> macros = new List<D3D.SHADER_MACRO>();

            // Having apply fixes disabled generates 1:1 shaders
            if (name == $@"chud_cortana_composite" ||
                name == $@"chud_meter_shield" ||
                name == $@"chud_simple" ||
                name == $@"chud_text_simple")
                applyFixes = false;

            CreateMacrosGenericPixel(macros, entry.ToLower(), applyFixes);

            byte[] shaderBytecode = ShaderGeneratorBase.GenerateSource(template, macros, $"{entry.ToLower()}_ps", "ps_3_0");
            return new ShaderGeneratorResult(shaderBytecode);
        }

        public static void CreateMacrosGenericPixel(List<D3D.SHADER_MACRO> macros,
            string entryPoint,
            bool applyFixes)
        {
            string vertexTypeSnake = string.Concat(VertexType.World.ToString().Select(
                (x, i) => i > 0 && char.IsUpper(x) ? "_" + x.ToString() : x.ToString())).ToLower();

            macros.Add(ShaderGeneratorBase.CreateMacro("PIXEL_SHADER", "1"));
            macros.Add(ShaderGeneratorBase.CreateMacro("entry_point", entryPoint));
            macros.Add(ShaderGeneratorBase.CreateMacro("vertex_type", vertexTypeSnake, "s_", "_vertex"));
            macros.Add(ShaderGeneratorBase.CreateMacro("deform", vertexTypeSnake, "deform_"));
            macros.Add(ShaderGeneratorBase.CreateMacro("SHADER_30", "1"));
            macros.Add(ShaderGeneratorBase.CreateMacro("pc", "1"));
            macros.Add(ShaderGeneratorBase.CreateMacro("DX_VERSION", "9"));
            macros.Add(ShaderGeneratorBase.CreateMacro("disable_register_reorder", "1"));

            if (applyFixes)
                macros.Add(ShaderGeneratorBase.CreateMacro("APPLY_FIXES", "1"));
        }

    }
}
