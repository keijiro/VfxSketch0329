#include "Packages/jp.keijiro.noiseshader/Shader/SimplexNoise2D.hlsl"

float GlitchPattern_Noise(float2 p)
{
    return SimplexNoise(p * 1) * 1.00 + 
           SimplexNoise(p * 2) * 0.50 + 
           SimplexNoise(p * 4) * 0.25;
}

void GlitchPattern_float
  (float2 UV, float Time, float Seed, out float Out)
{
    uint seed = (uint)(Time * 60) * 10 + Seed;
    float h1 = Hash(seed + 0) * 100000;
    float h2 = Hash(seed + 1) * 100000;
    float h3 = Hash(seed + 2) * 100000;
    float2 p1 = floor(UV * float2(5, 50) + float2(h1, 0)) / 8;
    float2 p2 = floor(UV * float2(7, 45) + float2(h2, 0)) / 8;
    float2 p3 = floor(UV * float2(3, 33) + float2(h3, 0)) / 8;
    float n1 = GlitchPattern_Noise(p1);
    float n2 = GlitchPattern_Noise(p2);
    float n3 = GlitchPattern_Noise(p3);
    Out = (n1 + n2 + n3) * 0.37;
}
