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

// phase is between 0 and 1 instead of 0 to 2pi 
// so we need to scale the index of modulation
amod oscili indx/i2pi, ifm   // modulator
aph phasor ifc   // carrier phase
// tablei parameters ifn:-1, mode:1, offset: 0, wrap:1
acar tablei amod+aph,-1,1,0,1 // carrier 
  out linen(acar*iamp,0.001,p3,0.1)
endin

schedule(1,0,4,0.1,220,10,440)

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
