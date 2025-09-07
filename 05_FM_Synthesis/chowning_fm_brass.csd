<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1


// Chowning instrument, fig10
instr 1
ifna = p9  // amplitude env table
ifnb = p10  // timbre env table
ae oscili  p4, 1/p3, ifna
ai oscili (p8-p7)*p6, 1/p3, ifnb
am oscili  p7*p6 + ai, p6
ac oscili  ae, am + p5 
      out ac  
endin

// brass tone
ia ftgen 0,0,1024,7,0,100,1,100,0.7,724,0.7,100,0
schedule(1,0,0.6,0.5,440,440,0,5,ia,ia)

// woodwind tones
ilen = 1024
ia ftgen 0,0,1024,5,0.001,ilen*0.05,1,ilen*0.94,1,ilen*0.01,0.001
ie ftgen 0,0,1024,5,0.001,ilen*0.05,1,ilen*0.95,1
schedule(1,1,0.5,0.5,900,300,0,2,ia,ie)
schedule(1,2,0.5,0.5,500,100,0,1.5,ia,ie)
schedule(1,3,0.5,0.5,900,600,4,2,ia,ie)

// percussion tones
ia ftgen 0,0,1024,5,0.9,0.25*ilen,1,.75*ilen,0.001
schedule(1,4,.2,0.5,200,280,0,2,ia,ia)

ia ftgen 0,0,1024,7,1,ilen,0
schedule(1,5,0.025,0.5,80,55,0,20,ia,ia)


ia ftgen 0,0,1024,5,1,1024,0.001
schedule(1,6,15,0.5,200,280,0,10,ia,ia)


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
