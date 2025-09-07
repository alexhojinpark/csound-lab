<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

/**
	MU611 Week 4: Csound Advanced Programming Topics
	Alex Park 24252549
	
	Assignment:
	Using CsoundQT design a user interface to control
	- amplitude
	- pitch
	- speed
	
	You can also make other modifications to enhance the instrument
	using the ideas discussed in class.
**/

sr = 44100
ksmps = 64
nchnls = 1
0dbfs = 1

;;channels
chn_k "amplitude",3
chn_k "pitch",3
chn_k "speed",3

;ifn ftgen 1, 0, 8, -2, 1, 2, 3, 1, 4, 1, 5, 0.8
ifn ftgen 1, 0, 8, -2, 1, 1, 1, 1, 1, 1, 1, 1

instr 2
	k1 chnget "amplitude" ; 0 - 20
	k2 chnget "pitch" ; 0 - 100
	k3 chnget "speed" ; 0 - 1
	kSwitch = p4
	
	k1 = k1/20 ; normalize amp
	
	if (kSwitch == 1) then
		k1 = -k1 ; invert amp
	endif
	
	k4 phasor k3
	k5 table k4, 1, 1 ; fn table call
	
	a1 oscili k1, cpsmidinn(k5 + k2) ;frequency modulated by table and freq
	a2 linen a1, 0, p3, 0

	out a2
endin

;schedule(2, 0, 8, 0)
;schedule(2, 0, 8, 1)

schedule(2, 0, 4, 0)
schedule(2, 0, 4, 1)


; Not in use -----------------------------------------------------------------
;looping arpeggiator example from class
;ifn ftgen 1, 0, 8, -2, 0, 4, 7, 12, 7, 12, 7, 4 ; function table
;ifn ftgen 1, 0, 8, -2, 0, 3, 5, 8, 5, 8, 5, 3
;ifn ftgen  2, 0, 8, -2, 1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10
;instr 1
;	k1 chnget "amplitude"
;  	k2 chnget "pitch"
;   	k3 chnget "speed"
;    
;   	k4 phasor k3
;   	k5 table k4, 1, 1
;
;   	a1 oscili - k1, cpsmidinn(k5 + k2)  ; inverted amplitude!
;   	a2 linen a1, 0.1, p3, 0.1
;   	out a2
;endin

;ii = 0.05
;
;while (ii > 0) do
;	schedule(1, 0, 10, 0.1, 500, ii)
;	ii -= 100
;od

; Basic ifn ----------------------------------------------------------------
;
;ifn ftgen 1, 0, 4096, 10, 1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10
;ifn ftgen 2, 0, 4096, 10, 1, 0, 1/3, 0, 1/5, 0, 1/7, 0, 1/9, 0, 1/11
;
;instr 1
; a1 oscili p4, p5, p6 // oscili( xamp, xcps, ifn)
; a2 linen a1, 0.1, p3, 0.2
; out a2
;endin
;
;schedule(1, 0, 2, 0.5, 500, 1)
;schedule(1, 0, 2, 0.5, 500, 2)
;
; Arpreggiator example -----------------------------------------------------
;
;ifn ftgen 1, 0, 8, -2, 0, 4, 7, 12, 7, 12, 7, 4
;
;instr 1
; k1 line 0, p3, 8
; k2 table k1, 1
; a1 oscili p4, cpsmidinn(p5+k2)
; a2 linen a1, 0.1, p3, 0.1
; out a2
;endin
;
;schedule(2, 0, 4, 0.5, 60) 
;
; Looping Arpreggiator example ----------------------------------------------
;
;ifn ftgen 1, 0, 8, -2, 0, 4, 7, 12, 7, 12, 7, 4
;
;instr 1
; k1 phasor p6
; k2 table k1, 1, 1
; a1 oscili p4, cpsmidinn(p5+k2)
; a2 linen a1, 0.1, p3, 0.1
; out a2
;endin
;schedule(1, 0, 1, 0.5, 72, 0.9) 
;schedule(1, 1, 1, 0.5, 71, 1.4) 
;schedule(1, 2, 1, 0.5, 70, 2.3)

; Class slide code test -----------------------------------------------------
;ifn ftgen 1, 0, 4096, 10, 1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10
;instr 1
;	a1 oscili p4, p5, 1
;	a2 linen a1, 0.1, p3, 0.2
;	out a2
;endin
;schedule(1, 0,  2, 0.3, 120)

