<CsoundSynthesizer>
<CsOptions>
-odac --midi-key-cps=5 --midi-velocity-amp=4
</CsOptions>
<CsInstruments>
0dbfs = 1
instr 1
 idur[] fillarray 1,.2,.15,.05
 ifr[] fillarray 1,5.1,6.95,13.3   
 iamp[] fillarray 1,0.1,0.05,0.01
 itot = 800/p5
 icnt = 0
 insts = lenarray(idur)
 while icnt < insts do
   schedule(2,0,idur[icnt]*itot,iamp[icnt]*p4,ifr[icnt]*p5)
   icnt+=1
 od
endin

instr 2
 amp expon  p4, p3, 0.001
 out oscili(amp, p5)
endin
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>




<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>916</x>
 <y>629</y>
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
