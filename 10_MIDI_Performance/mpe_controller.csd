<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
  iamp ampmidi 0dbfs
  kaft aftouch -iamp, iamp // aftertouch modulates amplitude
  kcps cpsmidib 48 // Seaboard is calibrated to 48 steps/octave
  kmod midic7 74,0,1  // slide controls vibrato amount
  kamp port (kaft+iamp)/2, 0.01 // smooth amplitude
  aosc vco2 kamp,kcps
  afil moogladder aosc, kcps+5000*kmod,0.7
  asig linenr afil,0.01,0.1,0.01
  out asig
endin


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
