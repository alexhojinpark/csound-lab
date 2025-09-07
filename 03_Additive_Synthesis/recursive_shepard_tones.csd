<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

gigau ftgen  0, 0, 16384, 20, 6, 1  // gaussian function table   
giexp ftgen  0, 0, 16384, 5, 1, 16384, 2^-10   //  exponential table 

instr 1
 idur = p3  
 amp   oscili  1, 1/idur, gigau,  p4
 afreq  oscili  1, 1/idur, giexp, p4 
 asig    oscili  amp,afreq*p5
        out asig*0.1    
 if p4 < 1 then
  schedule 1,0,120,p4+0.1,p5
 endif
endin

schedule 1,0,120,0,6000


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
