Shader "2doParc/CrissCutRim"
{
    Properties{
       _MainTex("Texture", 2D) = "white"{}
    }
    SubShader{
        CGPROGRAM

        #pragma surface surf Lambert
        float4 _RimColor;
        half _RimPower;
        sampler2D _MainTex;

        struct Input
        {
            float3 viewDir;
            float3 worldPos;
            float2 uv_MainTex;
        };
     void surf(Input IN,inout SurfaceOutput o)
     {
        o.Albedo = tex2D(_MainTex,IN.uv_MainTex);
        o.Emission =  frac(IN.worldPos.x * 10) > 0.9 ? float3(1,0,1) :
         frac(IN.worldPos.y * 10) > 0.9 ? float3(1,1,0) : 0  ;
     }
    ENDCG
        }
}