;ifn ftgen 1, 0, 8, -2, 0, 4, 7, 12, 7, 12, 7, 4 ; ftgen ifn, itime, isize, igen, iarray[]
;instr 1
;	;line - ia(starting value), ib(value after idur seconds), idur(time)
;	;line ia, idur, ib (trace a straight line between specified points.)
;	k1 line 0, p3, 8 ; play 8 notes in p3 sec
;
;	;table - access table values by direct indexing,
;	;table ifn(table number), ixmode(index normalized 0 to 1)
; 	k2 table k1, 1
; 	
; 	
;	a1 oscili p4, cpsmidinn(p5+k2)
;	a2 linen a1, 0.1, p3, 0.1
;	out a2
;endin
;schedule(1, 0, 4, 0.5, 60)

;instr 1
; inotes[] fillarray 0, 4, 7, 12, 7, 12, 7, 4 // arp intervals
; klin linseg 0, p3, 1, p3, 0 // line from 0 to 1 and back
; karp = inotes[klin*(lenarray(inotes)-1)] // arpeggio
; a1 oscili p4, cpsmidinn(p5+karp)
; a2 linen a1, 0.1, p3, 0.1
; out a2
;endin
;
;schedule(1, 0, 4, 0.25, 60)

;iscale[ ] fillarray 0, 2, 4, 5, 7, 9, 11, 12 // array filled with scale intervals
;ik = 0 // count
;while ik <= 8 do // loop for 8 notes (1 octave)
; schedule(1, ik, 1, 0.5, 60 + iscale[ik]) // schedule instr 1 for 1 second
; ik += 1 // increment count
;od

;instr 1
; k1 expon p4, p3, 0.001
; a1 oscili k1, cpsmidinn(p5)
; out a1
;endin
;// array filled with scale intervals
;iscale[ ] fillarray 0, 2, 4, 5, 7, 9, 11, 12
;ik = 0 // count
;// loop for 8 notes (1 octave)
;while ik < 8 do
;// schedule instr 1 for 0.5 second every 0.2 secs
; schedule(1, ik*0.2, 0.5, 0.5, 60 + iscale[ik])
; ik += 1 // increment count
;od

;gifn ftgen 0, 0, 4096, 10, 1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10
;instr 1
; a1 oscili p4, p5, gifn
; a2 linen a1, 0.1, p3, 0.2
; out a2
;endin

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
 <bsbObject version="2" type="BSBKnob">
  <objectName>amplitude</objectName>
  <x>10</x>
  <y>10</y>
  <width>80</width>
  <height>80</height>
  <uuid>{a094d233-b8e7-4bd9-879a-708a12217d56}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>20.00000000</maximum>
  <value>4.25000000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>255</r>
   <g>126</g>
   <b>121</b>
  </color>
  <textcolor>#212121</textcolor>
  <border>0</border>
  <borderColor>#212121</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>pitch</objectName>
  <x>110</x>
  <y>10</y>
  <width>80</width>
  <height>80</height>
  <uuid>{3a1c9c2e-8559-4ca7-b152-05e97329c79c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>100.00000000</maximum>
  <value>60.00000000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>115</r>
   <g>250</g>
   <b>121</b>
  </color>
  <textcolor>#212121</textcolor>
  <border>0</border>
  <borderColor>#212121</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBKnob">
  <objectName>speed</objectName>
  <x>210</x>
  <y>10</y>
  <width>80</width>
  <height>80</height>
  <uuid>{d7300c87-bad5-4864-94de-4f887968b7e3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="">continuous</mouseControl>
  <resolution>0.01000000</resolution>
  <randomizable group="0">false</randomizable>
  <color>
   <r>122</r>
   <g>129</g>
   <b>255</b>
  </color>
  <textcolor>#212121</textcolor>
  <border>0</border>
  <borderColor>#212121</borderColor>
  <showvalue>true</showvalue>
  <flatstyle>true</flatstyle>
  <integerMode>false</integerMode>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>10</x>
  <y>90</y>
  <width>80</width>
  <height>25</height>
  <uuid>{561393e4-5444-4abe-aee6-b9d3472cb27d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>AMPLITUDE</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>110</x>
  <y>90</y>
  <width>80</width>
  <height>25</height>
  <uuid>{26f2618d-960f-4379-87ca-0c108c36800d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>PITCH</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>251</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBLabel">
  <objectName/>
  <x>210</x>
  <y>90</y>
  <width>80</width>
  <height>25</height>
  <uuid>{0c646204-e47e-4066-b2b2-744a1d153c70}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>SPEED</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>251</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBScope">
  <objectName/>
  <x>10</x>
  <y>120</y>
  <width>280</width>
  <height>150</height>
  <uuid>{d1f6ad0d-b130-47df-85b0-3d91bf7b20d8}</uuid>
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
