;<CsoundSynthesizer>
;<CsOptions>
;-odac
;</CsOptions>
;<CsInstruments>
;
;// grain processing
;0dbfs = 1
;
;// grain envelope
;gife ftgen 0,0,16384,20,6,1
;gifw ftgen 0,0,0,1,"fox.wav",0,0,1
;
;instr 1
; aenv oscili p4, 1/p3, gife
; asig poscil aenv, p5*sr/ftlen(gifw), gifw, p6
;      out asig 
;endin
;
;igdur = 0.02 // grain dur
;igrate = 100 // grains per sec
;igfreq = 1 // grain pitch
;igamp = 0.5  // grain amplitude
;ign = 1000   // number of grains
;
;ik = 1
;while ik <= ign do
; schedule(1, ik/igrate, igdur, igamp, igfreq, ik/ign)
; ik += 1
;od
;
;</CsInstruments>
;<CsScore>
;</CsScore>
;</CsoundSynthesizer>
;
;
<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac     ;;;realtime audio out
;-iadc    ;;;uncomment -iadc if real audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o partikkel.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 20
nchnls = 2

giSine		ftgen	0, 0, 65537, 10, 1
giCosine	ftgen	0, 0, 8193, 9, 1, 1, 90

instr 1

kgrainfreq	= 200			; 4 grains per second
kdistribution	= 0			; periodic grain distribution
idisttab	= -1			; (default) flat distribution used for grain distribution
async		= 0			; no sync input
kenv2amt	= 0			; no secondary enveloping
ienv2tab	= -1			; default secondary envelope (flat)
ienv_attack	= -1 ;			; default attack envelope (flat)
ienv_decay	= -1 ;			; default decay envelope (flat)
ksustain_amount	= 0.5			; time (in fraction of grain dur) at sustain level for each grain
ka_d_ratio	= 0.5 			; balance between attack and decay time
kduration	= (0.5/kgrainfreq)*1000	; set grain duration relative to grain rate
kamp		= 5000 			; amp
igainmasks	= -1			; (default) no gain masking
kwavfreq	= 440			; fundamental frequency of source waveform
ksweepshape	= 0			; shape of frequency sweep (0=no sweep)
iwavfreqstarttab = -1			; default frequency sweep start (value in table = 1, which give no frequency modification)
iwavfreqendtab	= -1			; default frequency sweep end (value in table = 1, which give no frequency modification)
awavfm		= 0			; no FM input
ifmamptab	= -1			; default FM scaling (=1)
kfmenv		= -1			; default FM envelope (flat)
icosine		= giCosine		; cosine ftable
kTrainCps	= kgrainfreq		; set trainlet cps equal to grain rate for single-cycle trainlet in each grain
knumpartials	= 3			; number of partials in trainlet
kchroma		= 1			; balance of partials in trainlet
ichannelmasks	= -1			; (default) no channel masking, all grains to output 1
krandommask	= 0			; no random grain masking
kwaveform1	= giSine		; source waveforms
kwaveform2	= giSine		;
kwaveform3	= giSine		;
kwaveform4	= giSine		;
iwaveamptab	= -1			; (default) equal mix of all 4 sourcve waveforms and no amp for trainlets
asamplepos1	= 0			; phase offset for reading source waveform
asamplepos2	= 0			;
asamplepos3	= 0			;
asamplepos4	= 0			;
kwavekey1	= 1			; original key for source waveform
kwavekey2	= 1			;
kwavekey3	= 1			;
kwavekey4	= 1			;
imax_grains	= 100			; max grains per k period

asig	partikkel kgrainfreq, kdistribution, idisttab, async, kenv2amt, ienv2tab, \
               ienv_attack, ienv_decay, ksustain_amount, ka_d_ratio, kduration, kamp, igainmasks, \
               kwavfreq, ksweepshape, iwavfreqstarttab, iwavfreqendtab, awavfm, \
               ifmamptab, kfmenv, icosine, kTrainCps, knumpartials, \
               kchroma, ichannelmasks, krandommask, kwaveform1, kwaveform2, kwaveform3, kwaveform4, \
               iwaveamptab, asamplepos1, asamplepos2, asamplepos3, asamplepos4, \
               kwavekey1, kwavekey2, kwavekey3, kwavekey4, imax_grains

outs	asig, asig
endin

</CsInstruments>
<CsScore>
i1 0 5 	; partikkel
e
</CsScore>
</CsoundSynthesizer>






<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>553</width>
 <height>414</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>34</x>
  <y>34</y>
  <width>519</width>
  <height>159</height>
  <uuid>{9334aebf-6ff8-46bf-a1f8-4432baaca53a}</uuid>
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
 <bsbObject type="BSBGraph" version="2">
  <objectName>graph1</objectName>
  <x>35</x>
  <y>225</y>
  <width>458</width>
  <height>189</height>
  <uuid>{ec9057d4-b17b-4c85-b694-0dec1a12500a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>0</value>
  <objectName2/>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <showSelector>true</showSelector>
  <showGrid>true</showGrid>
  <showTableInfo>true</showTableInfo>
  <showScrollbars>true</showScrollbars>
  <enableTables>true</enableTables>
  <enableDisplays>true</enableDisplays>
  <all>true</all>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
