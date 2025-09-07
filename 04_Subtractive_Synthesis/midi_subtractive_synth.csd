<CsoundSynthesizer>
<CsOptions>
-odac -M0
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1
   iamp ampmidi 0dbfs // MIDI velocity to amp
   
   kfr   cpsmidib 2 // MIDI note + pb to cps
   
   icf_max = 5000 // MAX centre freq
   
   icf_min = 100 // MIN centre freq  
   
   iq = 1 // filter Q factor
   
   kenv madsr 0.1, 0.01, 0.8, 0.1
   
   kcf = kenv * (icf_max - icf_min) + icf_min
   
   kamp = kenv * iamp * 0.2 //scaling by 0.2 for headroom 
   
   a1 vco2 kamp,kfr
   a2 reson a1, kcf, kcf/iq, 1
   
   out a2
endin

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>




<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
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
