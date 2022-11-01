Shader "3erParc/NewBlingPhong"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _MainTex("Texture", 2D) = "white"{}
        _Normal("Normal", Color) = (1,1,1,1)
        _Emission("Emission",Color)=(1,1,1,1)
    }
        SubShader
    {

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Lambert

        float4 _Color;
        //Variable para con CG
        sampler2D _MainTex;
        float4 _Normal;
        float4 _Emission;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex);
            o.Emission.r = 1;


        }


        ENDCG
    }
    FallBack "Diffuse"
}
