Shader "3erParc/BlingPhong"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _Glossiness ("Gloss", Range(0,2)) = 0.0
        _Specular("Spec Intensity", Range(0.0, 1.0)) = 0.0
        //_SpecColor("Specular", )
    }
        SubShader
    {

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf BlinnPhong

        float4 _Color;
        float4 _color;
        half _Glossiness;
        half _Specular;
        half _Range;
        //Variable para con CG


        struct Input
        {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
                      o.Albedo = _color.rgb;
            o.Specular = _Specular;
            o.Gloss = _Glossiness * _Range;


        }
        ENDCG
    }
    FallBack "Diffuse"
}
