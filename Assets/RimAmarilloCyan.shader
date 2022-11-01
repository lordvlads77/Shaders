Shader "2Parcial/RimAmarilloCyan"
{
    Properties
    {
      //Se declara la variable color
      //                          r  g b a "a" stands for tranparencia.
        _Color ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        ZWrite Off
        Tags{"Queue" = "Geometry+1000"}
        CGPROGRAM

        #pragma surface surf Lambert

        float4 _Color;

        struct Input
        {
            float3 viewDir;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            half rim = dot(IN.viewDir, o.Normal);
          // aqui el rim se le agrega 1 al red y se le resta el rim de blue.
            o.Albedo = float3(rim, 1 + rim, 1 - rim);
        }
        ENDCG
    }
}
