<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1

kn = p6 // selects vowel

kvibr oscili p5*0.01, 4.5 // vibrato
asig buzz p4, p5+kvibr, sr/(2*p5+kvibr),-1 // blp

// a e i o u
kcf1[] fillarray 800, 350, 270, 450, 325
kcf2[] fillarray 1150,2000, 2140, 800, 700
kcf3[] fillarray 2900,2800, 2950, 2830, 2700

kbw1[] fillarray 80, 60, 60, 40, 50
kbw2[] fillarray 90, 100, 90, 80, 60
kbw3[] fillarray 120, 120, 100, 100, 170

ka2[] fillarray -6, -20, -12, -11, -16
ka3[] fillarray -32, -15, -26, -22, -35

af1 reson asig, kcf1[kn], kbw1[kn], 1  
af2 reson asig, kcf2[kn], kbw2[kn], 1
af3 reson asig, kcf3[kn], kbw3[kn], 1
amix = af1 + af2*ampdb(ka2[kn]) + af3*ampdb(ka3[kn])  
   out linenr(amix,0.1,0.1,0.01)
endin

schedule(1,0,2,0.5,cpsmidinn(50),4)
schedule(1,2,3,0.5,cpsmidinn(57),3)
schedule(1,5,4,0.5,cpsmidinn(55),2)
schedule(1,9,2,0.5,cpsmidinn(54),1)
schedule(1,11,4,0.5,cpsmidinn(53),0)

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
