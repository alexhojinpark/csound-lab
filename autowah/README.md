# Auto-Wah Effect Implementation in Csound

## Overview

The implementation of an auto-wah effect in Csound. The auto-wah is a dynamic filter effect that automatically modulates a lowpass/bandpass filter's frequency based on the input signal's amplitude, creating a "wah-wah" effect that responds to the dynamics of the performance without manual control.


## Runing and Testing

- Install [Csound](https://csound.com/) & [Cabbage](https://cabbageaudio.com/)
- Adjust the `<CsScore>` section
- `i2 0 5` plays instr 2 (original audio) for 5 seconds
- `i3 6 3600` then play the instr 3 (the wah effect)
- 3 audio samples used:
    - bass.wav, eguitar.wav, piano.wav

## Signal Flow

1. **Input**: Stereo audio file 
2. **Envelope Following**: Detect the amplitude envelope of the signal
3. **Envelope Processing**: Scale and shape the envelope
4. **Filter Frequency Mapping**: Map the envelope to filter frequencies
5. **Bandpass Filtering**: Apply resonant bandpass filter 
6. **Mixing**: Blend dry and wet signals
7. **Output**: Stereo output

## Key Opcodes Used

### `diskin2`
```csound
aL, aR diskin2 "bass.wav", 1, 0, 1
```

### `follow2`
```csound
aEnvL follow2 aL, kAttack, kRelease
aEnvR follow2 aR, kAttack, kRelease
```

### `downsamp`
```csound
kEnvL downsamp aEnvL
kEnvR downsamp aEnvR
```

### `portk`
```csound
kSmoothL portk kEnvL, 0.01
kSmoothR portk kEnvR, 0.01
```

### `reson`
```csound
aresL reson aL, kFilterFreqL, kFilterFreqL/kQ, 1
aresR reson aR, kFilterFreqR, kFilterFreqR/kQ, 1
```

## Key Signal Processing Techniques

### 1. Envelope Following
```csound
aEnvL follow2 aL, kAttack, kRelease
aEnvR follow2 aR, kAttack, kRelease
```
The `follow2` opcode tracks the amplitude envelope of the input signal. Separate attack and release times provide precise control over how quickly the effect responds to playing dynamics.

### 2. Non-linear Mapping (Exponential)
```csound
kFilterFreqL = kBaseFreq * exp(kSmoothL * 0.1)
kFilterFreqR = kBaseFreq * exp(kSmoothR * 0.1)
```
An exponential mapping is used rather than linear mapping because:
- Human hearing perceives frequency logarithmically
- Creates a more musical response as the filter sweeps
- Provides better sensitivity at lower amplitude levels

### 3. Frequency Range Limiting
```csound
kFilterFreqL = (kFilterFreqL < kMaxFreq) ? kFilterFreqL : kMaxFreq
kFilterFreqR = (kFilterFreqR < kMaxFreq) ? kFilterFreqR : kMaxFreq
```
Conditional expressions prevent the filter frequency from exceeding the maximum range, avoiding harsh sounds at high input levels.

### 4. Dynamic Bandwidth Control
```csound
aresL reson aL, kFilterFreqL, kFilterFreqL/kQ, 1
```
The bandwidth of the filter is set proportional to the center frequency by dividing by the Q factor. This creates a more consistent tonal characteristic across the frequency range, similar to how analog wah pedals behave.

### 5. Dry/Wet Mixing
```csound
aDryL = aL * kDWRatio
aDryR = aR * kDWRatio
aWetL = aresL * kGain
aWetR = aresR * kGain
```
Blending the original signal with the filtered signal allows for control over the intensity of the effect and preserves the original character of the sound.

## Improvements Over Basic Auto-Wah

1. **Separate Attack/Release**: Using `follow2` instead of basic `follow` enables more natural envelope tracking
2. **Exponential Mapping**: Creates more musical filter sweeps than linear mapping
3. **Smoothing**: `portk` prevents abrupt filter frequency changes
4. **Dynamic Bandwidth**: Filter bandwidth changes with frequency for consistent resonant character
5. **Dry/Wet Mix**: Allows for subtle to dramatic effect intensity
