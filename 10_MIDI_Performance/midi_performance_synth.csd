<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
/**

Create a performance instrument using MIDI controls and CsoundQT using the wavetable csd example (wavetable.csd) from moodle (Class Examples IV). You can target the M-Audio oxygen 25 as your MIDI controller. 

**/
sr = 44100
ksmps = 64
nchnls = 1
0dbfs = 1

;;channels -------------------------------------------
chn_k "vertical_ctr",3		; controller - vertical
chn_k "horizontal_ctr",3	; controller - horitontal

chn_k "vibrato",3			; knob - vibrato
chn_k "reverb",3				; knob - reverb
chn_k "amp",3					; knob - ampituded
chn_k "freq",3				; knob - frequency

;; table set up ---------------------------------------
gifn[ ] init 4
ihar[ ] init 40
ii = 0

while ii < 4 do 
	ik = 1
	
	while ik < 40 do
		irnd = abs(rnd31(1,0,0)) 
   		ihar[ik-1] = irnd < 0.8 ? 0 : irnd/ik
   		ik += 1
	od
	
	gifn[ii] ftgen 0,0,8192,10,ihar
	ii += 1
od

;; instr init ------------------------------------------
instr 1
	asig[] init 4
	
	; amplitude
	iamp ampmidi 0dbfs * 0.2
	chnset iamp, "amp"
	
	; frequency
	kfreq cpsmidib 2
 	chnset kfreq, "freq"
 	
 	; vibrato
 	kmod midic7 1, 0, 0.1 
 	chnset kmod, "vibrato"
 	avibr oscili kmod * kfreq, 7
 	
 	; horizontal - C1  
 	kh midic7 71, 0, 1.0 
 	chnset kh, "horzontal_ctr"

	; vertical - C2
	kv midic7 72, 0, 1.0
 	chnset kv, "vertertical_ctr"
 	
 	; reverb
 	kreverb midic7 2, 0, 1.0  ; Assuming MIDI controller 74 is used for reverb level
 	chnset kreverb, "reverb"  ; Use "reverb" channel for reverb level

 	; signal from wavetable oscili
 	aph phasor kfreq + avibr
 	
 	asig[0] tablei aph, gifn[0], 1
	asig[1] tablei aph, gifn[1], 1
 	asig[2] tablei aph, gifn[2], 1
 	asig[3] tablei aph, gifn[3], 1
 	amix = (asig[0]*(1-kh) + asig[1]*kh)*(1-kv) + (asig[2]*(1-kh) + asig[3]*kh)*kv

 	aenv linenr amix * iamp, 0, 0, 0
 	
 	; Mono Reverb Effect
  	aRev reverb aenv, 1.5  ; Single-channel reverb
   	aWet = aRev * kreverb  ; Control reverb level with kreverb from "reverb" channel
   	aOut = (1 - kreverb) * aenv + aWet  ; Blend dry/wet signal based on kreverb
   	
   	out aOut 	
endin

;; New Instrument 2 (Sample Playback)
instr 2
	; Set up sample file
	iSampleFile init "choirsample.wav"  ; Set the path to your sample file (use the correct path)

	; MIDI note input
 	kfreq cpsmidib p4           ; Get frequency from MIDI note (p4 is the note)
  	chnset kfreq, "freq"

  	; Control amplitude using MIDI velocity (ampmidi)
  	iamp ampmidi 0dbfs * 0.2    ; Set amplitude using MIDI velocity
  	chnset iamp, "amp"

  	; Load the sample
  	aSample diskin2 iSampleFile, 1, kfreq, 0  ; Sample playback (1 is for mono playback)

  	; Apply envelope for smooth fade in/out based on note duration
  	aenv linenr aSample, 0, 0.01, p3  ; Envelope with small attack and release
    
  	; Apply reverb
  	aRev reverb aenv, 1.5  ; Mono reverb effect
  	aWet = aRev * kreverb  ; Control reverb with MIDI controller
  	aOut = (1 - kreverb) * aenv + aWet  ; Blend dry and wet signals
    
  	out aOut  ; Output the final signal
