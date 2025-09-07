<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1
    indx = p6   // deviation
    ifm = p7    // frequency modulation
    ifc = p5
    iamp = p4

    k1 line 0, p3, p6

    amod oscili k1 * ifm, ifm     // amp, freq
    acar oscili iamp, amod + ifc    // 

    out acar
endin    

schedule(1, 0, 4, 0.5, 440, 50, 50)

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
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
