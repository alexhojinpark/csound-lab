<CsoundSynthesizer>
<CsOptions>
-odac --midi-key-cps=5 --midi-velocity-amp=4
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1

 idur[] fillarray  1, 0.9, 0.65, 0.55, 0.35, 0.325, 0.25, 0.2, 0.15, 0.1, 0.075
 iamp[] fillarray 1, 0.67, 1, 1.8, 1.67, 2.67, 1.46,1.33, 1.33,1, 1.33
 ifreq[] fillarray  0.58, 058, 0.91, 0.91, 1.6, 1.2, 2, 2.7, 3,  3.75, 4.09
 iadd[] fillarray  1,0,1.7,0,0,0,0,0,0,0,0

 if p3 > 0 then // schedule
  ilen = p3
 else  // MIDI
  ilen = 10
 endif
 ifr = p5
 ia = p4
 ik = 0 
 while ik < 11 do
   schedule(2, 0, idur[ik]*ilen, iamp[ik]*ia, ifreq[ik]*ifr, iadd[ik])
   ik += 1
 od

endin


instr 2
 k1   expon 1,  p3,  0.001  /* exp from 1 to 10^-3 (-60dB) */
 asig oscili k1*p4,p5+p6    /* partial tone */
 out asig/11
endin

schedule(1,0,5,0.5,400)
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
