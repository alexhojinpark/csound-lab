<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
/*
The following instrument uses a single channel.
Set nchnls=2 and modify the instrument for stereo output
(so we can hear sound on both channels).

You can also make other modifications using the opcodes seen in class
(e.g., oscili, vco2, diskin, etc) to enhance
or just change the types of sounds you are generating.
*/

;/*
;Write a short study (30 to 60s) using this instrument
;(you can also make other changes to it as you wish).
;
;instr 1
;  ifreq  = cpsmidinn(p5)           
;  k1 expon  ifreq, p3, ifreq*2  
;  a1 vco2  p4, k1
;  a2 linen  a1, 0.1, p3, 0.1
;  out a2
;endin
;*/

/*
Reference for my use of midi notes:
https://inspiredacoustics.com/en/MIDI_note_numbers_and_center_frequencies
*/

0dbfs=1
nchnls=2

// Siren up
instr 1
  ifreq = cpsmidinn(p5) 					; convert MIDI note number to frequency
  k1 expon ifreq, p3, ifreq*2 			; exponential glissando of 1 octave over p3 duration 
  a1 vco2 p4, k1
  a2 linen a1, 0, p3, 0
  a3 reverb a2, 1
  outs a3, a3
endin

// Siren down
instr 2
  ifreq = cpsmidinn(p5) 					; convert MIDI note number to frequency
  k1 expon ifreq*2, p3, ifreq 			; exponential glissando of 1 octave over p3 duration 
  a1 vco2 p4, k1
  a2 linen a1, 0, p3, 0
  a3 reverb a2, 1
  outs a3, a3
endin
  
// Experiment 
// instr 3
//   ifreq = cpsmidinn(p5)
//   idur_half = p3 / 2
  
//   k1 expon ifreq, idur_half, ifreq * 2
//   a1 vco2 p4, k1
//   a2 linen a1, 0.1, idur_half, 0.1

//   k2 expon ifreq * 2, idur_half, ifreq
//   a3 vco2 p4, k2
//   a4 linen a3, 0.1, idur_half, 0.1

//   outch 1, a2 + a4 // L channel output
//   outch 2, a2 + a4 // R channel output
// endin

/*
xsig rand xamp // white noise
xsig randh xamp, xfreq // sample-and-hold noise
xsig randi xamp, xfreq // interpolated noise
*/

// Noises
instr 4
  	kAmp = p4                            ; k-rate variable for amplitude
  	kFreq = p5                           ; k-rate variable for frequency

  	; Uncomment the noise type you want to use

  	; White noise (rand)
  	; kSig rand kAmp             		; Generates white noise
  
  	; Sample-and-hold noise (randh)
  	; kSig randh kAmp, kFreq           	; Generates sample-and-hold noise
  
  	; Interpolated noise (randi)
  	kSig randi kAmp, kFreq               ; Generates interpolated noise
  
  	aOut linen kSig, 0.1, p3, 0.1        ; Apply envelope to noise
  	outs aOut, aOut                     	; Send to both channels
endin

instr 6
  	kAmp = p4                            ; k-rate variable for amplitude
  	kFreq = p5                           ; k-rate variable for frequency

  	; Uncomment the noise type you want to use

  	; White noise (rand)
  	; kSig rand kAmp               	; Generates white noise
  
  	; Sample-and-hold noise (randh)
  	kSig randh kAmp, kFreq              	; Generates sample-and-hold noise
  
  	; Interpolated noise (randi)
  	; kSig randi kAmp, kFreq				; Generates interpolated noise
  
  	aOut linen kSig, 0.1, p3, 0.1        ; Apply envelope to noise
  	outs aOut, aOut                      ; Send to both channels
endin

instr 5
	kamp expon p4, p3, 0.001 				; decaying envelope (to -60 dB)
	anoi randi kamp, p6 					; p6 controls noise bandwidth
	asin oscili anoi, p5					; p5 tunes the percussion sound
	outs1 asin
endin

instr 7
	kamp expon p4, p3, 0.001				; decaying envelope (to -60 dB)
	anoi randi kamp, p6						; p6 controls noise bandwidth
	asin oscili anoi, p5 					; p5 tunes the percussion sound
	outs2 asin
endin

// percussion
schedule(5, 0, 0.5, 1, 400, 100)
schedule(7, 0.25, 0.5, 1, 400, 100)
schedule(5, 0.5, 0.5, 1, 400, 100)
schedule(7, 0.75, 0.5, 1, 400, 100)
schedule(5, 2, 0.5, 1, 400, 100)
schedule(7, 2.5, 0.5, 1, 400, 100)
schedule(5, 2.75, 0.5, 1, 400, 100)

