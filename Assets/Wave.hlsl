void WavePattern_float(float Pos, float2 uv, float Seed, out float outAlpha)
{
    outAlpha = uv.y * ConstructFloat(JenkinsHash(float2(Pos/4, Seed + 1234 * floor(_Time.y * 5))));
}
