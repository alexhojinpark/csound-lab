<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 1
0dbfs = 1

// John  M. Chowing FM Synth example from Fig. 10.
instr 1
	ifna = p9 		; amplitude env table
	ifnb = p10		; timbre env table
	ae oscili  p4, 1/p3, ifna
	ai oscili (p8-p7)*p6, 1/p3, ifnb
	am oscili  p7*p6 + ai, p6
	ac oscili  ae, am + p5 
	out ac  
endin

// (Maybe a) John  M. Chowing FM Synth example from Fig. 17.
// m = modular, c = carrier, s = scale for multiply
instr 2
	kamp linen 0.01, 0.01, 0.01, 0.01
	
	ifc = p13		; carrier frequency
	isdev = p14	; scale dev
	isamp = p15	; scale amp
	
	ifna = p16	; env shape
	ifnb = p17	; env shape
	
	am1 oscili p4, 1/p3, ifna
  	am2 oscili (p8-p7)*p6, 1/p3, ifnb
   	ac1 oscili p7*p6, am2 + ifc
   	am3 oscili ac1, p6 
	ac2 oscili p5, am3 + ifc
   	as1 oscili am3 * isdev, p11	; am3, p11 * isdev ...maybe?
   	ac3 oscili as1 + ifc, p12		; as1, p12 + ifc
   	as2 oscili am1 * isamp, p10	; am1, p10 * isamp
   	am4 oscili am1, ac2
   	am5 oscili as2, ac3

   	afinal oscili kamp, am4 + am5 + ifc
    
   	out afinal
endin

// Soft Brass tone
ia ftgen 0, 0, 1024, 7, 0, 100, 1, 100, 0.7, 724, 0.7, 100, 0
schedule(1, 0, 0.6, 0.5, 196, 196, 0, 2, ia, ia)
schedule(1, 0.6, 0.45, 0.5, 220, 220, 0, 2, ia, ia)
schedule(1, 1.1, 0.45, 0.5, 233.08, 233.08, 0, 2, ia, ia)
schedule(1, 1.55, 1.8, 0.5, 311.13, 311.13, 0, 2, ia, ia)

// Woodwind-like tones
ilen = 1024
ia ftgen 0, 0, 1024, 5, 0.001, ilen * 0.05, 1, ilen * 0.94, 1, ilen * 0.01, 0.001
ie ftgen 0, 0, 1024, 5, 0.001, ilen * 0.05, 1, ilen * 0.95, 1
schedule(1, 3.35, 3, 0.2, 500, 100, 0, 1.5, ia, ie)

// percussion tones (tubular bells)
ia ftgen 0, 0, 1024, 5, 1, 1024, 0.001
schedule(1,6,12,0.3,200*2,280*2,0,2,ia,ia)
schedule(1,7,12,0.3,200*2,380*3,0,2,ia,ia)
schedule(1,8,12,0.3,200/2,280/2,0,2,ia,ia)


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
  <y>36</y>
  <width>660</width>
  <height>226</height>
  <uuid>{302fe65d-d5f6-4ec7-9775-6fdf2e645c45}</uuid>
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
