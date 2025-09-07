<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

;;channels
chn_k "ndx",3
chn_k "plot",3

gifn ftgen 0,0,4097,3,-1,1,0,1,0.5,3,-5,-1,0.5

instr 1
kndx chnget "ndx"
a1 oscili kndx, p5, -1, 0.25
a2 tablei a1*0.5, gifn, 1, 0.5
   out a2*p4 + a1*(kndx-1)
chnset gifn, "plot"
endin

giTrnsFnc ftgen 0, 0, 4097, -7, -0.5, 1024, -0.5, 2048, 0.5, 1024, 0.5
giSine    ftgen 0, 0, 1024, 10, 1

instr 2
aAmp      poscil    p4, p5, giSine
aIndx     =         (aAmp + 1) / 2
aWavShp   tablei    aIndx, giTrnsFnc, 1
          outs      aWavShp, aWavShp
endin

schedule 1, 0, -1, 0.2, 200

;schedule 2, 0, -1, 0.1, 440

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
 <bsbObject version="2" type="BSBTableDisplay">
  <objectName>plot</objectName>
  <x>5</x>
  <y>15</y>
  <width>540</width>
  <height>229</height>
  <uuid>{3e78e1fa-a8ab-4ab4-b579-11167c55cefc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <color>
   <r>255</r>
   <g>193</g>
   <b>3</b>
  </color>
  <range>0.00</range>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>ndx</objectName>
  <x>574</x>
  <y>30</y>
  <width>155</width>
  <height>143</height>
  <uuid>{25a7bcd2-a284-4cec-94d3-4b3038157ae8}</uuid>
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
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>6</x>
  <y>246</y>
  <width>544</width>
  <height>233</height>
  <uuid>{f9b2031d-1642-4572-86f3-69d76d049b78}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
  <triggermode>NoTrigger</triggermode>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