schedule(5, 4, 0.5, 1, 400, 100)
schedule(7, 4.25, 0.5, 1, 400, 100)
schedule(5, 4.5, 0.5, 1, 400, 100)
schedule(7, 4.75, 0.5, 1, 400, 100)
schedule(5, 6, 0.5, 1, 400, 100)
schedule(7, 6.5, 0.5, 1, 400, 100)
schedule(5, 6.75, 0.5, 1, 400, 100)

schedule(5, 8, 0.5, 1, 400, 100)
schedule(7, 8.25, 0.5, 1, 400, 100)
schedule(5, 8.5, 0.5, 1, 400, 100)
schedule(7, 8.75, 0.5, 1, 400, 100)
schedule(5, 10, 0.5, 1, 400, 100)
schedule(7, 10.5, 0.5, 1, 400, 100)
schedule(5, 10.75, 0.5, 1, 400, 100)

schedule(5, 12, 0.5, 1, 400, 100)
schedule(7, 12.25, 0.5, 1, 400, 100)
schedule(5, 12.5, 0.5, 1, 400, 100)
schedule(7, 12.75, 0.5, 1, 400, 100)
schedule(5, 14, 0.5, 1, 400, 100)
schedule(7, 14.5, 0.5, 1, 400, 100)
schedule(5, 14.75, 0.5, 1, 400, 100)

schedule(5, 16, 0.5, 1, 400, 100)
schedule(7, 16.25, 0.5, 1, 400, 100)
schedule(5, 16.5, 0.5, 1, 400, 100)
schedule(7, 16.75, 0.5, 1, 400, 100)
schedule(5, 18, 0.5, 1, 400, 100)
schedule(7, 18.5, 0.5, 1, 400, 100)
schedule(5, 18.75, 0.5, 1, 400, 100)

schedule(5, 20, 0.5, 1, 400, 100)
schedule(7, 20.25, 0.5, 1, 400, 100)
schedule(5, 20.5, 0.5, 1, 400, 100)
schedule(7, 20.75, 0.5, 1, 400, 100)
schedule(5, 22, 0.5, 1, 400, 100)
schedule(7, 22.5, 0.5, 1, 400, 100)
schedule(5, 22.75, 0.5, 1, 400, 100)

schedule(5, 24, 0.5, 1, 400, 100)
schedule(7, 24.25, 0.5, 1, 400, 100)
schedule(5, 24.5, 0.5, 1, 400, 100)
schedule(7, 24.75, 0.5, 1, 400, 100)
schedule(5, 26, 0.5, 1, 400, 100)
schedule(7, 26.5, 0.5, 1, 400, 100)
schedule(5, 26.75, 0.5, 1, 400, 100)

;schedule(5, 28, 0.5, 1, 400, 100)
;schedule(7, 28.25, 0.5, 1, 400, 100)
;schedule(5, 28.5, 0.5, 1, 400, 100)
;schedule(7, 28.75, 0.5, 1, 400, 100)
schedule(5, 31, 0.5, 1, 400, 100)
schedule(7, 31.5, 0.5, 1, 400, 100)
schedule(5, 31.75, 0.5, 1, 400, 100)

// noise
schedule(4, 8, 1, 0.1, 600)
schedule(4, 10, 1, 0.1, 400)
schedule(4, 12, 1, 0.1, 600)
schedule(4, 14, 1, 0.1, 400)

// noise
schedule(4, 16, 1, 0.1, 400)
schedule(4, 18, 1, 0.1, 400)
schedule(4, 20, 1, 0.1, 400)
schedule(4, 22, 1, 0.1, 400)

// siren
;schedule(2, 5, 1, 0.013, 47)  // (inst, iwhen, idur, kamp, ifreq) 
;schedule(2, 7, 1, 0.013, 47)  // (inst, iwhen, idur, kamp, ifreq) 
schedule(1, 16, 14, 0.013, 47)  // (inst, iwhen, idur, kamp, ifreq)
schedule(2, 30, 1, 0.013, 50) 
;schedule(2, 26, 0.5, 0.015, 47)  // (inst, iwhen, idur, kamp, ifreq) 
;schedule(1, 20, 8, 0.015, 57)  // (inst, iwhen, idur, kamp, ifreq) 
;schedule(2, 22, 8, 0.015, 57)  // (inst, iwhen, idur, kamp, ifreq)

</CsInstruments>
<CsScore>
f 0 35
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
