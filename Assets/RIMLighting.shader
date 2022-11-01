Shader "2Parcial/RimLighting"
{
    Properties
    {

    }
    SubShader
    {
        ZWrite Off
        //Aumenta la geometria.
        Tags{"Queue" = "Geometry+1000"}
        CGPROGRAM

        #pragma surface surf Lambert

        struct Input
        {
            float3 viewDir;
        };

        void surf(Input IN, inout SurfaceOutput o)
        {
          /* Esto es para el producto punto
          para hacer que la circuferencia se colorie*/
          half dotp = dot(IN.viewDir, o.Normal);
          //                  r ,   g,  b
          o.Albedo = float3(dotp, dotp, 1);
        }
        ENDCG
    }
}
