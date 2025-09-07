<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

0dbfs = 1
nchnls = 2
gasig init 0

instr 1
 Samp = "flutec3.pvx"    // analysis file
 kcps cpsmidib 2         // midi cps 
 iamp ampmidi 0dbfs*0.1  // midi amp
 ktpt = phasor(1/4)*4 + 1  // looping time pointer 
 adds pvadd ktpt, kcps/cpsmidinn(60), Samp, -1, 128 
 asig linenr  adds*iamp, 0.001,0.05,0.01  // envelope
 outs asig, asig
 gasig += asig*0.1
endin

instr 2   // reverb
  al, ar reverbsc gasig, gasig, 0.7, 5000
  outs al, ar
  gasig = 0
endin

</CsInstruments>
<CsScore>
i2 0 z
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
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
