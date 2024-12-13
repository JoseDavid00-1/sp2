#include<flutter/runtime_effect.glsl>

uniform vec2 uResolution; // The resolution of the screen

uniform sampler2D uTexture; // The texture

out vec4 fragColor;

// A function to perform simple anti-aliasing
vec4 applyAntiAliasing(vec2 coord) {
    vec2 aaLevel = vec2(0.25) / uResolution; // Menos suavizado
    vec4 color = vec4(0.0);

    for (int x = -1; x <= 0; x++) {
        for (int y = -1; y <= 0; y++) {
            vec2 sampleCoord = coord + vec2(float(x), float(y)) * aaLevel;
            color += texture(uTexture, sampleCoord);
        }
    }

    return color / 4.0; // Promedio correcto
}


void main() {
    vec2 st=FlutterFragCoord().xy  / uResolution;

    // fragColor = texture(uTexture, st);

    fragColor = applyAntiAliasing(st);
}