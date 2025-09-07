<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

;;channels
chn_k "vert",3
chn_k "horz",3
chn_k "freq",3
chn_k "amp",3

// classic wavetables
gifn[ ] init 4
ihar[ ] init 40
// saw
gifn[0] ftgen 0,0,16384,10,1,1/2,1/3,1/4,1/5,1/6,1/7,1/8,1/9,1/10
// square
gifn[1] ftgen 0,0,16384,10,1,0,1/3,0,1/5,0,1/7,0,1/9
// tri
gifn[2] ftgen 0,0,16384,10,1,0,1/9,0,1/25,0,1/49,0,1/81
// pulse
gifn[3] ftgen 0,0,16384,10,1,1,1,1,1,1,1,1,1,1


instr 1   
  asig[] init 4 
  kamp chnget "amp"     // controls from host
  kfreq chnget "freq"
  kh chnget "horz"
  kv chnget "vert"

  aph phasor kfreq
  asig[0] tablei aph, gifn[0], 1
  asig[1] tablei aph, gifn[1], 1
  asig[2] tablei aph, gifn[2], 1
  asig[3] tablei aph, gifn[3], 1
  amix = (asig[0]*(1-kh) + asig[1]*kh)*(1-kv) +  (asig[2]*(1-kh) + asig[3]*kh)*kv

  aenv linen  amix, 0.1,  p3,  0.1   
  out aenv*kamp
endin

schedule(1, 0, 10000)
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
  <r>235</r>
  <g>235</g>
  <b>235</b>
 </bgcolor>
 <bsbObject version="2" type="BSBKnob">
  <objectName>amp</objectName>
  <x>47</x>
  <y>21</y>
  <width>80</width>
  <height>80</height>
  <uuid>{8f868e2e-225c-4369-b240-9c6e890c226b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.28750000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>freq</objectName>
  <x>141</x>
  <y>23</y>
  <width>80</width>
  <height>80</height>
  <uuid>{ccbc15c4-3711-4550-b69e-d488e0f99e64}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>55.00000000</minimum>
  <maximum>220.00000000</maximum>
  <value>123.06250000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>245</r>
   <g>124</g>
   <b>0</b>
  </color>
  <textcolor>#512900</textcolor>
  <border>0</border>
  <borderColor>#512900</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>horz</objectName>
  <x>251</x>
  <y>29</y>
  <width>353</width>
  <height>233</height>
  <uuid>{1ecb3530-5745-4261-8e67-43f0e0e7d05f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>vert</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.35977337</xValue>
  <yValue>0.63090129</yValue>
  <type>point</type>
  <pointsize>30</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
