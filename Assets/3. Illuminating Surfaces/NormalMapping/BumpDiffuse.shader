﻿Shader "ShaderCourse/BumpDiffuse" {

    Properties {
        _myDiffuse ("Diffuse Texture", 2D) = "white"{}
        _myBump ("Bump Texture", 2D) = "bump"{}
        _mySliderX("X Bump Amount", Range(-10, 10)) = 1
        _mySliderY("Y Bump Amount", Range(-10, 10)) = 1
        _mySliderZ("Z Bump Amount", Range(-10, 10)) = 1
    }

    SubShader {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input {
            float2 uv_myDiffuse;
            float2 uv_myBump;
        };

        sampler2D _myDiffuse;
        sampler2D _myBump;
        half _mySliderX, _mySliderY, _mySliderZ;

        void surf (Input i, inout SurfaceOutput o){
            o.Albedo = tex2D(_myDiffuse, i.uv_myDiffuse).rgb;
            o.Normal = UnpackNormal(tex2D(_myBump, i.uv_myBump));
            o.Normal *= float3(_mySliderX, _mySliderY, _mySliderZ);
        }
        ENDCG
    }

    Fallback "Diffuse"
}

// struct SurfaceOutput {
    //     fixed3 Albedo;      // diffuse color
    //     fixed3 Normal;      // tangent space normal, if written
    //     fixed3 Emission;
    //     half Specular;      // specular power in 0..1 range
    //     fixed Gloss;        // specular intensity
    //     fixed Alpha;        // alpha for transparencies
// }