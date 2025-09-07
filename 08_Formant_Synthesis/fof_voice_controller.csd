<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

0dbfs = 1

;;channels
chn_k "oct",3
chn_k "vowel",3
chn_k "pitch",3

gifn ftgen 10,0,1025,19,0.5,0.5,270,0.5


// e, a, i, o, u, e, a, i
gif1 ftgen 0,0,8,-2, 400, 650, 290, 400, 350, 400, 659, 290
gif2 ftgen 0,0,8,-2,1700,1080,1870, 800, 600,1700,1080,1870  
gif3 ftgen 0,0,8,-2,2600,2650,2800,2600,2700,2600,2650,2800
gif4 ftgen 0,0,8,-2,3200,2900,3250,2800,2900,3200,2900,3250
gif5 ftgen 0,0,8,-2,3580,3250,3100,3000,3300,3580,3250,3100

gib1 ftgen 0,0,8,-2, 70, 80, 40, 70, 40, 70, 80, 40
gib2 ftgen 0,0,8,-2, 80, 90, 90, 80, 60, 80, 90, 90 
gib3 ftgen 0,0,8,-2,100,120,100,100,100,100,120,100
gib4 ftgen 0,0,8,-2,120,130,120,130,120,120,130,120
gib5 ftgen 0,0,8,-2,120,140,120,135,120,120,140,120

gia2 ftgen 0,0,8,-2,-14, -6,-15,-10,-20,-14, -6,-15
gia3 ftgen 0,0,8,-2,-12, -7,-18,-12,-17,-12, -7,-18
gia4 ftgen 0,0,8,-2,-14, -8,-20,-12,-14,-14, -8,-20
gia5 ftgen 0,0,8,-2,-20,-22,-30,-26,-26,-20,-22,-30


instr 1
 kn chnget "vowel"
 kp chnget "pitch" 

 kf1 tablei kn, gif1, 1, 0, 1 
 kf2 tablei kn, gif2, 1, 0, 1 
 kf3 tablei kn, gif3, 1, 0, 1 
 kf4 tablei kn, gif4, 1, 0, 1 
 kf5 tablei kn, gif5, 1, 0, 1 
 
 kb1 tablei kn, gib1, 1, 0, 1 
 kb2 tablei kn, gib2, 1, 0, 1 
 kb3 tablei kn, gib3, 1, 0, 1 
 kb4 tablei kn, gib4, 1, 0, 1 
 kb5 tablei kn, gib5, 1, 0, 1 
 
 ka2 = ampdb(tablei(kn, gia2, 1, 0, 1))
 ka3 = ampdb(tablei(kn, gia3, 1, 0, 1))
 ka4 = ampdb(tablei(kn, gia4, 1, 0, 1))
 ka5 = ampdb(tablei(kn, gia5, 1, 0, 1))
 
 iamp = p4
 ifo = p5+birnd(1)
 koct chnget "oct"
 koct *= 5
 kdur = 0.02
 kris = 0.002
 kdec = 0.007
 iol = 0.02*ifo*2 + 2
 
 // fundamental freq + vibr + jitter
 ivibra = 0.01+birnd(0.005)
 avibr oscili ifo*ivibra, 4+birnd(0.2)
 ajit  randi  ifo*0.005, 1.2+birnd(.1), 2
 // pitch control is exponential
 afo = (ifo + ajit + avibr)*2^(kp)
 
 a1 fof   1, afo, kf1, koct, kb1, kris, kdur, kdec, iol, -1, gifn, p3 
 a2 fof ka2, afo, kf2, koct, kb2, kris, kdur, kdec, iol, -1, gifn, p3 
 a3 fof ka3, afo, kf3, koct, kb3, kris, kdur, kdec, iol, -1, gifn, p3 
 a4 fof ka4, afo, kf4, koct, kb4, kris, kdur, kdec, iol, -1, gifn, p3 
 a5 fof ka5, afo, kf5, koct, kb5, kris, kdur, kdec, iol, -1, gifn, p3 
 
 amix = (a1 + a2 + a3 + a4 + a5)*0.2
 asig linen amix, 0.005, p3, 0.1
       out asig*iamp
endin

</CsInstruments>
<CsScore>
i1 0 z 0.25 120 
i1 0 z 0.25 120
i1 0 z 0.25 120 
i1 0 z 0.25 120
</CsScore>
</CsoundSynthesizer>


<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>0</width>
 <height>0</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBController">
  <objectName>pitch</objectName>
  <x>59</x>
  <y>29</y>
  <width>533</width>
  <height>358</height>
  <uuid>{1376bded-57a9-49ee-aaa5-3d636d85045a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>vowel</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.51219512</xValue>
  <yValue>0.47206704</yValue>
  <type>crosshair</type>
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
 <bsbObject version="2" type="BSBKnob">
  <objectName>oct</objectName>
  <x>606</x>
  <y>27</y>
  <width>175</width>
  <height>170</height>
  <uuid>{0e149d78-5f33-41dc-a387-180f5ea3308a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
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
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>652</x>
  <y>201</y>
  <width>114</width>
  <height>34</height>
  <uuid>{53f082a2-bd32-4f43-a62d-0cf1afef5ce9}</uuid>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
