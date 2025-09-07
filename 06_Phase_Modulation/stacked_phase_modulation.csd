<CsoundSynthesizer>
<CsOptions>

</CsOptions>
<CsInstruments>

; Make sure CsOptions are not ignored in the preferences,
; Otherwise Realtime MIDI input will not work.
nchnls = 2
0dbfs = 1

chnset 0,"op5amp"
chnset 1,"op5ratio"

chnset  0.001,"op5att"
chnset  0.001,"op5dec"
chnset  0,"op5sus"
chnset  0.001,"op5rel"

chnset  0,"op4amp"
chnset  1,"op4ratio"

chnset  0.001,"op4att"
chnset  0.001,"op4dec"
chnset  0,"op4sus"
chnset  0.001,"op4rel"

chnset  0,"op3amp"
chnset  1,"op3ratio"

chnset 0.001,"op3att"
chnset  0.001,"op3dec"
chnset  0,"op3sus"
chnset  0.001,"op3rel"

chnset  0,"op2amp"
chnset  1,"op2ratio"

chnset  0.001,"op2att"
chnset  0,"op2dec"
chnset  0,"op2sus"
chnset  0.001,"op2rel"

chnset  0.5,"op1amp"
chnset  1,"op1ratio"

chnset  0.1,"op1att"
chnset  0.1,"op1dec"
chnset  0.8,"op1sus"
chnset  0.1,"op1rel"


instr 1
kcps cpsmidib 2
iamp ampmidi 0dbfs/4

iop5amp chnget "op5amp"
iop5ratio chnget "op5ratio"

iop5att chnget "op5att"
iop5dec chnget "op5dec"
iop5sus chnget "op5sus"
iop5rel chnget "op5rel"

iop4amp chnget "op4amp"
iop4ratio chnget "op4ratio"

iop4att chnget "op4att"
iop4dec chnget "op4dec"
iop4sus chnget "op4sus"
iop4rel chnget "op4rel"

iop3amp chnget "op3amp"
iop3ratio chnget "op3ratio"

iop3att chnget "op3att"
iop3dec chnget "op3dec"
iop3sus chnget "op3sus"
iop3rel chnget "op3rel"

iop2amp chnget "op2amp"
iop2ratio chnget "op2ratio"

iop2att chnget "op2att"
iop2dec chnget "op2dec"
iop2sus chnget "op2sus"
iop2rel chnget "op2rel"

iop1amp chnget "op1amp"
iop1ratio chnget "op1ratio"

iop1att chnget "op1att"
iop1dec chnget "op1dec"
iop1sus chnget "op1sus"
iop1rel chnget "op1rel"

amod5 oscili iop5amp,kcps*iop5ratio
amod5 *= madsr(iop5att,iop5dec,iop5sus,iop5rel)

amod4 table3 phasor(kcps*iop4ratio)+amod5,-1, 1, 0, 1
amod4 *= madsr(iop4att,iop4dec,iop4sus,iop4rel)*iop4amp

amod3 oscili iop3amp, kcps*iop3ratio
amod3 *= madsr(iop3att, iop3dec, iop3sus, iop3rel)

amod2 table3 phasor(kcps*iop2ratio)+amod3,-1, 1, 0, 1
amod2 *= madsr(iop2att,iop2dec,iop2sus,iop2rel)*iop2amp

acar table3 phasor(kcps*iop1ratio)+amod2+amod4,-1, 1, 0, 1
acar *= madsr(iop1att,iop1dec,iop1sus,iop1rel)*iop1amp*iamp
   
   out acar, acar

endin

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>























