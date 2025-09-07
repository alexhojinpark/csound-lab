<CsoundSynthesizer>
<CsOptions>
-odac -M0
</CsOptions>
<CsInstruments>
0dbfs = 1
nchnls = 2

// for midi, not in use.
;instr 2
;  kfr cpsmidib 2          // cps from midi
;  kcf_max = 8*kfr	// MAX CF 8 times the fundamental
;  kcf_min = 2*kfr	// MIN CF 2 times the fundamental
;  kspac =  kfr*0.5	// spacing between filters 
;  ires = 0.8			// amount of resonance
;  kenv1	madsr 0.01, 0.15, 0.3, 0.3 //   kenv1	madsr 0.1, 0.01, 0.8, 0.1
;  kamp 	= kenv1*ampmidi(0dbfs*0.2)     // amp from midi
;  kenv2  	madsr 0.01, 0.05, 0.2, 0.05 // kenv2  	madsr 0.1,0.1, 0.7, 0.1
;  kcf 	= kenv2*(kcf_max - kcf_min) + kcf_min
;  a1 	vco2  kamp, kfr, 12
;
; a21 	moogvcf   a1, kcf-kspac, ires
; a22 	moogvcf   a1, kcf+kspac, ires   
;       	outs          a21,a22
;endin

instr 1
  	kfr = p4         		// Frequency directly from p4 (no MIDI conversion)
  	kcf_max = 8 * kfr		// Max cutoff frequency (8 times the fundamental)
  	kcf_min = 2 * kfr		// Min cutoff frequency (2 times the fundamental)
  	kspac =  kfr * 0.5	// Spacing between filters
  	ires = 0.8				// Resonance amount

  	// ADSR envelope for amplitude control
  	kenv1 madsr 0.01, 0.15, 0.3, 0.3  
  	kamp = kenv1 * p5 * 0dbfs

  	// ADSR
  	kenv2 madsr 0.01, 0.05, 0.2, 0.05 
  	kcf = kenv2 * (kcf_max - kcf_min) + kcf_min // filter cutoff frequency

 	a1 vco2 kamp, kfr, 12
  
  	a21 moogvcf a1, kcf - kspac, ires
  	a22 moogvcf a1, kcf + kspac, ires
  
  	outs a21, a22
endin
	
instr 2
	anoise rand expseg(1,p3,0.001)
	afilt  reson anoise, p5, p6, 1.5
	outs afilt*p4, afilt*p4  
	
	schedule(2,p3,p3,p4,p5,p6)
endin

instr 3
	anoise rand expseg(1,p3,0.001)
	afilt  reson anoise, p5, p6, 1.5
	outs afilt*p4, afilt*p4  
endin

// copy of instr 2 but value changed a bit
instr 4
 	anoise rand expseg(1,p3,0.002)
 	afilt  reson anoise, p5, p6, 1
   	outs afilt*p4, afilt*p4  
    
   	schedule(2,p3,p3,p4,p5,p6)
endin


// ---------------------- schedule --------------------------------

// instr 1 - main synth -------------------------------------------

// C 261.63 D 293.66 E 329.63 F 349.23 G 392
// pattern a
schedule(1, 0, 0.15, 261.63*2, 0.5)
schedule(1, 0.45, 0.15,	329.63*2, 0.5)
schedule(1, 0.9, 0.15,	293.66*2, 0.5)
schedule(1, 1.125, 0.15, 329.63*2, 0.5)
schedule(1, 1.225, 0.15, 293.66*2, 0.5)
schedule(1, 1.325, 0.15, 261.63*2, 0.5)

// pattern a
schedule(1, 1.775, 0.15, 261.63*2, 0.5)
schedule(1, 2.225, 0.15, 329.63*2, 0.5)
schedule(1, 2.675, 0.15, 293.66*2, 0.5)
schedule(1, 2.9, 0.15, 329.63*2, 0.5)
schedule(1, 3.0,	0.15, 293.66*2, 0.5)
schedule(1, 3.1,	0.15, 261.63*2, 0.5)

// pattern a
schedule(1, 3.55, 0.15, 261.63*2, 0.5)
schedule(1, 4.00, 0.15, 329.63*2, 0.5)
schedule(1, 4.45, 0.15, 293.66*2, 0.5)
schedule(1, 4.675, 0.15, 329.63*2, 0.5)
schedule(1, 4.775, 0.15, 293.66*2, 0.5)
schedule(1, 4.875, 0.15, 261.63*2, 0.5)

// pattern b
schedule(1, 5.325, 0.15, 329.63*2, 0.5) // e
schedule(1, 5.55, 0.15, 349.23*2, 0.5) // f
schedule(1, 5.775, 0.15, 392*2, 0.5) // g
schedule(1, 6, 0.15, 261.63*2, 0.5) // c
schedule(1, 6.225, 0.15, 293.66*2, 0.5) // d
schedule(1, 6.675, 0.15, 261.63*2, 0.5) // c

// a
schedule(1, 7.125, 0.15, 261.63*2, 0.5)
schedule(1, 7.575, 0.15, 329.63*2, 0.5)
schedule(1, 8.025, 0.15, 293.66*2, 0.5)
schedule(1, 8.25, 0.15, 329.63*2, 0.5)
schedule(1, 8.35, 0.15, 293.66*2, 0.5)
schedule(1, 8.45, 0.15, 261.63*2, 0.5)

