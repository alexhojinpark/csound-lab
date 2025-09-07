<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

0dbfs = 1
ifn  ftgen  1, 0, 8, -2, 0, 4, 7, 12, 7, 12, 7, 4
instr 1
 k1 phasor p6
 k2 table k1, 1, 1
 a1 oscili p4, cpsmidinn(p5+k2)
 a2 linen a1, 0.1, p3, 0.1
   out a2
endin
schedule(1, 0, 4, 0.5, 60, 1.2) 
schedule(1, 4, 4, 0.5, 67, 1.5)


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
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>179</x>
  <y>83</y>
  <width>350</width>
  <height>150</height>
  <uuid>{c2e06dbb-9087-40e3-85e6-ed84d4ce84d0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
