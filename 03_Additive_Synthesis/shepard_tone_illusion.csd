<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1

idur = p3                                  /* cycle lasts for p3 secs */ 
amp   oscili  1, 1/idur, gigau,  p4    / * amp, p4 is start pos (0-0.9) */  
afreq  oscili  1, 1/idur, giexp, p4     /* freq, p4 is start pos (0-0.9) */
asig    oscili  amp,afreq*p5      /*  partial  */
        out asig*0.1

endin

gigau ftgen  0, 0, 16384, 20, 6, 1  // gaussian function table   
giexp ftgen  0, 0, 16384, 5, 1, 16384, 2^-10   //  exponential table 

// 10 components, note how p4 goes from 0 to 0.9
ik = 0
while ik < 10 do
  schedule(1, 0, 120, 0.1*ik, 6000)  ///
  ik += 1
od 
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
