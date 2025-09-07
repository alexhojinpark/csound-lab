<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1
 iamp ampmidi 0dbfs*0.2
 kfrq cpsmidib 2
 kmod midic7 1,0,0.1   // controller 1: mod wheel
 avibr oscili kmod*kfrq,7 
 out linenr(oscili(iamp,kfrq+avibr),0.01,0.1,0.01)
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
