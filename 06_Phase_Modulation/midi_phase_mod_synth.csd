<CsoundSynthesizer>
<CsOptions>
-odac -d -m0
</CsOptions>
<CsInstruments>

0dbfs = 1

// NB: open widgets window to see controls
chnset 5, "index" // initial widget value
chnset 1, "ratio" // iinitial widget value
instr 1
i2pi = 2*$M_PI
 kndx chnget "index" // index from slider
 kndx port kndx,0.01 
 iamp ampmidi 0dbfs/4
 kfc cpsmidib 12
 krat chnget "ratio" // ratio from spinbox
 kfm = kfc*krat
 kndx linenr kndx,0.01,0.1,0.01
 kamp linenr iamp,0.01,0.1,0.01 
 amod oscili kndx/i2pi, kfm  // sine modulator
 aph  phasor kfc                 // carrier phase
 apm  tablei   aph+amod, -1, 1, 0, 1  // sine carrier
 out apm*kamp
endin


</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>






<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>678</x>
 <y>58</y>
 <width>398</width>
 <height>235</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>11</x>
  <y>12</y>
  <width>371</width>
  <height>201</height>
  <uuid>{aac778a0-532e-4f51-9188-7c030b2bf00f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label/>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>181</g>
   <b>214</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBHSlider">
  <objectName>index</objectName>
  <x>30</x>
  <y>118</y>
  <width>247</width>
  <height>54</height>
  <uuid>{a721feb7-0d01-4bb2-8efd-485aa9677778}</uuid>
  <visible>true</visible>
  <midichan>1</midichan>
  <midicc>1</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>ratio</objectName>
  <x>30</x>
  <y>83</y>
  <width>80</width>
  <height>25</height>
  <uuid>{a7b7d09e-426f-4095-89bd-d95c059c1438}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.10000000</resolution>
  <minimum>1</minimum>
  <maximum>2</maximum>
  <randomizable group="0">false</randomizable>
  <value>1.3</value>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>29</x>
  <y>35</y>
  <width>253</width>
  <height>41</height>
  <uuid>{9c5f149c-165c-4d04-b2e6-736a8dfa37a9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>MIDI FM Synth </label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>24</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>118</x>
  <y>83</y>
  <width>80</width>
  <height>25</height>
  <uuid>{b969b433-bb7c-4f66-8984-c7399ec18572}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>C:M ratio</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>index</objectName>
  <x>281</x>
  <y>145</y>
  <width>80</width>
  <height>25</height>
  <uuid>{1a7a9b55-f9f5-4974-b598-36c427798a19}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.000</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>280</x>
  <y>118</y>
  <width>80</width>
  <height>25</height>
  <uuid>{c5fff0d8-1d20-4641-99a9-ece4b06f7e67}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>index</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
