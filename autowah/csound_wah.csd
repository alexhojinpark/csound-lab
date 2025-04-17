<Cabbage> bounds(0, 0, 0, 0)
form caption("Csound Wah Effect") size(400, 300), guiMode("queue") pluginId("def1")

rslider bounds(20, 20, 60, 60), channel("sens"), range(0, 1, 0.8, 1, 0.001)
rslider bounds(90, 20, 60, 60), channel("gain"), range(1, 10, 5, 1, 0.1)
rslider bounds(160, 20, 60, 60), channel("attack"), range(0.001, 0.1, 0.005, 0.5, 0.001)
rslider bounds(230, 20, 60, 60), channel("release"), range(0.01, 0.5, 0.05, 0.5, 0.001)

rslider bounds(20, 120, 60, 60), channel("q_factor"), range(1, 20, 7, 0.5, 0.1)
rslider bounds(90, 120, 60, 60), channel("base_freq"), range(100, 800, 400, 0.5, 1)
rslider bounds(160, 120, 60, 60), channel("freq_range"), range(1000, 5000, 2500, 0.5, 10)
rslider bounds(230, 120, 60, 60) channel("dw_ratio") range(0, 1, 0.5, 1, 0.001)

label bounds(20, 82, 60, 16) channel("label_sens") fontColour(255, 255, 255, 255) text("Sensitivity")  
label bounds(90, 82, 60, 16) channel("label_gain") fontColour(255, 255, 255, 255) text("Gain")
label bounds(160, 82, 60, 16) channel("label_attack") fontColour(255, 255, 255, 255) text("Attack")
label bounds(230, 82, 60, 16) channel("label_release") fontColour(255, 255, 255, 255) text("Release")
label bounds(20, 182, 60, 16) channel("label_q_factor") fontColour(255, 255, 255, 255) text("Q Factor")
label bounds(90, 182, 60, 16) channel("label_base_freq") fontColour(255, 255, 255, 255) text("Base Freq")
label bounds(160, 182, 60, 16) channel("label_freq_range") fontColour(255, 255, 255, 255) text("Freq Range")

label bounds(228, 182, 60, 16) channel("label_mix_ratio") fontColour(255, 255, 255, 255) text("Mix Ratio")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


; ORIGINAL AUDIO
instr 2
    ; Read stereo file
    aL, aR diskin2 "bass.wav", 1, 0, 1

    ; Output stereo signal
    outs aL, aR
endin

instr 3
    ; Read stereo file
    aL, aR diskin2 "bass.wav", 1, 0, 1
    
    ; Autowah Parameters
    kSensitivity chnget "sens"
    kGain chnget "gain"
    kAttack chnget "attack"
    kRelease chnget "release"
    
    ; Base Filter Settings
    kBaseFreq chnget "base_freq"
    kMaxFreq chnget "freq_range"
    kQ chnget "q_factor"
    kDWRatio chnget "dw_ratio"
    
    ; Autowah Implementation
    
    ; envelope follower with improved settings
    aEnvL follow2 aL, kAttack, kRelease
    aEnvR follow2 aR, kAttack, kRelease
    
    ; sensitivity and convert to control rate
    kEnvL downsamp aEnvL
    kEnvR downsamp aEnvR
    kEnvL = kEnvL * kSensitivity * 100
    kEnvR = kEnvR * kSensitivity * 100
    
    ; portamento to smooth the envelope control
    kSmoothL portk kEnvL, 0.01
    kSmoothR portk kEnvR, 0.01
    
    ; exponential mapping
    kFilterFreqL = kBaseFreq * exp(kSmoothL * 0.1)
    kFilterFreqR = kBaseFreq * exp(kSmoothR * 0.1)
    
    ; limit the frequency range
    kFilterFreqL = (kFilterFreqL < kMaxFreq) ? kFilterFreqL : kMaxFreq
    kFilterFreqR = (kFilterFreqR < kMaxFreq) ? kFilterFreqR : kMaxFreq
    
    ; Apply bandpass filter with variable bandwidth
    aresL reson aL, kFilterFreqL, kFilterFreqL/kQ, 1
    aresR reson aR, kFilterFreqR, kFilterFreqR/kQ, 1
    
    ; Apply gain and mix with dry signal for better sound
    aDryL = aL * kDWRatio   ; Keep some dry signal
    aDryR = aR * kDWRatio
    aWetL = aresL * kGain
    aWetR = aresR * kGain
        
    ; Output mixed signal
    outs aDryL + aWetL, aDryR + aWetR
    
endin

</CsInstruments>
<CsScore>
i2 0 5
i3 6 3600
e
</CsScore>
</CsoundSynthesizer>