// a
schedule(1, 8.925, 0.15, 261.63*2, 0.5)
schedule(1, 9.375, 0.15, 329.63*2, 0.5)
schedule(1, 9.825, 0.15, 293.66*2, 0.5)
schedule(1, 10.05, 0.15, 329.63*2, 0.5)
schedule(1, 10.15, 0.15, 293.66*2, 0.5)
schedule(1, 10.25, 0.15, 261.63*2, 0.5)

// a
schedule(1, 10.7, 0.15, 261.63*2, 0.5)
schedule(1, 11.15, 0.15, 329.63*2, 0.5)
schedule(1, 11.6, 0.15, 293.66*2, 0.5)
schedule(1, 11.825, 0.15, 329.63*2, 0.5)
schedule(1, 11.925, 0.15, 293.66*2, 0.5)
schedule(1, 12.025, 0.15, 261.63*2, 0.5)

// b
schedule(1, 12.475, 0.15, 329.63*2, 0.5) // e
schedule(1, 12.7, 0.15, 349.23*2, 0.5) // f
schedule(1, 12.925, 0.15, 392*2, 0.5) // g
schedule(1, 13.15, 0.15, 261.63*2, 0.5) // c
schedule(1, 13.375, 0.15, 293.66*2, 0.5) // d
schedule(1, 13.825, 0.15, 261.63*2, 0.5) // c

// instr 1 - 2nd synth ------------------------------------------------
// C
schedule(1, 0, 1, 261.63, 0.5)
schedule(1, 0, 1, 329.63, 0.5)
schedule(1, 0, 1, 392, 0.5)


// G
schedule(1, 1.775, 1, 392/2, 0.5)
schedule(1, 1.775, 1, 493.88/2, 0.5)
schedule(1, 1.775, 1, 293.66, 0.5)


// A
schedule(1, 3.55, 1, 440, 0.5)
schedule(1, 3.55, 1, 261.63, 0.5)
schedule(1, 3.55, 1, 329.63, 0.5)

// F
schedule(1, 5.325, 1, 349.23, 0.5)
schedule(1, 5.325, 1, 440, 0.5)
schedule(1, 5.325, 1, 261.63, 0.5)

// - repeat with more notes
// C
schedule(1, 7.125, 1, 261.63, 0.5)
schedule(1, 7.125, 1, 329.63, 0.5)
schedule(1, 7.125, 1, 392, 0.5)

schedule(1, 7.125, 1, 261.63/2, 0.5)
schedule(1, 7.125, 1, 329.63/2, 0.5)
schedule(1, 7.125, 1, 392/2, 0.5)

// G
schedule(1, 8.925, 1, 392/2, 0.5)
schedule(1, 8.925, 1, 493.88/2, 0.5)
schedule(1, 8.925, 1, 293.66, 0.5)

schedule(1, 8.925, 1, 392/4, 0.5)
schedule(1, 8.925, 1, 493.88/4, 0.5)
schedule(1, 8.925, 1, 293.66/2, 0.5)

// A
schedule(1, 10.7, 1, 440, 0.5)
schedule(1, 10.7, 1, 261.63, 0.5)
schedule(1, 10.7, 1, 329.63, 0.5)

schedule(1, 10.7, 1, 440/2, 0.5)
schedule(1, 10.7, 1, 261.63/2, 0.5)
schedule(1, 10.7, 1, 329.63/2, 0.5)

// F
schedule(1, 12.475, 1, 349.23, 0.5)
schedule(1, 12.475, 1, 440, 0.5)
schedule(1, 12.475, 1, 261.63, 0.5)

schedule(1, 12.475, 1, 349.23/2, 0.5)
schedule(1, 12.475, 1, 440/2, 0.5)
schedule(1, 12.475, 1, 261.63/2, 0.5)

// instr 2,4 - drum loop ------------------------------------------------
schedule(4,   0, 	0.2225*16,  10,         80, 20) // reverb kick
schedule(4,   1.35, 0.2225*8,  5,         1000, 20) // reverb bell
schedule(2, 0.9,  0.2225*8, 0.5,   261.63*7, 1000) // reverb clap
schedule(2,   0,  0.2224/2, 0.9, 261.63*100, 600) // dry hihat 16 bit

// instr 3 - adding acent with 32 bit hihat ----------------------------
schedule(3,   1.5,    0.2224/4, 1, 261.63*100, 900)
;schedule(3,   1.5*2,  0.2224/4, 0.9, 261.63*100, 900)
schedule(3,   1.5*3,  0.2224/4, 1, 261.63*100, 900)
;schedule(3,   1.5*4,  0.2224/4, 0.9, 261.63*100, 900)
schedule(3,   1.5*5,  0.2224/4, 1, 261.63*100, 900)
;schedule(3,   1.5*6,  0.2224/4, 0.9, 261.63*100, 900)
schedule(3,   1.5*9,  0.2224/4, 1, 261.63*100, 900)
;schedule(3,   1.5*8,  0.2224/4, 0.9, 261.63*100, 900)
schedule(3,   1.5*11,  0.2224/4, 1, 261.63*100, 900)


</CsInstruments>
<CsScore>

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
</bsbPanel>
<bsbPresets>
</bsbPresets>
