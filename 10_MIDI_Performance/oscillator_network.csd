<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 2
schedule(1,0,1,"localhost",1,880)
endin
schedule(2,0,1)
event_i("e",0,1)


instr 1
 S1 = p4
 OSCsend 0,S1,7000,"/parm","fff",1,p5,p6
endin

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>659</x>
 <y>616</y>
 <width>680</width>
 <height>200</height>
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
