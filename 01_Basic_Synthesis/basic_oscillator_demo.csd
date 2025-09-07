<CsoundSynthesizer>
<CsOptions>
; Use real-time audio output
-odac
</CsOptions>
<CsInstruments>

instr 1
  asig oscili p4, p5
  aenv linen asig, 0.1, p3, 0.1
  out aenv
endin

instr 2
  a1 vco2 p4, p5
  a2 vco2 p4, p5*1.002
  a3 vco2 p4, p5*0.998
  a4 vco2 p4, p5*1.004
  a5 vco2 p4, p5*0.996
  a6 vco2 p4, p5*1.006
  a7 vco2 p4, p5*0.994
  amix = (a1+a2+a3+a4+a5+a6+a7)*0.142
  asig linen amix, 0.01, p3, 0.1
  out asig
endin

schedule(1, 0, 5, 0.5, 440)
schedule(2, 5, 5, 0.5, 440)

</CsInstruments>
<CsScore>
; Schedule instr 1 and 2

; Needed to end the performance
f 0 20
</CsScore>
</CsoundSynthesizer>
