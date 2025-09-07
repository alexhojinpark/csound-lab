<CsoundSynthesizer>
<CsOptions>
-odac -iadc
</CsOptions>
<CsInstruments>
0dbfs = 1

instr 1
	ifr = p4 // lowest freq
  	iq = p5 // Q
  	ibands = p6 // no of bands
  	ispac = p7 // spacing in semitones
  
  	gas vco2 0dbfs, p8 // excitation signal
  	gan diskin "fox.wav", 1, 0, 1  // fox.wav as analysis signal
  
  	icnt = 0 // loop to launch the vocoder bands
  	
  	while icnt < ibands do
    	ibw = ifr / iq
    	ip1 = 100 + icnt / 100  // p1 defining distinct instances
    	schedule(ip1, 0, p3, ifr, ibw)
    	ifr *= 2^(ispac / 12)
    	icnt += 1
  	od
endin 

instr 100  
	out(balance(butterbp(butterbp(gas,p4,p5),p4,p5),
               butterbp(butterbp(gan,p4,p5),p4,p5)))
endin

schedule(1,0,-1,100,25,24,4,200)

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
