<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

gife ftgen 0,0,16384,20,6,1
gifw ftgen 0,0,0,1,"fox.wav",0,0,1

instr 1
 aenv oscili p4, 1/p3, gife
 asig poscil aenv, p5*sr/ftlen(gifw), gifw, p6
      out asig 
endin

igdur  = 0.04 // grain dur
igrate = 4/igdur // grains per sec
igfreq = 1 // grain pitch
igamp = 0.5  // grain amplitude
ign = 1000   // number of grains
its = 0.75       // timescale 
ifl = ftlen(gifw)/ftsr(gifw) // wavetable duration
ipos = its/igrate // position increment

ik = 1
ip = 0
while ik <= ign do
 schedule(1, ik/igrate, igdur, igamp, igfreq, ip)
 ip += ipos/ifl          
 ik += 1
 if(ip < 0) then
  ip += ifl
 endif
od

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>








<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>553</width>
 <height>414</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>34</x>
  <y>34</y>
  <width>519</width>
  <height>159</height>
  <uuid>{9334aebf-6ff8-46bf-a1f8-4432baaca53a}</uuid>
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
  <triggermode>NoTrigger</triggermode>
 </bsbObject>
 <bsbObject type="BSBGraph" version="2">
  <objectName>graph1</objectName>
  <x>35</x>
  <y>225</y>
  <width>458</width>
  <height>189</height>
  <uuid>{ec9057d4-b17b-4c85-b694-0dec1a12500a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>0</value>
  <objectName2/>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <showSelector>true</showSelector>
  <showGrid>true</showGrid>
  <showTableInfo>true</showTableInfo>
  <showScrollbars>true</showScrollbars>
  <enableTables>true</enableTables>
  <enableDisplays>true</enableDisplays>
  <all>true</all>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
