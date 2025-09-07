<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

;;channels
chn_k "overlaps",3
chn_k "grain dur",3
chn_k "pitch",3
chn_k "time",3

// grain envelope
gife ftgen 0,0,16384,20,1,1

instr 1
  // function table as buffer (p4 secs long)
  ifw ftgen 0,0,p4*sr,2,0
  // audio input from chan 1
  ain inch 1
  // phasor to index table writing
  aph  phasor sr/(ftlen(ifw))
  // table writing
  tablew ain,aph,ifw,1

  ktime chnget "time"        
  kpitch chnget "pitch"           
  kols chnget "overlaps"                
  kps = ktime/kols       //  pointer rate 
  ia  = 0dbfs/2           //   amplitude     
  kgd chnget "grain dur"  //  grain duration 
  kds = kols/kgd         //  grain density (grains/sec)                     
  asig syncgrain  ia, kds, kpitch, kgd, kps, ifw, gife, 5
          out   asig
endin


</CsInstruments>
<CsScore>
i1 0 z 2
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
 <bsbObject version="2" type="BSBController">
  <objectName>time</objectName>
  <x>20</x>
  <y>2</y>
  <width>390</width>
  <height>305</height>
  <uuid>{640d4cdb-dcd7-465d-bd16-1a41ccb59695}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>pitch</objectName2>
  <xMin>-2.00000000</xMin>
  <xMax>2.00000000</xMax>
  <yMin>-2.00000000</yMin>
  <yMax>2.00000000</yMax>
  <xValue>-0.68717949</xValue>
  <yValue>-1.20000000</yValue>
  <type>crosshair</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00d2fb</borderColor>
  <color>
   <r>245</r>
   <g>48</g>
   <b>27</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>89</r>
   <g>79</g>
   <b>172</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>grain dur</objectName>
  <x>22</x>
  <y>320</y>
  <width>90</width>
  <height>103</height>
  <uuid>{ff0d1f20-d559-464e-b632-582ea177fe4f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.01000000</minimum>
  <maximum>0.50000000</maximum>
  <value>0.05272800</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>244</r>
   <g>138</g>
   <b>200</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>22</x>
  <y>422</y>
  <width>90</width>
  <height>33</height>
  <uuid>{13feba50-15fe-4b23-90ea-c9a5a60fb98d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>grain dur</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>overlaps</objectName>
  <x>117</x>
  <y>320</y>
  <width>90</width>
  <height>103</height>
  <uuid>{a274f61e-4042-47a6-bc6e-7ebf1f7e0fbf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.10000000</minimum>
  <maximum>4.00000000</maximum>
  <value>1.72903000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>187</r>
   <g>237</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>118</x>
  <y>422</y>
  <width>90</width>
  <height>33</height>
  <uuid>{d05aa34d-8c12-4b74-ae47-0e9d9a619ae7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>overlaps</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <x>226</x>
  <y>317</y>
  <width>125</width>
  <height>32</height>
  <uuid>{c896e2bb-5a18-4448-ae1b-f8fbcc67ff8b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>vertical: pitch
</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <objectName>pitch</objectName>
  <x>351</x>
  <y>316</y>
  <width>95</width>
  <height>34</height>
  <uuid>{2ea5ca8a-1ca8-4ef9-8671-536693057913}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>-1.200</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <x>226</x>
  <y>349</y>
  <width>125</width>
  <height>31</height>
  <uuid>{b4acdce1-9cd2-45d0-b121-695a94e0ee76}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>horiz: time
</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
  <objectName>time</objectName>
  <x>351</x>
  <y>348</y>
  <width>95</width>
  <height>33</height>
  <uuid>{9fa6891b-b91a-4d43-b2cf-1a5bc060d032}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>-0.687</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>20</fontsize>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