<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>883</x>
 <y>44</y>
 <width>500</width>
 <height>636</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>125</r>
  <g>162</g>
  <b>160</b>
 </bgcolor>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>342</x>
  <y>500</y>
  <width>149</width>
  <height>97</height>
  <uuid>{69273a5b-5475-4f67-8752-66a5275b0030}</uuid>
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
   <r>168</r>
   <g>146</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>9</x>
  <y>7</y>
  <width>460</width>
  <height>58</height>
  <uuid>{b3786a91-65c2-4a82-aca2-9c3c6cf79bb8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Phase Modulation Synth</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>40</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>176</r>
   <g>174</g>
   <b>127</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>8</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>118</x>
  <y>229</y>
  <width>20</width>
  <height>36</height>
  <uuid>{79ded5ea-d436-477d-bea5-e060d85e7ce8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label/>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>51</r>
   <g>167</g>
   <b>125</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>342</x>
  <y>228</y>
  <width>20</width>
  <height>36</height>
  <uuid>{89ab4214-a85b-4e6b-816a-edeab338e238}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label/>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>51</r>
   <g>167</g>
   <b>125</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>23</x>
  <y>77</y>
  <width>207</width>
  <height>157</height>
  <uuid>{77b2a162-a2a2-42a6-8f0e-c561dc532f65}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>OP3</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>51</r>
   <g>167</g>
   <b>125</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op3amp</objectName>
  <x>35</x>
  <y>102</y>
  <width>20</width>
  <height>100</height>
  <uuid>{a4d4c497-04d4-4b7d-ad51-0f8832cb64bf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op3att</objectName>
  <x>130</x>
  <y>100</y>
  <width>20</width>
  <height>100</height>
  <uuid>{b418386f-afe6-4d3c-b8d6-c6c96885e9ab}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>3.00000000</maximum>
  <value>0.00000100</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op3dec</objectName>
  <x>154</x>
  <y>99</y>
  <width>20</width>
  <height>100</height>
  <uuid>{f2ac6272-b33d-44fc-bb1e-fe52087e3a2b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>2.00000000</maximum>
  <value>0.00100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op3sus</objectName>
  <x>177</x>
  <y>100</y>
  <width>20</width>
  <height>100</height>
  <uuid>{8052b29d-d6ae-4249-b9cd-1788a2faf77c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op3rel</objectName>
  <x>201</x>
  <y>100</y>
  <width>20</width>
  <height>100</height>
  <uuid>{3efde0c1-5828-4875-a997-174989989aa9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>op3ratio</objectName>
  <x>57</x>
  <y>134</y>
  <width>67</width>
  <height>25</height>
  <uuid>{fa34129e-d983-460c-bd0e-89fb3e798bcb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <resolution>0.00100000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>251</x>
  <y>78</y>
  <width>205</width>
  <height>154</height>
  <uuid>{a29dadfa-06d3-42ff-9be7-2c2b665c6457}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>OP5</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>51</r>
   <g>167</g>
   <b>125</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op5amp</objectName>
  <x>265</x>
  <y>102</y>
  <width>20</width>
  <height>100</height>
  <uuid>{17b249bd-27ed-44c7-9bac-a847a81165e3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op5att</objectName>
  <x>357</x>
  <y>100</y>
  <width>20</width>
  <height>100</height>
  <uuid>{cba3fee2-d2a5-41b2-8842-34be212fa82a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>3.00000000</maximum>
  <value>0.00100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op5dec</objectName>
  <x>380</x>
  <y>100</y>
  <width>20</width>
  <height>100</height>
  <uuid>{f0305ec9-814b-4107-a9b5-55a5a13f0118}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>2.00000000</maximum>
  <value>0.00100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op5sus</objectName>
  <x>403</x>
  <y>100</y>
  <width>20</width>
  <height>100</height>
  <uuid>{9f495b69-cdca-43c7-bc92-f26d9995caed}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op5rel</objectName>
  <x>428</x>
  <y>100</y>
  <width>20</width>
  <height>100</height>
  <uuid>{3f29a847-8cf1-4076-9a69-e88b5360a810}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>op5ratio</objectName>
  <x>288</x>
  <y>130</y>
  <width>66</width>
  <height>25</height>
  <uuid>{2ea377f7-6c31-4556-8e26-e47d9b6c000a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <resolution>0.00100000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>129</x>
  <y>201</y>
  <width>20</width>
  <height>24</height>
  <uuid>{ef04fec4-5097-41de-b84c-782d4c63ae2f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>A</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>154</x>
  <y>200</y>
  <width>20</width>
  <height>24</height>
  <uuid>{dc9bad3e-fad8-4dc0-b647-422ed5adde6b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>D</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>177</x>
  <y>201</y>
  <width>20</width>
  <height>24</height>
  <uuid>{66e15fa8-27eb-46e1-9cdb-f830f097d031}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>S</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>201</x>
  <y>201</y>
  <width>20</width>
  <height>24</height>
  <uuid>{c7195432-9a95-4ffe-a035-6d524879cf6d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>R</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>30</x>
  <y>206</y>
  <width>41</width>
  <height>23</height>
  <uuid>{3c15890b-b431-4e39-ad32-10d6aec01137}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Amp</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>57</x>
  <y>160</y>
  <width>69</width>
  <height>24</height>
  <uuid>{50d05735-5c47-4ef0-90be-4a5c28c26b38}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Ratio</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>357</x>
  <y>201</y>
  <width>20</width>
  <height>24</height>
  <uuid>{890cf939-2a60-45f7-bf80-ced55467d308}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>A</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>381</x>
  <y>201</y>
  <width>20</width>
  <height>24</height>
  <uuid>{8bc430eb-9120-43ae-bc3d-43bbab4d845c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>D</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>404</x>
  <y>201</y>
  <width>20</width>
  <height>24</height>
  <uuid>{4e94aaf2-e19a-4f03-8395-077ac582c51c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>S</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>429</x>
  <y>201</y>
  <width>20</width>
  <height>24</height>
  <uuid>{9d569d13-5bbd-4898-9be6-8b31eddb51b9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>R</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>258</x>
  <y>201</y>
  <width>41</width>
  <height>23</height>
  <uuid>{9f5f34a2-6968-464b-8e67-76c9d61ade3f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Amp</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>287</x>
  <y>155</y>
  <width>69</width>
  <height>24</height>
  <uuid>{0f8604e0-9429-4fdd-89be-0315b4a8193e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Ratio</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>105</x>
  <y>414</y>
  <width>20</width>
  <height>36</height>
  <uuid>{c40e8881-b4e1-4180-b2fb-b50db212908f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label/>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>51</r>
   <g>167</g>
   <b>125</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>346</x>
  <y>414</y>
  <width>20</width>
  <height>36</height>
  <uuid>{28d08405-51a5-4985-894a-343524746511}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label/>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>51</r>
   <g>167</g>
   <b>125</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>227</x>
  <y>441</y>
  <width>20</width>
  <height>36</height>
  <uuid>{b5b54ae5-3252-4061-a01b-a7049dcac1db}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label/>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>51</r>
   <g>167</g>
   <b>125</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>105</x>
  <y>434</y>
  <width>262</width>
  <height>16</height>
  <uuid>{3ad14511-0d96-408a-b822-cc3dc6f02115}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label/>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>51</r>
   <g>167</g>
   <b>125</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>5</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>23</x>
  <y>262</y>
  <width>204</width>
  <height>157</height>
  <uuid>{dd32f942-5cbb-4f95-9825-913f98789a9c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>OP2</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>51</r>
   <g>167</g>
   <b>125</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op2amp</objectName>
  <x>35</x>
  <y>285</y>
  <width>20</width>
  <height>100</height>
  <uuid>{a6a5a56d-13c6-4c09-b6e8-74086df6e352}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>op2ratio</objectName>
  <x>56</x>
  <y>316</y>
  <width>67</width>
  <height>26</height>
  <uuid>{dde869a9-5d2a-454c-bff8-b8d407d19e87}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <resolution>0.00100000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op2att</objectName>
  <x>127</x>
  <y>284</y>
  <width>20</width>
  <height>100</height>
  <uuid>{623cf6cd-548c-4212-ac65-a4761cfb5b7f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>3.00000000</maximum>
  <value>0.00100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op2dec</objectName>
  <x>150</x>
  <y>284</y>
  <width>20</width>
  <height>100</height>
  <uuid>{833bd2f5-fae9-441b-82ad-9117ffd29877}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>2.00000000</maximum>
  <value>0.00000100</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op2sus</objectName>
  <x>174</x>
  <y>284</y>
  <width>20</width>
  <height>100</height>
  <uuid>{d520e71a-b3e2-46d4-b0c6-688085fe5742}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op2rel</objectName>
  <x>197</x>
  <y>284</y>
  <width>20</width>
  <height>100</height>
  <uuid>{ced1a494-71e9-4bc0-9973-a872920a4473}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>130</x>
  <y>471</y>
  <width>207</width>
  <height>148</height>
  <uuid>{38b062a3-b02c-46a8-8b6a-e6cab196bb10}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>OP1</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>51</r>
   <g>167</g>
   <b>125</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op1amp</objectName>
  <x>145</x>
  <y>490</y>
  <width>20</width>
  <height>100</height>
  <uuid>{16c48afd-7c15-4e07-beee-ce56c7b61c80}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.50000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>op1ratio</objectName>
  <x>167</x>
  <y>523</y>
  <width>67</width>
  <height>25</height>
  <uuid>{e1aa96cf-3e30-4ad2-93ec-1494a0d60079}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <resolution>0.00100000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op1att</objectName>
  <x>237</x>
  <y>487</y>
  <width>20</width>
  <height>100</height>
  <uuid>{1a074887-a3a3-43ee-8de2-34b8e6a7a5a5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>3.00000000</maximum>
  <value>0.10000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op1dec</objectName>
  <x>260</x>
  <y>487</y>
  <width>20</width>
  <height>100</height>
  <uuid>{e1352cbc-9c2a-4650-8957-fb055156903b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>2.00000000</maximum>
  <value>0.10000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op1sus</objectName>
  <x>283</x>
  <y>487</y>
  <width>20</width>
  <height>100</height>
  <uuid>{3f7ea94f-e14d-4b53-8bbd-53563d0c23c1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.80000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op1rel</objectName>
  <x>308</x>
  <y>487</y>
  <width>20</width>
  <height>100</height>
  <uuid>{9c657ab3-a738-40e2-92ae-b1128863fd78}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>1.00000000</maximum>
  <value>0.10000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>252</x>
  <y>263</y>
  <width>206</width>
  <height>155</height>
  <uuid>{356606cf-01fa-442e-a9ab-fb459546b3fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>OP4</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>51</r>
   <g>167</g>
   <b>125</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op4amp</objectName>
  <x>265</x>
  <y>286</y>
  <width>20</width>
  <height>100</height>
  <uuid>{56e321a8-c542-420c-a494-e759e36ea78a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>op4ratio</objectName>
  <x>289</x>
  <y>320</y>
  <width>66</width>
  <height>25</height>
  <uuid>{77ce606f-b1c5-4911-bf36-79ea1b8f50ef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <resolution>0.00100000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op4att</objectName>
  <x>359</x>
  <y>285</y>
  <width>20</width>
  <height>100</height>
  <uuid>{fec79e7f-6c43-482f-9fff-cedfc13eaea7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>3.00000000</maximum>
  <value>0.00100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op4dec</objectName>
  <x>382</x>
  <y>285</y>
  <width>20</width>
  <height>100</height>
  <uuid>{964db287-6df1-4fa8-baba-1e387d1fac12}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>2.00000000</maximum>
  <value>0.00100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op4sus</objectName>
  <x>405</x>
  <y>285</y>
  <width>20</width>
  <height>100</height>
  <uuid>{7844fda3-a049-4ec6-885f-cba693b160c9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>op4rel</objectName>
  <x>429</x>
  <y>285</y>
  <width>20</width>
  <height>100</height>
  <uuid>{37d2f1f5-7da1-460a-a8a0-9d70e19e7da0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000100</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">true</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>126</x>
  <y>385</y>
  <width>20</width>
  <height>24</height>
  <uuid>{b1dc4c67-cba3-42ce-adb9-c6b944168df2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>A</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>150</x>
  <y>385</y>
  <width>20</width>
  <height>24</height>
  <uuid>{4b3fa88c-42bb-4680-85b5-6af3c93f5c2e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>D</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>174</x>
  <y>385</y>
  <width>20</width>
  <height>24</height>
  <uuid>{e66791e9-d9d8-4304-827e-d759f1490bf2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>S</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>197</x>
  <y>385</y>
  <width>20</width>
  <height>24</height>
  <uuid>{4fd5c980-8bd6-410c-87a2-894ae57ccdf4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>R</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>30</x>
  <y>388</y>
  <width>41</width>
  <height>23</height>
  <uuid>{afe5eb18-768e-4717-b3da-a23ae0086a93}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Amp</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>55</x>
  <y>342</y>
  <width>69</width>
  <height>24</height>
  <uuid>{185f48d8-f6d2-42de-a2a0-ad606ea9123b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Ratio</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>359</x>
  <y>387</y>
  <width>20</width>
  <height>24</height>
  <uuid>{d1dd7fa0-fecf-48de-bfb9-f1f2f936f9ef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>A</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>383</x>
  <y>387</y>
  <width>20</width>
  <height>24</height>
  <uuid>{24f48f2a-cb3a-4366-9299-fe719719f4fa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>D</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>406</x>
  <y>388</y>
  <width>20</width>
  <height>24</height>
  <uuid>{8956f647-16c2-4c0d-988b-7a5453b6a284}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>S</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>430</x>
  <y>387</y>
  <width>20</width>
  <height>24</height>
  <uuid>{80cafd39-6361-455e-9959-4bd6506f3ecf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>R</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>261</x>
  <y>390</y>
  <width>41</width>
  <height>23</height>
  <uuid>{16d50ce9-d0cb-45ba-b551-d6180c0038fa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Amp</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>289</x>
  <y>345</y>
  <width>69</width>
  <height>24</height>
  <uuid>{06c3ffcc-53de-41e6-83df-c430abc944a1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Ratio</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>236</x>
  <y>588</y>
  <width>20</width>
  <height>24</height>
  <uuid>{7889c373-cc15-4136-ace9-7be2d2d9e3db}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>A</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>260</x>
  <y>588</y>
  <width>20</width>
  <height>24</height>
  <uuid>{ba42364c-3715-4f27-b15f-5bb18503f651}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>D</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>283</x>
  <y>588</y>
  <width>20</width>
  <height>24</height>
  <uuid>{e32346e4-bdef-4880-bce0-dcdfdc1dd403}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>S</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>307</x>
  <y>588</y>
  <width>20</width>
  <height>24</height>
  <uuid>{dfbf72b3-90bc-4cfa-9586-c8df21bae761}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>R</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>138</x>
  <y>591</y>
  <width>41</width>
  <height>23</height>
  <uuid>{b81b0da7-0b90-4e67-a963-420104b771a1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Amp</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>166</x>
  <y>546</y>
  <width>69</width>
  <height>24</height>
  <uuid>{14cbfca6-cc9f-40f5-acaf-e28ffcf88ad3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Ratio</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>_SetPresetIndex</objectName>
  <x>350</x>
  <y>554</y>
  <width>47</width>
  <height>26</height>
  <uuid>{b00b7ada-e33c-40f3-985c-02844e9bb94f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
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
  <resolution>1.00000000</resolution>
  <minimum>0</minimum>
  <maximum>3</maximum>
  <randomizable group="0">false</randomizable>
  <value>3</value>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>_GetPresetName</objectName>
  <x>399</x>
  <y>555</y>
  <width>83</width>
  <height>26</height>
  <uuid>{63ef1797-ed71-4fea-b7f3-0faf78a0e28a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Wobbly Bass</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
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
  <bordermode>border</bordermode>
  <borderradius>5</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>363</x>
  <y>516</y>
  <width>103</width>
  <height>33</height>
  <uuid>{fa879072-1e6b-44ed-9f8d-99ed15de8733}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>PRESET</label>
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
</bsbPanel>
<bsbPresets>
<preset name="Default" number="0" >
<value id="{a4d4c497-04d4-4b7d-ad51-0f8832cb64bf}" mode="1" >0.00000000</value>
<value id="{b418386f-afe6-4d3c-b8d6-c6c96885e9ab}" mode="1" >0.00000100</value>
<value id="{f2ac6272-b33d-44fc-bb1e-fe52087e3a2b}" mode="1" >0.00000100</value>
<value id="{8052b29d-d6ae-4249-b9cd-1788a2faf77c}" mode="1" >0.00000000</value>
<value id="{3efde0c1-5828-4875-a997-174989989aa9}" mode="1" >0.00000100</value>
<value id="{fa34129e-d983-460c-bd0e-89fb3e798bcb}" mode="1" >1.00000000</value>
<value id="{17b249bd-27ed-44c7-9bac-a847a81165e3}" mode="1" >0.00000000</value>
<value id="{cba3fee2-d2a5-41b2-8842-34be212fa82a}" mode="1" >0.00000100</value>
<value id="{f0305ec9-814b-4107-a9b5-55a5a13f0118}" mode="1" >0.00000100</value>
<value id="{9f495b69-cdca-43c7-bc92-f26d9995caed}" mode="1" >0.00000000</value>
<value id="{3f29a847-8cf1-4076-9a69-e88b5360a810}" mode="1" >0.00000100</value>
<value id="{2ea377f7-6c31-4556-8e26-e47d9b6c000a}" mode="1" >1.00000000</value>
<value id="{a6a5a56d-13c6-4c09-b6e8-74086df6e352}" mode="1" >0.00000000</value>
<value id="{dde869a9-5d2a-454c-bff8-b8d407d19e87}" mode="1" >1.00000000</value>
<value id="{623cf6cd-548c-4212-ac65-a4761cfb5b7f}" mode="1" >0.00000100</value>
<value id="{833bd2f5-fae9-441b-82ad-9117ffd29877}" mode="1" >0.00000100</value>
<value id="{d520e71a-b3e2-46d4-b0c6-688085fe5742}" mode="1" >0.00000000</value>
<value id="{ced1a494-71e9-4bc0-9973-a872920a4473}" mode="1" >0.00000100</value>
<value id="{16c48afd-7c15-4e07-beee-ce56c7b61c80}" mode="1" >0.50000000</value>
<value id="{e1aa96cf-3e30-4ad2-93ec-1494a0d60079}" mode="1" >1.00000000</value>
<value id="{1a074887-a3a3-43ee-8de2-34b8e6a7a5a5}" mode="1" >0.10000000</value>
<value id="{e1352cbc-9c2a-4650-8957-fb055156903b}" mode="1" >0.10000000</value>
<value id="{3f7ea94f-e14d-4b53-8bbd-53563d0c23c1}" mode="1" >0.80000001</value>
<value id="{9c657ab3-a738-40e2-92ae-b1128863fd78}" mode="1" >0.10000000</value>
<value id="{56e321a8-c542-420c-a494-e759e36ea78a}" mode="1" >0.00000000</value>
<value id="{77ce606f-b1c5-4911-bf36-79ea1b8f50ef}" mode="1" >1.00000000</value>
<value id="{fec79e7f-6c43-482f-9fff-cedfc13eaea7}" mode="1" >0.00000100</value>
<value id="{964db287-6df1-4fa8-baba-1e387d1fac12}" mode="1" >0.00000100</value>
<value id="{7844fda3-a049-4ec6-885f-cba693b160c9}" mode="1" >0.00000000</value>
<value id="{37d2f1f5-7da1-460a-a8a0-9d70e19e7da0}" mode="1" >0.00000100</value>
<value id="{b00b7ada-e33c-40f3-985c-02844e9bb94f}" mode="1" >0.00000000</value>
<value id="{63ef1797-ed71-4fea-b7f3-0faf78a0e28a}" mode="1" >0.00000000</value>
<value id="{63ef1797-ed71-4fea-b7f3-0faf78a0e28a}" mode="4" >Default</value>
</preset>
<preset name="Fairy Dust" number="1" >
<value id="{a4d4c497-04d4-4b7d-ad51-0f8832cb64bf}" mode="1" >0.60793877</value>
<value id="{b418386f-afe6-4d3c-b8d6-c6c96885e9ab}" mode="1" >0.87604076</value>
<value id="{f2ac6272-b33d-44fc-bb1e-fe52087e3a2b}" mode="1" >0.68532342</value>
<value id="{8052b29d-d6ae-4249-b9cd-1788a2faf77c}" mode="1" >0.87491655</value>
<value id="{3efde0c1-5828-4875-a997-174989989aa9}" mode="1" >0.24683115</value>
<value id="{fa34129e-d983-460c-bd0e-89fb3e798bcb}" mode="1" >3.61637497</value>
<value id="{17b249bd-27ed-44c7-9bac-a847a81165e3}" mode="1" >0.71242875</value>
<value id="{cba3fee2-d2a5-41b2-8842-34be212fa82a}" mode="1" >1.51931179</value>
<value id="{f0305ec9-814b-4107-a9b5-55a5a13f0118}" mode="1" >0.76090300</value>
<value id="{9f495b69-cdca-43c7-bc92-f26d9995caed}" mode="1" >0.27295068</value>
<value id="{3f29a847-8cf1-4076-9a69-e88b5360a810}" mode="1" >0.61171556</value>
<value id="{2ea377f7-6c31-4556-8e26-e47d9b6c000a}" mode="1" >0.17211232</value>
<value id="{a6a5a56d-13c6-4c09-b6e8-74086df6e352}" mode="1" >0.82246149</value>
<value id="{dde869a9-5d2a-454c-bff8-b8d407d19e87}" mode="1" >2.73157001</value>
<value id="{623cf6cd-548c-4212-ac65-a4761cfb5b7f}" mode="1" >1.93253195</value>
<value id="{833bd2f5-fae9-441b-82ad-9117ffd29877}" mode="1" >0.21393649</value>
<value id="{d520e71a-b3e2-46d4-b0c6-688085fe5742}" mode="1" >0.91956383</value>
<value id="{ced1a494-71e9-4bc0-9973-a872920a4473}" mode="1" >1.47231400</value>
<value id="{16c48afd-7c15-4e07-beee-ce56c7b61c80}" mode="1" >0.41843128</value>
<value id="{e1aa96cf-3e30-4ad2-93ec-1494a0d60079}" mode="1" >4.45120955</value>
<value id="{1a074887-a3a3-43ee-8de2-34b8e6a7a5a5}" mode="1" >0.25791028</value>
<value id="{e1352cbc-9c2a-4650-8957-fb055156903b}" mode="1" >0.32575035</value>
<value id="{3f7ea94f-e14d-4b53-8bbd-53563d0c23c1}" mode="1" >0.26118517</value>
<value id="{9c657ab3-a738-40e2-92ae-b1128863fd78}" mode="1" >1.78432512</value>
<value id="{56e321a8-c542-420c-a494-e759e36ea78a}" mode="1" >0.02822053</value>
<value id="{77ce606f-b1c5-4911-bf36-79ea1b8f50ef}" mode="1" >3.40845633</value>
<value id="{fec79e7f-6c43-482f-9fff-cedfc13eaea7}" mode="1" >1.85546792</value>
<value id="{964db287-6df1-4fa8-baba-1e387d1fac12}" mode="1" >1.85546792</value>
<value id="{7844fda3-a049-4ec6-885f-cba693b160c9}" mode="1" >1.00000000</value>
<value id="{37d2f1f5-7da1-460a-a8a0-9d70e19e7da0}" mode="1" >0.80882120</value>
<value id="{1713b2f6-0778-43b4-b81a-725331e94260}" mode="1" >0.88287294</value>
<value id="{608ebd5c-d7b3-4c9a-8075-2204844bc42c}" mode="1" >1.85216427</value>
<value id="{5f20cb6a-ad07-4210-aaa1-a0ee628ee2d4}" mode="1" >0.12375984</value>
<value id="{dc16cdf0-7371-4027-bac0-7d26d9d21433}" mode="1" >0.01545162</value>
<value id="{c211de7a-2f05-44f9-b09f-51523639dd8e}" mode="1" >1.01258862</value>
<value id="{da8941a6-25be-42bd-9fc4-eb3bf5e4e6e1}" mode="1" >1.81891644</value>
<value id="{8ade719c-f9d9-4348-91cc-a50077821391}" mode="1" >0.61456019</value>
<value id="{aaa01bed-d7bb-4690-a71e-1ae6f64afc5a}" mode="1" >5.21777058</value>
<value id="{21c7e2af-f1a0-41c0-be87-b103ea56c714}" mode="1" >1.79552197</value>
<value id="{32c4cf2e-a76a-46b1-89bf-a4e4d2924309}" mode="1" >0.56583136</value>
<value id="{b52b40e8-cd42-4060-8d22-cf0c9e0859f9}" mode="1" >0.70409799</value>
<value id="{e9d2c154-945a-4024-b053-8e4c510f5ba3}" mode="1" >0.91626638</value>
<value id="{72d91f82-8446-4985-8a6c-7617db96ad59}" mode="4" >0</value>
<value id="{beca3791-f6ef-4ca6-8b17-b074357951d5}" mode="4" >0</value>
</preset>
<preset name="Shock" number="2" >
<value id="{a4d4c497-04d4-4b7d-ad51-0f8832cb64bf}" mode="1" >0.09924940</value>
<value id="{b418386f-afe6-4d3c-b8d6-c6c96885e9ab}" mode="1" >0.99000067</value>
<value id="{f2ac6272-b33d-44fc-bb1e-fe52087e3a2b}" mode="1" >0.32000083</value>
<value id="{8052b29d-d6ae-4249-b9cd-1788a2faf77c}" mode="1" >0.06253843</value>
<value id="{3efde0c1-5828-4875-a997-174989989aa9}" mode="1" >0.97072107</value>
<value id="{fa34129e-d983-460c-bd0e-89fb3e798bcb}" mode="1" >1.00000000</value>
<value id="{17b249bd-27ed-44c7-9bac-a847a81165e3}" mode="1" >0.54646546</value>
<value id="{cba3fee2-d2a5-41b2-8842-34be212fa82a}" mode="1" >1.13128877</value>
<value id="{f0305ec9-814b-4107-a9b5-55a5a13f0118}" mode="1" >0.13656585</value>
<value id="{9f495b69-cdca-43c7-bc92-f26d9995caed}" mode="1" >0.34610736</value>
<value id="{3f29a847-8cf1-4076-9a69-e88b5360a810}" mode="1" >1.85934544</value>
<value id="{2ea377f7-6c31-4556-8e26-e47d9b6c000a}" mode="1" >2.00000000</value>
<value id="{a6a5a56d-13c6-4c09-b6e8-74086df6e352}" mode="1" >0.99779081</value>
<value id="{dde869a9-5d2a-454c-bff8-b8d407d19e87}" mode="1" >0.33333334</value>
<value id="{623cf6cd-548c-4212-ac65-a4761cfb5b7f}" mode="1" >0.00000100</value>
<value id="{833bd2f5-fae9-441b-82ad-9117ffd29877}" mode="1" >0.44000077</value>
<value id="{d520e71a-b3e2-46d4-b0c6-688085fe5742}" mode="1" >0.36350498</value>
<value id="{ced1a494-71e9-4bc0-9973-a872920a4473}" mode="1" >1.70886242</value>
<value id="{16c48afd-7c15-4e07-beee-ce56c7b61c80}" mode="1" >0.82670689</value>
<value id="{e1aa96cf-3e30-4ad2-93ec-1494a0d60079}" mode="1" >1.00000000</value>
<value id="{1a074887-a3a3-43ee-8de2-34b8e6a7a5a5}" mode="1" >0.00000100</value>
<value id="{e1352cbc-9c2a-4650-8957-fb055156903b}" mode="1" >1.00000048</value>
<value id="{3f7ea94f-e14d-4b53-8bbd-53563d0c23c1}" mode="1" >0.34000000</value>
<value id="{9c657ab3-a738-40e2-92ae-b1128863fd78}" mode="1" >0.60559916</value>
<value id="{56e321a8-c542-420c-a494-e759e36ea78a}" mode="1" >0.41786775</value>
<value id="{77ce606f-b1c5-4911-bf36-79ea1b8f50ef}" mode="1" >0.25000000</value>
<value id="{fec79e7f-6c43-482f-9fff-cedfc13eaea7}" mode="1" >0.69873726</value>
<value id="{964db287-6df1-4fa8-baba-1e387d1fac12}" mode="1" >0.00000100</value>
<value id="{7844fda3-a049-4ec6-885f-cba693b160c9}" mode="1" >0.69873726</value>
<value id="{37d2f1f5-7da1-460a-a8a0-9d70e19e7da0}" mode="1" >1.42871964</value>
<value id="{1713b2f6-0778-43b4-b81a-725331e94260}" mode="1" >0.52680331</value>
<value id="{608ebd5c-d7b3-4c9a-8075-2204844bc42c}" mode="1" >1.08000064</value>
<value id="{5f20cb6a-ad07-4210-aaa1-a0ee628ee2d4}" mode="1" >0.00000100</value>
<value id="{dc16cdf0-7371-4027-bac0-7d26d9d21433}" mode="1" >0.12058064</value>
<value id="{c211de7a-2f05-44f9-b09f-51523639dd8e}" mode="1" >1.48647273</value>
<value id="{da8941a6-25be-42bd-9fc4-eb3bf5e4e6e1}" mode="1" >2.00000000</value>
<value id="{8ade719c-f9d9-4348-91cc-a50077821391}" mode="1" >0.10895189</value>
<value id="{aaa01bed-d7bb-4690-a71e-1ae6f64afc5a}" mode="1" >1.00000000</value>
<value id="{21c7e2af-f1a0-41c0-be87-b103ea56c714}" mode="1" >0.00000100</value>
<value id="{32c4cf2e-a76a-46b1-89bf-a4e4d2924309}" mode="1" >0.91890037</value>
<value id="{b52b40e8-cd42-4060-8d22-cf0c9e0859f9}" mode="1" >0.31571576</value>
<value id="{e9d2c154-945a-4024-b053-8e4c510f5ba3}" mode="1" >0.06035645</value>
<value id="{72d91f82-8446-4985-8a6c-7617db96ad59}" mode="4" >0</value>
<value id="{beca3791-f6ef-4ca6-8b17-b074357951d5}" mode="4" >0</value>
<value id="{2edd913b-e4ed-497b-95a1-b45578fdcea6}" mode="1" >2.00000000</value>
<value id="{df2a583c-d11a-4e3f-8f22-c20c945ad4b9}" mode="1" >0.00000000</value>
<value id="{df2a583c-d11a-4e3f-8f22-c20c945ad4b9}" mode="4" >Shock</value>
</preset>
<preset name="Wobbly Bass" number="3" >
<value id="{a4d4c497-04d4-4b7d-ad51-0f8832cb64bf}" mode="1" >0.35183150</value>
<value id="{b418386f-afe6-4d3c-b8d6-c6c96885e9ab}" mode="1" >1.16110826</value>
<value id="{f2ac6272-b33d-44fc-bb1e-fe52087e3a2b}" mode="1" >0.05349947</value>
<value id="{8052b29d-d6ae-4249-b9cd-1788a2faf77c}" mode="1" >0.49104589</value>
<value id="{3efde0c1-5828-4875-a997-174989989aa9}" mode="1" >1.94538844</value>
<value id="{fa34129e-d983-460c-bd0e-89fb3e798bcb}" mode="1" >1.00000000</value>
<value id="{17b249bd-27ed-44c7-9bac-a847a81165e3}" mode="1" >0.58744889</value>
<value id="{cba3fee2-d2a5-41b2-8842-34be212fa82a}" mode="1" >0.88966805</value>
<value id="{f0305ec9-814b-4107-a9b5-55a5a13f0118}" mode="1" >0.22458993</value>
<value id="{9f495b69-cdca-43c7-bc92-f26d9995caed}" mode="1" >0.92106187</value>
<value id="{3f29a847-8cf1-4076-9a69-e88b5360a810}" mode="1" >1.16434824</value>
<value id="{2ea377f7-6c31-4556-8e26-e47d9b6c000a}" mode="1" >2.00000000</value>
<value id="{a6a5a56d-13c6-4c09-b6e8-74086df6e352}" mode="1" >0.84130728</value>
<value id="{dde869a9-5d2a-454c-bff8-b8d407d19e87}" mode="1" >2.00000000</value>
<value id="{623cf6cd-548c-4212-ac65-a4761cfb5b7f}" mode="1" >0.26269972</value>
<value id="{833bd2f5-fae9-441b-82ad-9117ffd29877}" mode="1" >0.40164155</value>
<value id="{d520e71a-b3e2-46d4-b0c6-688085fe5742}" mode="1" >0.02464281</value>
<value id="{ced1a494-71e9-4bc0-9973-a872920a4473}" mode="1" >0.82045412</value>
<value id="{16c48afd-7c15-4e07-beee-ce56c7b61c80}" mode="1" >0.65424937</value>
<value id="{e1aa96cf-3e30-4ad2-93ec-1494a0d60079}" mode="1" >4.00000000</value>
<value id="{1a074887-a3a3-43ee-8de2-34b8e6a7a5a5}" mode="1" >0.03000099</value>
<value id="{e1352cbc-9c2a-4650-8957-fb055156903b}" mode="1" >0.26000088</value>
<value id="{3f7ea94f-e14d-4b53-8bbd-53563d0c23c1}" mode="1" >0.52906078</value>
<value id="{9c657ab3-a738-40e2-92ae-b1128863fd78}" mode="1" >1.66721201</value>
<value id="{56e321a8-c542-420c-a494-e759e36ea78a}" mode="1" >0.47983685</value>
<value id="{77ce606f-b1c5-4911-bf36-79ea1b8f50ef}" mode="1" >0.50000000</value>
<value id="{fec79e7f-6c43-482f-9fff-cedfc13eaea7}" mode="1" >0.76768428</value>
<value id="{964db287-6df1-4fa8-baba-1e387d1fac12}" mode="1" >0.76768428</value>
<value id="{7844fda3-a049-4ec6-885f-cba693b160c9}" mode="1" >0.76768428</value>
<value id="{37d2f1f5-7da1-460a-a8a0-9d70e19e7da0}" mode="1" >1.12945914</value>
<value id="{1713b2f6-0778-43b4-b81a-725331e94260}" mode="1" >0.24956867</value>
<value id="{608ebd5c-d7b3-4c9a-8075-2204844bc42c}" mode="1" >1.23290610</value>
<value id="{5f20cb6a-ad07-4210-aaa1-a0ee628ee2d4}" mode="1" >0.48934624</value>
<value id="{dc16cdf0-7371-4027-bac0-7d26d9d21433}" mode="1" >0.55785310</value>
<value id="{c211de7a-2f05-44f9-b09f-51523639dd8e}" mode="1" >0.01865082</value>
<value id="{da8941a6-25be-42bd-9fc4-eb3bf5e4e6e1}" mode="1" >5.00000000</value>
<value id="{8ade719c-f9d9-4348-91cc-a50077821391}" mode="1" >0.34645078</value>
<value id="{aaa01bed-d7bb-4690-a71e-1ae6f64afc5a}" mode="1" >5.00000000</value>
<value id="{21c7e2af-f1a0-41c0-be87-b103ea56c714}" mode="1" >0.24000092</value>
<value id="{32c4cf2e-a76a-46b1-89bf-a4e4d2924309}" mode="1" >0.26000088</value>
<value id="{b52b40e8-cd42-4060-8d22-cf0c9e0859f9}" mode="1" >0.34000000</value>
<value id="{e9d2c154-945a-4024-b053-8e4c510f5ba3}" mode="1" >0.57990128</value>
<value id="{72d91f82-8446-4985-8a6c-7617db96ad59}" mode="4" >0</value>
<value id="{beca3791-f6ef-4ca6-8b17-b074357951d5}" mode="4" >0</value>
</preset>
<preset name="Outer Space" number="4" >
<value id="{a4d4c497-04d4-4b7d-ad51-0f8832cb64bf}" mode="1" >0.52880144</value>
<value id="{b418386f-afe6-4d3c-b8d6-c6c96885e9ab}" mode="1" >1.92315161</value>
<value id="{f2ac6272-b33d-44fc-bb1e-fe52087e3a2b}" mode="1" >0.40721342</value>
<value id="{8052b29d-d6ae-4249-b9cd-1788a2faf77c}" mode="1" >0.51781482</value>
<value id="{3efde0c1-5828-4875-a997-174989989aa9}" mode="1" >1.48892212</value>
<value id="{fa34129e-d983-460c-bd0e-89fb3e798bcb}" mode="1" >1.00000000</value>
<value id="{17b249bd-27ed-44c7-9bac-a847a81165e3}" mode="1" >0.09598406</value>
<value id="{cba3fee2-d2a5-41b2-8842-34be212fa82a}" mode="1" >1.14999413</value>
<value id="{f0305ec9-814b-4107-a9b5-55a5a13f0118}" mode="1" >0.78067654</value>
<value id="{9f495b69-cdca-43c7-bc92-f26d9995caed}" mode="1" >0.80435246</value>
<value id="{3f29a847-8cf1-4076-9a69-e88b5360a810}" mode="1" >1.88658834</value>
<value id="{2ea377f7-6c31-4556-8e26-e47d9b6c000a}" mode="1" >4.00000000</value>
<value id="{a6a5a56d-13c6-4c09-b6e8-74086df6e352}" mode="1" >0.52892101</value>
<value id="{dde869a9-5d2a-454c-bff8-b8d407d19e87}" mode="1" >5.00000000</value>
<value id="{623cf6cd-548c-4212-ac65-a4761cfb5b7f}" mode="1" >0.57236409</value>
<value id="{833bd2f5-fae9-441b-82ad-9117ffd29877}" mode="1" >0.02315990</value>
<value id="{d520e71a-b3e2-46d4-b0c6-688085fe5742}" mode="1" >0.83943599</value>
<value id="{ced1a494-71e9-4bc0-9973-a872920a4473}" mode="1" >0.25039724</value>
<value id="{16c48afd-7c15-4e07-beee-ce56c7b61c80}" mode="1" >0.33299038</value>
<value id="{e1aa96cf-3e30-4ad2-93ec-1494a0d60079}" mode="1" >0.50000000</value>
<value id="{1a074887-a3a3-43ee-8de2-34b8e6a7a5a5}" mode="1" >0.43360656</value>
<value id="{e1352cbc-9c2a-4650-8957-fb055156903b}" mode="1" >0.44469181</value>
<value id="{3f7ea94f-e14d-4b53-8bbd-53563d0c23c1}" mode="1" >0.40249717</value>
<value id="{9c657ab3-a738-40e2-92ae-b1128863fd78}" mode="1" >1.95878458</value>
<value id="{56e321a8-c542-420c-a494-e759e36ea78a}" mode="1" >0.23041101</value>
<value id="{77ce606f-b1c5-4911-bf36-79ea1b8f50ef}" mode="1" >5.00000000</value>
<value id="{fec79e7f-6c43-482f-9fff-cedfc13eaea7}" mode="1" >1.32098460</value>
<value id="{964db287-6df1-4fa8-baba-1e387d1fac12}" mode="1" >1.32098460</value>
<value id="{7844fda3-a049-4ec6-885f-cba693b160c9}" mode="1" >1.00000000</value>
<value id="{37d2f1f5-7da1-460a-a8a0-9d70e19e7da0}" mode="1" >1.64780557</value>
<value id="{1713b2f6-0778-43b4-b81a-725331e94260}" mode="1" >0.41363844</value>
<value id="{608ebd5c-d7b3-4c9a-8075-2204844bc42c}" mode="1" >0.26922104</value>
<value id="{5f20cb6a-ad07-4210-aaa1-a0ee628ee2d4}" mode="1" >0.72871375</value>
<value id="{dc16cdf0-7371-4027-bac0-7d26d9d21433}" mode="1" >0.76807946</value>
<value id="{c211de7a-2f05-44f9-b09f-51523639dd8e}" mode="1" >1.28383279</value>
<value id="{da8941a6-25be-42bd-9fc4-eb3bf5e4e6e1}" mode="1" >0.20000000</value>
<value id="{8ade719c-f9d9-4348-91cc-a50077821391}" mode="1" >0.36287013</value>
<value id="{aaa01bed-d7bb-4690-a71e-1ae6f64afc5a}" mode="1" >5.00000000</value>
<value id="{21c7e2af-f1a0-41c0-be87-b103ea56c714}" mode="1" >0.97215766</value>
<value id="{32c4cf2e-a76a-46b1-89bf-a4e4d2924309}" mode="1" >0.49834982</value>
<value id="{b52b40e8-cd42-4060-8d22-cf0c9e0859f9}" mode="1" >0.89931619</value>
<value id="{e9d2c154-945a-4024-b053-8e4c510f5ba3}" mode="1" >1.38783407</value>
<value id="{72d91f82-8446-4985-8a6c-7617db96ad59}" mode="4" >0</value>
<value id="{beca3791-f6ef-4ca6-8b17-b074357951d5}" mode="4" >0</value>
</preset>
<preset name="Gong" number="5" >
<value id="{a4d4c497-04d4-4b7d-ad51-0f8832cb64bf}" mode="1" >0.09924940</value>
<value id="{b418386f-afe6-4d3c-b8d6-c6c96885e9ab}" mode="1" >0.01480771</value>
<value id="{f2ac6272-b33d-44fc-bb1e-fe52087e3a2b}" mode="1" >0.05123077</value>
<value id="{8052b29d-d6ae-4249-b9cd-1788a2faf77c}" mode="1" >1.00000000</value>
<value id="{3efde0c1-5828-4875-a997-174989989aa9}" mode="1" >0.97072107</value>
<value id="{fa34129e-d983-460c-bd0e-89fb3e798bcb}" mode="1" >1.00000000</value>
<value id="{17b249bd-27ed-44c7-9bac-a847a81165e3}" mode="1" >0.54646546</value>
<value id="{cba3fee2-d2a5-41b2-8842-34be212fa82a}" mode="1" >1.13128877</value>
<value id="{f0305ec9-814b-4107-a9b5-55a5a13f0118}" mode="1" >0.13656585</value>
<value id="{9f495b69-cdca-43c7-bc92-f26d9995caed}" mode="1" >0.63000000</value>
<value id="{3f29a847-8cf1-4076-9a69-e88b5360a810}" mode="1" >1.85934544</value>
<value id="{2ea377f7-6c31-4556-8e26-e47d9b6c000a}" mode="1" >2.00000000</value>
<value id="{a6a5a56d-13c6-4c09-b6e8-74086df6e352}" mode="1" >0.99779081</value>
<value id="{dde869a9-5d2a-454c-bff8-b8d407d19e87}" mode="1" >0.33333334</value>
<value id="{623cf6cd-548c-4212-ac65-a4761cfb5b7f}" mode="1" >1.21385181</value>
<value id="{833bd2f5-fae9-441b-82ad-9117ffd29877}" mode="1" >0.31246525</value>
<value id="{d520e71a-b3e2-46d4-b0c6-688085fe5742}" mode="1" >1.00000000</value>
<value id="{ced1a494-71e9-4bc0-9973-a872920a4473}" mode="1" >1.70886242</value>
<value id="{16c48afd-7c15-4e07-beee-ce56c7b61c80}" mode="1" >0.82670689</value>
<value id="{e1aa96cf-3e30-4ad2-93ec-1494a0d60079}" mode="1" >0.20000000</value>
<value id="{1a074887-a3a3-43ee-8de2-34b8e6a7a5a5}" mode="1" >0.72617590</value>
<value id="{e1352cbc-9c2a-4650-8957-fb055156903b}" mode="1" >0.58649164</value>
<value id="{3f7ea94f-e14d-4b53-8bbd-53563d0c23c1}" mode="1" >0.93524820</value>
<value id="{9c657ab3-a738-40e2-92ae-b1128863fd78}" mode="1" >0.60559916</value>
<value id="{56e321a8-c542-420c-a494-e759e36ea78a}" mode="1" >0.41786775</value>
<value id="{77ce606f-b1c5-4911-bf36-79ea1b8f50ef}" mode="1" >0.25000000</value>
<value id="{fec79e7f-6c43-482f-9fff-cedfc13eaea7}" mode="1" >0.69873726</value>
<value id="{964db287-6df1-4fa8-baba-1e387d1fac12}" mode="1" >0.69873726</value>
<value id="{7844fda3-a049-4ec6-885f-cba693b160c9}" mode="1" >0.69873726</value>
<value id="{37d2f1f5-7da1-460a-a8a0-9d70e19e7da0}" mode="1" >1.42871964</value>
<value id="{1713b2f6-0778-43b4-b81a-725331e94260}" mode="1" >0.52680331</value>
<value id="{608ebd5c-d7b3-4c9a-8075-2204844bc42c}" mode="1" >1.72767055</value>
<value id="{5f20cb6a-ad07-4210-aaa1-a0ee628ee2d4}" mode="1" >0.54525268</value>
<value id="{dc16cdf0-7371-4027-bac0-7d26d9d21433}" mode="1" >0.92000002</value>
<value id="{c211de7a-2f05-44f9-b09f-51523639dd8e}" mode="1" >1.48647273</value>
<value id="{da8941a6-25be-42bd-9fc4-eb3bf5e4e6e1}" mode="1" >3.00000000</value>
<value id="{8ade719c-f9d9-4348-91cc-a50077821391}" mode="1" >0.10895189</value>
<value id="{aaa01bed-d7bb-4690-a71e-1ae6f64afc5a}" mode="1" >0.25000000</value>
<value id="{21c7e2af-f1a0-41c0-be87-b103ea56c714}" mode="1" >1.67256188</value>
<value id="{32c4cf2e-a76a-46b1-89bf-a4e4d2924309}" mode="1" >0.91890037</value>
<value id="{b52b40e8-cd42-4060-8d22-cf0c9e0859f9}" mode="1" >1.00000000</value>
<value id="{e9d2c154-945a-4024-b053-8e4c510f5ba3}" mode="1" >0.06035645</value>
<value id="{72d91f82-8446-4985-8a6c-7617db96ad59}" mode="4" >0</value>
<value id="{beca3791-f6ef-4ca6-8b17-b074357951d5}" mode="4" >0</value>
</preset>
<preset name="Alien" number="6" >
<value id="{a4d4c497-04d4-4b7d-ad51-0f8832cb64bf}" mode="1" >0.77549207</value>
<value id="{b418386f-afe6-4d3c-b8d6-c6c96885e9ab}" mode="1" >1.33936346</value>
<value id="{f2ac6272-b33d-44fc-bb1e-fe52087e3a2b}" mode="1" >0.36569735</value>
<value id="{8052b29d-d6ae-4249-b9cd-1788a2faf77c}" mode="1" >0.79167455</value>
<value id="{3efde0c1-5828-4875-a997-174989989aa9}" mode="1" >0.62001997</value>
<value id="{fa34129e-d983-460c-bd0e-89fb3e798bcb}" mode="1" >-1.40429783</value>
<value id="{17b249bd-27ed-44c7-9bac-a847a81165e3}" mode="1" >0.61443049</value>
<value id="{cba3fee2-d2a5-41b2-8842-34be212fa82a}" mode="1" >0.60574394</value>
<value id="{f0305ec9-814b-4107-a9b5-55a5a13f0118}" mode="1" >0.82539755</value>
<value id="{9f495b69-cdca-43c7-bc92-f26d9995caed}" mode="1" >0.36829379</value>
<value id="{3f29a847-8cf1-4076-9a69-e88b5360a810}" mode="1" >0.15290628</value>
<value id="{2ea377f7-6c31-4556-8e26-e47d9b6c000a}" mode="1" >0.76484829</value>
<value id="{a6a5a56d-13c6-4c09-b6e8-74086df6e352}" mode="1" >0.12198304</value>
<value id="{dde869a9-5d2a-454c-bff8-b8d407d19e87}" mode="1" >5.74750662</value>
<value id="{623cf6cd-548c-4212-ac65-a4761cfb5b7f}" mode="1" >0.43798280</value>
<value id="{833bd2f5-fae9-441b-82ad-9117ffd29877}" mode="1" >0.08567286</value>
<value id="{d520e71a-b3e2-46d4-b0c6-688085fe5742}" mode="1" >0.56523472</value>
<value id="{ced1a494-71e9-4bc0-9973-a872920a4473}" mode="1" >1.46649480</value>
<value id="{16c48afd-7c15-4e07-beee-ce56c7b61c80}" mode="1" >0.60636872</value>
<value id="{e1aa96cf-3e30-4ad2-93ec-1494a0d60079}" mode="1" >4.75232697</value>
<value id="{1a074887-a3a3-43ee-8de2-34b8e6a7a5a5}" mode="1" >1.34307921</value>
<value id="{e1352cbc-9c2a-4650-8957-fb055156903b}" mode="1" >0.95924777</value>
<value id="{3f7ea94f-e14d-4b53-8bbd-53563d0c23c1}" mode="1" >0.39933148</value>
<value id="{9c657ab3-a738-40e2-92ae-b1128863fd78}" mode="1" >1.27394211</value>
<value id="{56e321a8-c542-420c-a494-e759e36ea78a}" mode="1" >0.74402839</value>
<value id="{77ce606f-b1c5-4911-bf36-79ea1b8f50ef}" mode="1" >4.48528576</value>
<value id="{fec79e7f-6c43-482f-9fff-cedfc13eaea7}" mode="1" >0.37414643</value>
<value id="{964db287-6df1-4fa8-baba-1e387d1fac12}" mode="1" >0.37414643</value>
<value id="{7844fda3-a049-4ec6-885f-cba693b160c9}" mode="1" >0.37414643</value>
<value id="{37d2f1f5-7da1-460a-a8a0-9d70e19e7da0}" mode="1" >1.69390988</value>
<value id="{1713b2f6-0778-43b4-b81a-725331e94260}" mode="1" >0.57565117</value>
<value id="{608ebd5c-d7b3-4c9a-8075-2204844bc42c}" mode="1" >1.83773160</value>
<value id="{5f20cb6a-ad07-4210-aaa1-a0ee628ee2d4}" mode="1" >0.97878075</value>
<value id="{dc16cdf0-7371-4027-bac0-7d26d9d21433}" mode="1" >0.93248534</value>
<value id="{c211de7a-2f05-44f9-b09f-51523639dd8e}" mode="1" >0.09797703</value>
<value id="{da8941a6-25be-42bd-9fc4-eb3bf5e4e6e1}" mode="1" >4.98669291</value>
<value id="{8ade719c-f9d9-4348-91cc-a50077821391}" mode="1" >0.42223135</value>
<value id="{aaa01bed-d7bb-4690-a71e-1ae6f64afc5a}" mode="1" >5.98625231</value>
<value id="{21c7e2af-f1a0-41c0-be87-b103ea56c714}" mode="1" >0.66106582</value>
<value id="{32c4cf2e-a76a-46b1-89bf-a4e4d2924309}" mode="1" >0.37456763</value>
<value id="{b52b40e8-cd42-4060-8d22-cf0c9e0859f9}" mode="1" >0.32205558</value>
<value id="{e9d2c154-945a-4024-b053-8e4c510f5ba3}" mode="1" >1.07847786</value>
<value id="{72d91f82-8446-4985-8a6c-7617db96ad59}" mode="4" >0</value>
<value id="{beca3791-f6ef-4ca6-8b17-b074357951d5}" mode="4" >0</value>
</preset>
<preset name="Chimes" number="7" >
<value id="{a4d4c497-04d4-4b7d-ad51-0f8832cb64bf}" mode="1" >0.00821707</value>
<value id="{b418386f-afe6-4d3c-b8d6-c6c96885e9ab}" mode="1" >0.36902127</value>
<value id="{f2ac6272-b33d-44fc-bb1e-fe52087e3a2b}" mode="1" >0.66646159</value>
<value id="{8052b29d-d6ae-4249-b9cd-1788a2faf77c}" mode="1" >0.42549533</value>
<value id="{3efde0c1-5828-4875-a997-174989989aa9}" mode="1" >1.20048034</value>
<value id="{fa34129e-d983-460c-bd0e-89fb3e798bcb}" mode="1" >1.00000000</value>
<value id="{17b249bd-27ed-44c7-9bac-a847a81165e3}" mode="1" >0.03101001</value>
<value id="{cba3fee2-d2a5-41b2-8842-34be212fa82a}" mode="1" >1.11113417</value>
<value id="{f0305ec9-814b-4107-a9b5-55a5a13f0118}" mode="1" >0.62771147</value>
<value id="{9f495b69-cdca-43c7-bc92-f26d9995caed}" mode="1" >0.63929707</value>
<value id="{3f29a847-8cf1-4076-9a69-e88b5360a810}" mode="1" >0.29363316</value>
<value id="{2ea377f7-6c31-4556-8e26-e47d9b6c000a}" mode="1" >1.00000000</value>
<value id="{a6a5a56d-13c6-4c09-b6e8-74086df6e352}" mode="1" >0.28083172</value>
<value id="{dde869a9-5d2a-454c-bff8-b8d407d19e87}" mode="1" >1.00000000</value>
<value id="{623cf6cd-548c-4212-ac65-a4761cfb5b7f}" mode="1" >1.83537996</value>
<value id="{833bd2f5-fae9-441b-82ad-9117ffd29877}" mode="1" >0.07710903</value>
<value id="{d520e71a-b3e2-46d4-b0c6-688085fe5742}" mode="1" >0.28639463</value>
<value id="{ced1a494-71e9-4bc0-9973-a872920a4473}" mode="1" >1.08602405</value>
<value id="{16c48afd-7c15-4e07-beee-ce56c7b61c80}" mode="1" >0.16538025</value>
<value id="{e1aa96cf-3e30-4ad2-93ec-1494a0d60079}" mode="1" >1.00000000</value>
<value id="{1a074887-a3a3-43ee-8de2-34b8e6a7a5a5}" mode="1" >0.00000100</value>
<value id="{e1352cbc-9c2a-4650-8957-fb055156903b}" mode="1" >0.16000092</value>
<value id="{3f7ea94f-e14d-4b53-8bbd-53563d0c23c1}" mode="1" >0.29407570</value>
<value id="{9c657ab3-a738-40e2-92ae-b1128863fd78}" mode="1" >1.98959291</value>
<value id="{56e321a8-c542-420c-a494-e759e36ea78a}" mode="1" >0.10801291</value>
<value id="{77ce606f-b1c5-4911-bf36-79ea1b8f50ef}" mode="1" >0.33333334</value>
<value id="{fec79e7f-6c43-482f-9fff-cedfc13eaea7}" mode="1" >1.26772940</value>
<value id="{964db287-6df1-4fa8-baba-1e387d1fac12}" mode="1" >1.26772940</value>
<value id="{7844fda3-a049-4ec6-885f-cba693b160c9}" mode="1" >1.00000000</value>
<value id="{37d2f1f5-7da1-460a-a8a0-9d70e19e7da0}" mode="1" >1.07506883</value>
<value id="{1713b2f6-0778-43b4-b81a-725331e94260}" mode="1" >0.67707473</value>
<value id="{608ebd5c-d7b3-4c9a-8075-2204844bc42c}" mode="1" >1.73355865</value>
<value id="{5f20cb6a-ad07-4210-aaa1-a0ee628ee2d4}" mode="1" >0.76444215</value>
<value id="{dc16cdf0-7371-4027-bac0-7d26d9d21433}" mode="1" >0.35109249</value>
<value id="{c211de7a-2f05-44f9-b09f-51523639dd8e}" mode="1" >1.18131566</value>
<value id="{da8941a6-25be-42bd-9fc4-eb3bf5e4e6e1}" mode="1" >3.00000000</value>
<value id="{8ade719c-f9d9-4348-91cc-a50077821391}" mode="1" >0.22447671</value>
<value id="{aaa01bed-d7bb-4690-a71e-1ae6f64afc5a}" mode="1" >5.00000000</value>
<value id="{21c7e2af-f1a0-41c0-be87-b103ea56c714}" mode="1" >0.09000097</value>
<value id="{32c4cf2e-a76a-46b1-89bf-a4e4d2924309}" mode="1" >0.08000096</value>
<value id="{b52b40e8-cd42-4060-8d22-cf0c9e0859f9}" mode="1" >0.76972228</value>
<value id="{e9d2c154-945a-4024-b053-8e4c510f5ba3}" mode="1" >1.56563008</value>
<value id="{72d91f82-8446-4985-8a6c-7617db96ad59}" mode="4" >0</value>
<value id="{beca3791-f6ef-4ca6-8b17-b074357951d5}" mode="4" >0</value>
</preset>
<preset name="Fluty" number="8" >
<value id="{a4d4c497-04d4-4b7d-ad51-0f8832cb64bf}" mode="1" >0.98524410</value>
<value id="{b418386f-afe6-4d3c-b8d6-c6c96885e9ab}" mode="1" >1.64796364</value>
<value id="{f2ac6272-b33d-44fc-bb1e-fe52087e3a2b}" mode="1" >0.52427548</value>
<value id="{8052b29d-d6ae-4249-b9cd-1788a2faf77c}" mode="1" >0.38627648</value>
<value id="{3efde0c1-5828-4875-a997-174989989aa9}" mode="1" >0.00000100</value>
<value id="{fa34129e-d983-460c-bd0e-89fb3e798bcb}" mode="1" >1.00000000</value>
<value id="{17b249bd-27ed-44c7-9bac-a847a81165e3}" mode="1" >0.70595562</value>
<value id="{cba3fee2-d2a5-41b2-8842-34be212fa82a}" mode="1" >1.38320804</value>
<value id="{f0305ec9-814b-4107-a9b5-55a5a13f0118}" mode="1" >0.58946502</value>
<value id="{9f495b69-cdca-43c7-bc92-f26d9995caed}" mode="1" >0.71020597</value>
<value id="{3f29a847-8cf1-4076-9a69-e88b5360a810}" mode="1" >0.00000100</value>
<value id="{2ea377f7-6c31-4556-8e26-e47d9b6c000a}" mode="1" >2.00000000</value>
<value id="{a6a5a56d-13c6-4c09-b6e8-74086df6e352}" mode="1" >0.07000000</value>
<value id="{dde869a9-5d2a-454c-bff8-b8d407d19e87}" mode="1" >3.00000000</value>
<value id="{623cf6cd-548c-4212-ac65-a4761cfb5b7f}" mode="1" >0.70741987</value>
<value id="{833bd2f5-fae9-441b-82ad-9117ffd29877}" mode="1" >0.48335540</value>
<value id="{d520e71a-b3e2-46d4-b0c6-688085fe5742}" mode="1" >0.49383950</value>
<value id="{ced1a494-71e9-4bc0-9973-a872920a4473}" mode="1" >0.00000100</value>
<value id="{16c48afd-7c15-4e07-beee-ce56c7b61c80}" mode="1" >0.38029835</value>
<value id="{e1aa96cf-3e30-4ad2-93ec-1494a0d60079}" mode="1" >3.00000000</value>
<value id="{1a074887-a3a3-43ee-8de2-34b8e6a7a5a5}" mode="1" >0.33000088</value>
<value id="{e1352cbc-9c2a-4650-8957-fb055156903b}" mode="1" >0.34000084</value>
<value id="{3f7ea94f-e14d-4b53-8bbd-53563d0c23c1}" mode="1" >0.10513637</value>
<value id="{9c657ab3-a738-40e2-92ae-b1128863fd78}" mode="1" >0.04000099</value>
<value id="{56e321a8-c542-420c-a494-e759e36ea78a}" mode="1" >0.00000000</value>
<value id="{77ce606f-b1c5-4911-bf36-79ea1b8f50ef}" mode="1" >1.00000000</value>
<value id="{fec79e7f-6c43-482f-9fff-cedfc13eaea7}" mode="1" >0.09399924</value>
<value id="{964db287-6df1-4fa8-baba-1e387d1fac12}" mode="1" >0.09399924</value>
<value id="{7844fda3-a049-4ec6-885f-cba693b160c9}" mode="1" >0.09399924</value>
<value id="{37d2f1f5-7da1-460a-a8a0-9d70e19e7da0}" mode="1" >0.00000100</value>
<value id="{1713b2f6-0778-43b4-b81a-725331e94260}" mode="1" >0.16000000</value>
<value id="{608ebd5c-d7b3-4c9a-8075-2204844bc42c}" mode="1" >0.35776818</value>
<value id="{5f20cb6a-ad07-4210-aaa1-a0ee628ee2d4}" mode="1" >0.46415842</value>
<value id="{dc16cdf0-7371-4027-bac0-7d26d9d21433}" mode="1" >0.58610016</value>
<value id="{c211de7a-2f05-44f9-b09f-51523639dd8e}" mode="1" >0.00000100</value>
<value id="{da8941a6-25be-42bd-9fc4-eb3bf5e4e6e1}" mode="1" >4.00000000</value>
<value id="{8ade719c-f9d9-4348-91cc-a50077821391}" mode="1" >0.52810043</value>
<value id="{aaa01bed-d7bb-4690-a71e-1ae6f64afc5a}" mode="1" >1.00000000</value>
<value id="{21c7e2af-f1a0-41c0-be87-b103ea56c714}" mode="1" >0.10946730</value>
<value id="{32c4cf2e-a76a-46b1-89bf-a4e4d2924309}" mode="1" >0.14234683</value>
<value id="{b52b40e8-cd42-4060-8d22-cf0c9e0859f9}" mode="1" >0.04914349</value>
<value id="{e9d2c154-945a-4024-b053-8e4c510f5ba3}" mode="1" >0.00000100</value>
<value id="{72d91f82-8446-4985-8a6c-7617db96ad59}" mode="4" >0</value>
<value id="{beca3791-f6ef-4ca6-8b17-b074357951d5}" mode="4" >0</value>
</preset>
</bsbPresets>
<EventPanel name="" tempo="60.00000000" loop="8.00000000" x="381" y="517" width="655" height="346" visible="false" loopStart="0" loopEnd="0">i 1 0 1 440 100 </EventPanel>
