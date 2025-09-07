<CsoundSynthesizer>
<CsOptions>
-odac -m0
</CsOptions>
<CsInstruments>
0dbfs = 1

// Additive Synthesis Texture
// a stream of partials
// generated via a recursive method

// seed the random number generator with current time
seed 0
rndseed random(0,1) 
 
// golden mean (to be divided into 9 steps) 
gigold = (1+sqrt(5))/2 
// pitch scale centre frequency
gicf = 4000 


instr 1
 // max partial dur 
 idur = 5 
 // min sound start time delta
 ist = 0.01
 // amplitude
 iamp = p4
 
 // random pitch scale step in the range (-28, 28)
 istep = floor(birnd(28)) 
 // partial start frequency
 ifreq = gicf*gigold^(istep/9) 
  
 // random time variation for attack
 iatt = rnd(0.05)    
 // amp envelope (attack + decay)
 ka expseg 0.001, iatt, iamp, p3 - iatt, 0.001
 // freq envelope (steady attack + glissando)
 kf expseg ifreq, iatt, ifreq, p3 - iatt, ifreq*(1 + birnd(0.2)) 

 // sine wave partial 
 asig oscili ka,kf
      out asig
      
 // schedule nxt partial with random variation
 schedule 1, ist+rnd(ist), rnd(idur), rnd(0.01) 
 
endin

// prime partial stream
schedule 1, 0, 0.1, 0.01

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>




<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>348</x>
 <y>146</y>
 <width>320</width>
 <height>240</height>
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
