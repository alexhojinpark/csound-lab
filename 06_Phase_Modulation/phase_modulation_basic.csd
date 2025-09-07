<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1
i2pi = 2*$M_PI
iamp = p4
ifc = p5
indx = p6
ifm = p7

aphm phasor ifm  // modulator phase (0 to 1)
amod = indx*sin(i2pi*aphm) // modulator
aphc phasor ifc   // carrier phase (0 to 1)
acar = iamp*sin(i2pi*aphc + amod) // carrier
  out linen(acar,0.001,p3,0.1)
endin

schedule(1,0,4,0.1,330,10,330)

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
