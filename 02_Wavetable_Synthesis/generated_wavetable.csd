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

// GEN01 wavetables
gifn[ ] init 4
ihar[ ] init 40
// 1-sec piano
gifn[0] ftgen 0,0,44100,1,"pianoc2.wav",0,0,1
// 1-sec flute
gifn[1] ftgen 0,0,44100,1,"flutec3.wav",0,0,1
// 1-sec viola
gifn[2] ftgen 0,0,44100,1,"violac3.wav",0,0,1
// 1-sec xylophone
gifn[3] ftgen 0,0,44100,1,"xyloc3.wav",0,0,1


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

instr 2 // modulation
  kvt oscili p6/2,p7 // sine
  chnset kvt+0.5, "vert"  
  khz oscili p4/2,p5,-1,0.25 // cosine
  chnset khz+0.5, "horz"

endin

schedule(1, 0, 10000)
schedule(2,  5, 10, 0.4, 0.9, 0.4, 0.9) // circle
schedule(2, 20, 10, 0.4, .45, 0.4, 0.9) // lissajous figure
schedule(2, 35, 10, 0.4, .45, 0.4, 1.8)


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
  <value>0.90000000</value>
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
  <minimum>0.50000000</minimum>
  <maximum>2.00000000</maximum>
  <value>1.21250000</value>
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
  <xValue>0.30000011</xValue>
  <yValue>0.49938547</yValue>
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
  <randomizable mode="both" group="0">false</randomizable>
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
