<CsoundSynthesizer>
<CsOptions>
-odac -M0
</CsOptions>
<CsInstruments>
0dbfs = 1
nchnls = 2

instr 1
  kfr cpsmidib 2 // cps from midi
  
  kcf_max = 8 * kfr // MAX CF 8 times the fundamental 
  kcf_min = 2 * kfr // MIN CF 2 times the fundamental
  
  kspac =  kfr * 0.5 // spacing between filters 
  
  ires = 0.8 // amount of resonance
  
  kenv1 madsr 0.1, 0.01, 0.8, 0.1
  kamp = kenv1 * ampmidi(0dbfs * 0.2) // amp from midi
  
  kenv2 madsr 0.1, 0.1, 0.7, 0.1
  kcf = kenv2 * (kcf_max - kcf_min) + kcf_min
  
  a1 vco2  kamp, kfr, 10 // square wave
  
  a21 moogvcf a1, kcf-kspac, ires
  a22 moogvcf a1, kcf+kspac, ires   
  
  // a21 moogladder a1, kcf-kspac, ires
  // a22 moogladder a1, kcf+kspac, ires
  
  outs a21,a22
endin

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>




<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>0</width>
 <height>0</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
