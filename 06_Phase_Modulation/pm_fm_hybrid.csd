<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1
ifm = p4
ifc = p5
indx = p6
amod oscili indx/i2pi, ifm  // sine modulator
aph    phasor ifc                 // carrier phase
apm   tablei   aph+amod, -1, 1, 0, 1  // sine carrier
      out apm
endin

schedule(1,0,10,330,330,3)

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
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
