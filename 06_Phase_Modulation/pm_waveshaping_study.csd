<CsoundSynthesizer>
<CsOptions>
-odac --midi-key-cps=5 --midi-velocity-amp=4
</CsOptions>
<CsInstruments>
0dbfs = 1
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

;;channels
chn_k "index",3
chn_k "fm",3

giTrnsFnc ftgen 0, 0, 4097, -7, -0.5, 1024, -0.5, 2048, 0.5, 1024, 0.5
giSine    ftgen 0, 0, 1024, 10, 1

;instr 2
;	
;	aAmp      poscil    p4, p5, giSine
;	aIndx     =         (aAmp + 1) / 2
;	aWavShp   tablei    aIndx, giTrnsFnc, 1
;	outs      aWavShp, aWavShp
;	
;endin

ifn ftgen 1, 0, 8, -2, 0, 4, 7, 12, 7, 12, 7, 4

instr 1

	kfm  chnget "fm"
	kmax chnget "index"
	
	iatt = 0.1
	
	iamp = p4
	ifr  = p5

	andx	linenr		kmax*0.5, 0.04, 			0.1, 	0.01
	adr		oscili		andx,		ifr*(kfm+1),	-1,		0.25    
	aws		tablei		adr, 		giTrnsFnc, 	1, 		0.5
	amod	oscili		iamp, 		ifr,			-1, 	0.25 
	arm     = amod*aws ;  ring modulation

	amix = amod*(1-andx) + arm
	
	out linenr(amix*0.1,0.01,0.1,0.01)

endin

;schedule(1, 0, -1, 0.5, 440)

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
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>10</x>
  <y>10</y>
  <width>480</width>
  <height>160</height>
  <uuid>{f9b2031d-1642-4572-86f3-69d76d049b78}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>3.00000000</zoomx>
  <zoomy>3.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
  <triggermode>NoTrigger</triggermode>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>fm</objectName>
  <x>10</x>
  <y>175</y>
  <width>480</width>
  <height>230</height>
  <uuid>{22ad9fdb-4025-40f9-ab0b-7355248ee7bf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>index</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.92083333</xValue>
  <yValue>0.88695652</yValue>
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
  <objectName>knob2</objectName>
  <x>548</x>
  <y>216</y>
  <width>80</width>
  <height>80</height>
  <uuid>{6fcb5b90-b25e-43cf-a226-aa58c240c7bb}</uuid>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
