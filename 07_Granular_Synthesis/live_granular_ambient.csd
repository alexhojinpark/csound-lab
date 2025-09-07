<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

;;channels
chn_k "bandw",3
chn_k "dens",3
chn_k "oct",3
chn_k "grain dur",3
chn_k "pitch",3
chn_k "time",3

// grain envelope
gife ftgen 0,0,16384,7,0,16384,1

instr 1
  // function table as buffer 
  // FOG requires a power-of-2 size table
  ifw ftgen 0,0,2^17,2,0
  // audio input from chan 1
  ain inch 1
  // phasor to index table writing
  aph  phasor sr/(ftlen(ifw))
  // table writing
  tablew ain,aph,ifw,1
  imaxds = 1000   // max density
  imols  = 0.5*imaxds // max overlap     
  kpitch chnget "pitch"           
  kds chnget "dens"
  kband chnget "bandw"
  kgd chnget "grain dur" 
  kris = 0.007
  kdec = 0.002 
  koct  chnget "oct"
  ksp chnget "time"              
  aspd = aph*ksp
  kds = kds*imaxds
  ia  = 0dbfs/2           
  asig fog ia, kds, kpitch, aspd, koct,    
           kband, kris, kgd, kdec, imols,   
           ifw, gife, p3
          out   asig
endin


</CsInstruments>
<CsScore>
i1 0 z 
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
  <x>19</x>
  <y>7</y>
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
  <xValue>1.17948718</xValue>
  <yValue>0.81967213</yValue>
  <type>crosshair</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#0000ff</borderColor>
  <color>
   <r>0</r>
   <g>89</g>
   <b>38</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>194</r>
   <g>183</g>
   <b>113</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>grain dur</objectName>
  <x>21</x>
  <y>319</y>
  <width>90</width>
  <height>103</height>
  <uuid>{ff0d1f20-d559-464e-b632-582ea177fe4f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.01000000</minimum>
  <maximum>0.50000000</maximum>
  <value>0.20972400</value>
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
  <objectName>dens</objectName>
  <x>117</x>
  <y>320</y>
  <width>90</width>
  <height>103</height>
  <uuid>{a274f61e-4042-47a6-bc6e-7ebf1f7e0fbf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00100000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.75624400</value>
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
  <x>126</x>
  <y>422</y>
  <width>72</width>
  <height>33</height>
  <uuid>{d05aa34d-8c12-4b74-ae47-0e9d9a619ae7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>density</label>
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
  <x>94</x>
  <y>485</y>
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
  <x>219</x>
  <y>484</y>
  <width>95</width>
  <height>34</height>
  <uuid>{2ea5ca8a-1ca8-4ef9-8671-536693057913}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.820</label>
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
  <x>94</x>
  <y>517</y>
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
  <x>219</x>
  <y>516</y>
  <width>95</width>
  <height>33</height>
  <uuid>{9fa6891b-b91a-4d43-b2cf-1a5bc060d032}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>1.179</label>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>oct</objectName>
  <x>211</x>
  <y>320</y>
  <width>90</width>
  <height>103</height>
  <uuid>{b9856404-29d5-470e-b068-bd8364859814}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>5.00000000</maximum>
  <value>2.42650000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>251</r>
   <g>72</g>
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
  <x>207</x>
  <y>422</y>
  <width>99</width>
  <height>33</height>
  <uuid>{7be57659-39a0-4cf4-bfe8-4273886b3236}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>octaviation</label>
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
  <objectName>bandw</objectName>
  <x>307</x>
  <y>321</y>
  <width>90</width>
  <height>103</height>
  <uuid>{fe877f06-d500-43bd-b1c8-99831fea29dc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>1.00000000</minimum>
  <maximum>100.00000000</maximum>
  <value>26.94790000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>68</r>
   <g>234</g>
   <b>233</b>
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
  <x>303</x>
  <y>423</y>
  <width>98</width>
  <height>33</height>
  <uuid>{fd38ba2a-c22f-43e3-8947-14d2260e3855}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>bandwidth</label>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
