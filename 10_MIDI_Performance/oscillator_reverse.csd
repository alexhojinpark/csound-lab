<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
0dbfs = 1

gihd OSCinit 7000

// receive instrument
instr 1
kdur init 0
ka init 0
kf init 0

kres OSClisten gihd, "/parm","fff",kdur,ka,kf
if kres > 0 then
 schedulek(2,0,kdur,ka,kf)
endif

endin
schedule(1,0,-1)

instr 2
k1 linen p4,0.1,p3,0.01
a2 oscili k1,p5
   out a2
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
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
