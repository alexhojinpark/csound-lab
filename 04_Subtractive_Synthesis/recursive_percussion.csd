<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1
 anoise rand expseg(1, p3, 0.001)
 
 afilt reson anoise, p5, p6, 2
 
 out afilt*p4  
 
 schedule(1,p3,p3,p4,p5*(1+gauss(0.05)),p6)
endin


schedule(1,   0,   3,  0.4, 4000, 80)
schedule(1, 0.5, 0.4,  0.3,   80, 20)
schedule(1, 0.2, 0.2,  0.2,  200, 10)
schedule(1, 0.6, 0.3, 0.25,  300, 30)
schedule(1,   4,   1,  0.2, 2000, 300)

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
