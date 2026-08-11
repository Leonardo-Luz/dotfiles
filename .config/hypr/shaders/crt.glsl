#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;

out vec4 fragColor;

#define CURVATURE 0.02
#define SCANLINE_STRENGTH 0.12
#define VIGNETTE_STRENGTH 0.30
#define CHROMA_OFFSET 0.0002

vec2 curve(vec2 uv)
{
    uv = uv * 2.0 - 1.0;

    uv *= 1.0 + CURVATURE * dot(uv, uv);

    uv = uv * 0.5 + 0.5;

    return uv;
}

vec3 sampleScreen(vec2 uv)
{
    float r = texture(tex, uv + vec2(CHROMA_OFFSET,0.0)).r;
    float g = texture(tex, uv).g;
    float b = texture(tex, uv - vec2(CHROMA_OFFSET,0.0)).b;

    return vec3(r,g,b);
}

float scanline(vec2 uv)
{
    return sin(uv.y * 900.0) * SCANLINE_STRENGTH;
}

float vignette(vec2 uv)
{
    vec2 d = uv - 0.5;
    return 1.0 - dot(d,d) * VIGNETTE_STRENGTH;
}

void main()
{
    vec2 uv = curve(v_texcoord);

    float mask =
        step(0.0, uv.x) *
        step(0.0, uv.y) *
        step(uv.x, 1.0) *
        step(uv.y, 1.0);

    uv = clamp(uv, 0.0, 1.0);

    vec3 col = sampleScreen(uv);

    col *= 1.0 - scanline(v_texcoord);

    col *= vignette(v_texcoord);

    col *= mask;

    fragColor = vec4(col, 1.0);
}