endin

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
  <r>235</r>
  <g>235</g>
  <b>235</b>
 </bgcolor>
 <bsbObject version="2" type="BSBController">
  <objectName>horizontal_ctr</objectName>
  <x>10</x>
  <y>10</y>
  <width>400</width>
  <height>200</height>
  <uuid>{0aa887d6-08bc-4f73-9331-ba3809c7a058}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>vertical_ctr</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.02000000</xValue>
  <yValue>0.24500000</yValue>
  <type>point</type>
  <pointsize>20</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>235</r>
   <g>235</g>
   <b>235</b>
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
  <objectName>amp</objectName>
  <x>10</x>
  <y>220</y>
  <width>80</width>
  <height>80</height>
  <uuid>{692897bc-0efc-4033-9c10-eb6dd746079e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.10000000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>145</r>
   <g>145</g>
   <b>145</b>
  </color>
  <textcolor>#212121</textcolor>
  <border>0</border>
  <borderColor>#929292</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>freq</objectName>
  <x>115</x>
  <y>220</y>
  <width>80</width>
  <height>80</height>
  <uuid>{81937c4b-1ea9-4d5e-b6e5-dfc0e6e2e1ea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>55.00000000</minimum>
  <maximum>750.00000000</maximum>
  <value>164.80448183</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>146</r>
   <g>146</g>
   <b>146</b>
  </color>
  <textcolor>#212121</textcolor>
  <border>0</border>
  <borderColor>#929292</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>vibrato</objectName>
  <x>225</x>
  <y>220</y>
  <width>80</width>
  <height>80</height>
  <uuid>{5130b339-6d44-44b4-9508-b5529f8e2e4c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>0.10000000</maximum>
  <value>0.07637795</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>146</r>
   <g>146</g>
   <b>146</b>
  </color>
  <textcolor>#212121</textcolor>
  <border>0</border>
  <borderColor>#929292</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>reverb</objectName>
  <x>330</x>
  <y>220</y>
  <width>80</width>
  <height>80</height>
  <uuid>{88a6194a-65d2-4955-ba57-ed05a57335e6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.66929134</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>146</r>
   <g>146</g>
   <b>146</b>
  </color>
  <textcolor>#212121</textcolor>
  <border>0</border>
  <borderColor>#ff9300</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>10</x>
  <y>300</y>
  <width>80</width>
  <height>25</height>
  <uuid>{d0127ec6-71f6-4b0b-9e93-883482552aa1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>amplitude</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>0</precision>
  <color>
   <r>214</r>
   <g>214</g>
   <b>214</b>
  </color>
  <bgcolor mode="background">
   <r>33</r>
   <g>33</g>
   <b>33</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>115</x>
  <y>300</y>
  <width>80</width>
  <height>25</height>
  <uuid>{0731b033-af16-4cb0-a9fb-ec0ce2d8960f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>frequency</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>0</precision>
  <color>
   <r>214</r>
   <g>214</g>
   <b>214</b>
  </color>
  <bgcolor mode="background">
   <r>33</r>
   <g>33</g>
   <b>33</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>225</x>
  <y>300</y>
  <width>80</width>
  <height>25</height>
  <uuid>{621af905-3afe-4be4-bf32-accd3955c629}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>vibrato</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>0</precision>
  <color>
   <r>214</r>
   <g>214</g>
   <b>214</b>
  </color>
  <bgcolor mode="background">
   <r>33</r>
   <g>33</g>
   <b>33</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>330</x>
  <y>300</y>
  <width>80</width>
  <height>25</height>
  <uuid>{a9001d58-517e-48bb-8112-68136c092680}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>reverb</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
  <precision>0</precision>
  <color>
   <r>214</r>
   <g>214</g>
   <b>214</b>
  </color>
  <bgcolor mode="background">
   <r>33</r>
   <g>33</g>
   <b>33</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
