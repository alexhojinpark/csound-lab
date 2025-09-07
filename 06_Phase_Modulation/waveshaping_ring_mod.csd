<CsoundSynthesizer>
<CsOptions>
-odac --midi-key-cps=5 --midi-velocity-amp=4
</CsOptions>

<CsInstruments>
;  waveshaping + ring modulation
0dbfs = 1

;;channels
chn_k "index",3
chn_k "fm",3


instr 1

ifr  = p5
kfm  chnget "fm"
iatt = 0.1
kmax chnget "index"
iamp = p4 

iftransfer = 3    ; transfer function
andx    linenr   kmax*0.5, 0.04, 0.1, 0.01
adr     oscili   andx,ifr*(kfm+1),-1,0.25    
aws     tablei   adr, iftransfer, 1, 0.5
amod    oscili   iamp, ifr,-1, 0.25 
arm     = amod*aws ;  ring modulation

amix = amod*(1-andx) + arm
           out linenr(amix*0.1,0.01,0.1,0.01)

endin
</CsInstruments>

<CsScore>           
f3 0 4097 13 1 1 0 .1 -.5 -3.33 2.5 2.1 -1.5 -1.1 .3 .1 -.4 -.5
; polynomial from Dodge & Jerse
f2 0 4097 3 -1 1 0.3 -1.27 -1.8 3.6 7.2 -17.44 -16 40.32 12.8 -43.52 20.48
f 0 z

;i1 0 100 0.9 400

</CsScore>

</CsoundSynthesizer>








<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>412</width>
 <height>298</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
 <bsbObject version="2" type="BSBController">
  <objectName>fm</objectName>
  <x>31</x>
  <y>49</y>
  <width>381</width>
  <height>249</height>
  <uuid>{c2e3154c-a352-47ea-84bb-e822d2dbe935}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>index</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.83727034</xValue>
  <yValue>0.71084337</yValue>
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
</bsbPanel>
<bsbPresets>
</bsbPresets>
