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
endin


schedule(1,0,3,0.5,4000,100)
schedule(1,1,0.3,0.75,80,20)
schedule(1,2,0.4,0.5,200,10)
schedule(1,2.5,0.5,0.6,300,20)
schedule(1,3,0.4,0.4,250,30)
schedule(1,3.5,0.5,0.75,80,20)
schedule(1,4,0.4,0.5,80,20)
schedule(1,4.5,2,0.5,3000,400)

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
