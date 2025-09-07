<CsoundSynthesizer>
<CsOptions>
--midi-key-cps=5 --midi-velocity-amp=4
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1
 out linenr(oscili(p4,p5),0.01,0.1,0.01)
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
