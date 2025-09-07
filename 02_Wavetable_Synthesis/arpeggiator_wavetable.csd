<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

0dbfs=1
nchnls=2

; Basic ifn ----------------------------------------------------------------

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
;; Arpreggiator example -----------------------------------------------------
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

; Looping Arpreggiator example ----------------------------------------------

ifn ftgen 1, 0, 8, -2, 0, 4, 7, 12, 7, 12, 7, 4

instr 1
 k1 phasor p6
 k2 table k1, 1, 1
 a1 oscili p4, cpsmidinn(p5+k2)
 a2 linen a1, 0.1, p3, 0.1
 out a2
endin
schedule(1, 0, 1, 0.5, 72, 0.9) 
schedule(1, 1, 1, 0.5, 71, 1.4) 
schedule(1, 2, 1, 0.5, 70, 2.3) 


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
</bsbPanel>
<bsbPresets>
</bsbPresets>
