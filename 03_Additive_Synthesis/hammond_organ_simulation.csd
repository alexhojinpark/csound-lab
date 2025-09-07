<CsoundSynthesizer>
<CsOptions>
-odac --midi-key=4
</CsOptions>
<CsInstruments>
0dbfs = 1

;;channels
chn_k "0",3
chn_k "1",3
chn_k "2",3
chn_k "3",3
chn_k "4",3
chn_k "5",3
chn_k "6",3
chn_k "7",3
chn_k "8",3

massign 1,2
gaw[] init 96   // tonewheel buffers
gifn0 ftgen 0,0,8192,10,1,0,1/3,0,1/5    // lowest octave wave

// tonewheel generator: 96 wheels
instr 1
 ifn = -1                                         // internal sine wave table
 aph phasor cpsmidinn(24+p4)    // MIDI note 24 is the lowest tonewheel frequency
 gaw[p4] tablei aph, gifn0, 1, 0, 1     // lowest octave uses a square wave
 gaw[p4+12] tablei aph*2, ifn, 1, 0, 1
 gaw[p4+24] tablei aph*4, ifn, 1, 0, 1 
 gaw[p4+36] tablei aph*8, ifn, 1, 0, 1
 gaw[p4+48] tablei aph*16, ifn, 1, 0, 1
 gaw[p4+60] tablei aph*32, ifn, 1, 0, 1
 gaw[p4+72] tablei aph*64, ifn, 1, 0, 1
 gaw[p4+84] tablei aph*128, ifn, 1, 0, 1
endin

idur = 315360000  // 100 years
ik = 0
while ik < 12 do     // one instance per semitone to generate 96 signals
  schedule(1, 0, idur,  ik)
  ik += 1
od

gabus[] init 9  // partial busses

// notes
instr 2
 ibas = p4 - 36                                                 // base tonewheel (8') 
 kw[] fillarray -12, 7, 0, 12, 19, 24, 28, 31, 36  // partial semitones

 if ibas >= 12 && ibas < 96 then                      // if within the range of tonewheels
  aenv linenr 1,0.005,0.005,0.01                      // envelope
  kk = 0
  while kk < 9 do
   kn = ibas+kw[kk]
   if kn < 96 then                                          // ignore foldbacks
    gabus[kk] = gabus[kk] + gaw[kn]*aenv   // mix tonewheel to bus with envelope
   endif
   kk += 1
  od
 endif 
endin

schedule(2,0,-1,60)

gkdb[] fillarray 1,1,0,0,0,0,0,0,0  // drawbars
gkvol  init        0.05                     // main volume

instr 4
  gkdb[0] chnget "0"
  gkdb[1] chnget "1"
  gkdb[2] chnget "2"
  gkdb[3] chnget "3"
  gkdb[4] chnget "4"
  gkdb[5] chnget "5"
  gkdb[6] chnget "6"
  gkdb[7] chnget "7"
  gkdb[8] chnget "8"
endin

schedule(4,0,-1)
// main mixer and output
instr 3
 kk = 0
 amix = 0
 while kk < 9 do
  amix += gabus[kk]*gkdb[kk]       // mix busses, scaled by drawbars
  gabus[kk] = 0                              // clear busses
  kk += 1
 od 
  out amix*gkvol                            // output
endin

schedule(3,0,idur)                         // only 1 instance is used

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>


<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>788</x>
 <y>182</y>
 <width>955</width>
 <height>446</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject type="BSBController" version="2">
  <objectName>hor0</objectName>
  <x>154</x>
  <y>80</y>
  <width>30</width>
  <height>80</height>
  <uuid>{059ddfcd-c43f-423f-ac0e-496a3eb2791c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>0</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.21250000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
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
 <bsbObject type="BSBController" version="2">
  <objectName>hor0</objectName>
  <x>189</x>
  <y>80</y>
  <width>30</width>
  <height>80</height>
  <uuid>{1067bc42-2aef-4c6c-9694-888ea6e1ef9b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>1</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.22500000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
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
 <bsbObject type="BSBController" version="2">
  <objectName>hor0</objectName>
  <x>225</x>
  <y>81</y>
  <width>30</width>
  <height>80</height>
  <uuid>{327a843a-f3b4-4044-ad07-51f45e655dfb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>2</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.23750000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
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
 <bsbObject type="BSBController" version="2">
  <objectName>hor0</objectName>
  <x>260</x>
  <y>81</y>
  <width>30</width>
  <height>80</height>
  <uuid>{08b1ff82-a829-4beb-8980-e5aef9bc2b25}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>3</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.27500000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
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
 <bsbObject type="BSBController" version="2">
  <objectName>hor0</objectName>
  <x>295</x>
  <y>81</y>
  <width>30</width>
  <height>80</height>
  <uuid>{ebf00514-6f7e-497c-91ae-5c9649e9f3f5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>4</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.13750000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
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
 <bsbObject type="BSBController" version="2">
  <objectName>hor0</objectName>
  <x>330</x>
  <y>81</y>
  <width>30</width>
  <height>80</height>
  <uuid>{715a13dd-8204-4e32-9dd3-776b1d17fe36}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>5</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
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
 <bsbObject type="BSBController" version="2">
  <objectName>hor0</objectName>
  <x>366</x>
  <y>82</y>
  <width>30</width>
  <height>80</height>
  <uuid>{1644457e-d752-4075-9198-6253143abc98}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>6</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
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
 <bsbObject type="BSBController" version="2">
  <objectName>hor0</objectName>
  <x>401</x>
  <y>82</y>
  <width>30</width>
  <height>80</height>
  <uuid>{53ab2c4c-5e03-4244-9eaf-d57b1764f06c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>7</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
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
 <bsbObject type="BSBController" version="2">
  <objectName>hor0</objectName>
  <x>436</x>
  <y>83</y>
  <width>30</width>
  <height>80</height>
  <uuid>{c0ee89a3-ce75-4c6f-b4df-6ea326035c64}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>8</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>1.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>156</x>
  <y>165</y>
  <width>137</width>
  <height>22</height>
  <uuid>{b4ab9ac2-3b0c-4f0c-80f3-13afc55b9a0d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>16'      5 1/3'      8'         4'</label>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>301</x>
  <y>165</y>
  <width>177</width>
  <height>22</height>
  <uuid>{c3cbfd6e-26ee-484f-9c4d-c0cad2d80e88}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>2 2/3'     2'     1 3/5'      1 1/3'     1'</label>
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
