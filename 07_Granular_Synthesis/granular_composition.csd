<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr     = 44100
ksmps  = 32
0dbfs  = 1

// ============================================================================
//	fof (Granular Synthesis)
// ============================================================================
gifn1 ftgen 10,0,1025,19,0.5,0.5,270,0.5
gifn2 ftgen 12,0,1025,7,0,1024,1

// e, a, i, o, u, e, a, i
gif1 ftgen 0,0,8,-2, 400, 650, 290, 400, 350, 400, 659, 290
gif2 ftgen 0,0,8,-2,1700,1080,1870, 800, 600,1700,1080,1870  
gif3 ftgen 0,0,8,-2,2600,2650,2800,2600,2700,2600,2650,2800
gif4 ftgen 0,0,8,-2,3200,2900,3250,2800,2900,3200,2900,3250
gif5 ftgen 0,0,8,-2,3580,3250,3100,3000,3300,3580,3250,3100

gib1 ftgen 0,0,8,-2, 70, 80, 40, 70, 40, 70, 80, 40
gib2 ftgen 0,0,8,-2, 80, 90, 90, 80, 60, 80, 90, 90 
gib3 ftgen 0,0,8,-2,100,120,100,100,100,100,120,100
gib4 ftgen 0,0,8,-2,120,130,120,130,120,120,130,120
gib5 ftgen 0,0,8,-2,120,140,120,135,120,120,140,120

gia2 ftgen 0,0,8,-2,-14, -6,-15,-10,-20,-14, -6,-15
gia3 ftgen 0,0,8,-2,-12, -7,-18,-12,-17,-12, -7,-18
gia4 ftgen 0,0,8,-2,-14, -8,-20,-12,-14,-14, -8,-20
gia5 ftgen 0,0,8,-2,-20,-22,-30,-26,-26,-20,-22,-30

instr 1
 gifn = p6
 kn phasor 0.5

 kf1 tablei kn, gif1, 1, 0, 1 
 kf2 tablei kn, gif2, 1, 0, 1 
 kf3 tablei kn, gif3, 1, 0, 1 
 kf4 tablei kn, gif4, 1, 0, 1 
 kf5 tablei kn, gif5, 1, 0, 1 
 
 kb1 tablei kn, gib1, 1, 0, 1 
 kb2 tablei kn, gib2, 1, 0, 1 
 kb3 tablei kn, gib3, 1, 0, 1 
 kb4 tablei kn, gib4, 1, 0, 1 
 kb5 tablei kn, gib5, 1, 0, 1 
 
 ka2 = ampdb(tablei(kn, gia2, 1, 0, 1))
 ka3 = ampdb(tablei(kn, gia3, 1, 0, 1))
 ka4 = ampdb(tablei(kn, gia4, 1, 0, 1))
 ka5 = ampdb(tablei(kn, gia5, 1, 0, 1))
 
 iamp = p4
 ifo = p5
 koct = 0
 kdur = 0.02
 kris = 0.002
 kdec = 0.1
 iol = 0.02*ifo + 2
 
 avibr oscili ifo*0.02, 4
 ajit  randi  ifo*0.005, 1.2
 afo = ifo + ajit + avibr
 
 a1 fof   1, afo, kf1, koct, kb1, kris, kdur, kdec, iol, -1, gifn, p3 
 a2 fof ka2, afo, kf2, koct, kb2, kris, kdur, kdec, iol, -1, gifn, p3 
 a3 fof ka3, afo, kf3, koct, kb3, kris, kdur, kdec, iol, -1, gifn, p3 
 a4 fof ka4, afo, kf4, koct, kb4, kris, kdur, kdec, iol, -1, gifn, p3 
 a5 fof ka5, afo, kf5, koct, kb5, kris, kdur, kdec, iol, -1, gifn, p3 
 
 amix = (a1 + a2 + a3 + a4 + a5)*0.2
 asig linen amix, 0.2, p3, 0.2 // strong rise and dec
       out asig*iamp
endin


instr 3
 gifn = p6
 kn phasor 0.8 // higher phasor

 kf1 tablei kn, gif1, 1, 0, 1 
 kf2 tablei kn, gif2, 1, 0, 1 
 kf3 tablei kn, gif3, 1, 0, 1 
 kf4 tablei kn, gif4, 1, 0, 1 
 kf5 tablei kn, gif5, 1, 0, 1 
 
 kb1 tablei kn, gib1, 1, 0, 1 
 kb2 tablei kn, gib2, 1, 0, 1 
 kb3 tablei kn, gib3, 1, 0, 1 
 kb4 tablei kn, gib4, 1, 0, 1 
 kb5 tablei kn, gib5, 1, 0, 1 
 
 ka2 = ampdb(tablei(kn, gia2, 1, 0, 1))
 ka3 = ampdb(tablei(kn, gia3, 1, 0, 1))
 ka4 = ampdb(tablei(kn, gia4, 1, 0, 1))
 ka5 = ampdb(tablei(kn, gia5, 1, 0, 1))
 
 iamp = p4
 ifo = p5
 koct = 0
 kdur = 0.02
 kris = 0.002
 kdec = 0.1
 iol = 0.02*ifo + 2
 
 avibr oscili ifo*0.02, 4
 ajit  randi  ifo*0.005, 1.2
 afo = ifo + ajit + avibr
 
 a1 fof   1, afo, kf1, koct, kb1, kris, kdur, kdec, iol, -1, gifn, p3 
 a2 fof ka2, afo, kf2, koct, kb2, kris, kdur, kdec, iol, -1, gifn, p3 
 a3 fof ka3, afo, kf3, koct, kb3, kris, kdur, kdec, iol, -1, gifn, p3 
 a4 fof ka4, afo, kf4, koct, kb4, kris, kdur, kdec, iol, -1, gifn, p3 
 a5 fof ka5, afo, kf5, koct, kb5, kris, kdur, kdec, iol, -1, gifn, p3 
 
 amix = (a1 + a2 + a3 + a4 + a5)*0.2
 asig linen amix, 0.01, p3, 0.01 // lesser rise and dec
       out asig*iamp
endin

// ============================================================================
//	diskgrain (Granular Synthesis)
// ============================================================================
gifn1 ftgen 1, 0, 8192, 20, 2, 1
;gifn1 ftgen 1, 0, 16384, 20, 6, 1

instr 2

iolaps  = 5
igrsize = 0.01
ifreq   = iolaps/igrsize
ips     = 1/iolaps

istr = p4  /* timescale */
ipitch = p5 /* pitchscale */

a1 diskgrain "fox.wav", 0.25, ifreq, ipitch, igrsize, ips*istr, 1, iolaps
;prints "\nplaying fox.wav\n\n"
   out   a1

endin
// ============================================================================
// Voice
// ============================================================================
; G F A Bb D
schedule(1, 0, 2.5, 0.5, 196/2, 12)
schedule(1, 0, 2.5, 0.5, 349.23/2, 12)
schedule(1, 0, 2.5, 0.5, 440/2, 12)
schedule(1, 0, 2.5, 0.5, 466.16/2, 12)
schedule(1, 0, 2.5, 0.5, 587.33/2, 12)

; D A F A C E
schedule(1, 2.5, 2.5, 0.5, 36.71*2, 12)
schedule(1, 2.5, 2.5, 0.5, 55*2, 12)
schedule(1, 2.5, 2.5, 0.5, 87.31*2, 12)
schedule(1, 2.5, 2.5, 0.5, 110*2, 12)
schedule(1, 2.5, 2.5, 0.5, 130.81*2, 12)
schedule(1, 2.5, 2.5, 0.5, 164.81*2, 12)

; A G B C D
schedule(1, 5, 2.5, 0.5, 220, 12)
schedule(1, 5, 2.5, 0.5, 392, 12)
schedule(1, 5, 2.5, 0.5, 493.88/2, 12)
schedule(1, 5, 2.5, 0.5, 523.25/2, 12)
schedule(1, 5, 2.5, 0.5, 587.33/2, 12)

; Bb A Bb D F
schedule(1, 7.5, 1.25, 0.5, 233.08 , 12)
schedule(1, 7.5, 1.25, 0.5, 440, 12)
schedule(1, 7.5, 1.25, 0.5, 233.08*2, 12)
schedule(1, 7.5, 1.25, 0.5, 587.33/2, 12)
schedule(1, 7.5, 1.25, 0.5, 349.23, 12)

; A G A C F
schedule(1, 8.75, 1.25, 0.5, 220, 12)
schedule(1, 8.75, 1.25, 0.5, 392, 12)
schedule(1, 8.75, 1.25, 0.5, 440, 12)
schedule(1, 8.75, 1.25, 0.5, 523.25, 12)
schedule(1, 8.75, 1.25, 0.5, 349.23*2, 12)

// ============================================================================
// Changed Voice
// ============================================================================
schedule(3, 10, 2.5, 0.5, 196/2, 12)
schedule(3, 10, 2.5, 0.5, 349.23/2, 12)
schedule(3, 10, 2.5, 0.5, 440/2, 12)
schedule(3, 10, 2.5, 0.5, 466.16/2, 12)
schedule(3, 10, 2.5, 0.5, 587.33/2, 12)

schedule(3, 12.5, 2.5, 0.5, 36.71*2, 12)
schedule(3, 12.5, 2.5, 0.5, 55*2, 12)
schedule(3, 12.5, 2.5, 0.5, 87.31*2, 12)
schedule(3, 12.5, 2.5, 0.5, 110*2, 12)
schedule(3, 12.5, 2.5, 0.5, 130.81*2, 12)
schedule(3, 12.5, 2.5, 0.5, 164.81*2, 12)

; A G B C D
schedule(3, 15, 2.5, 0.5, 220, 12)
schedule(3, 15, 2.5, 0.5, 392, 12)
schedule(3, 15, 2.5, 0.5, 493.88/2, 12)
schedule(3, 15, 2.5, 0.5, 523.25/2, 12)
schedule(3, 15, 2.5, 0.5, 587.33/2, 12)

; Bb A Bb D F
schedule(3, 17.5, 1.25, 0.5, 233.08 , 12)
schedule(3, 17.5, 1.25, 0.5, 440, 12)
schedule(3, 17.5, 1.25, 0.5, 233.08*2, 12)
schedule(3, 17.5, 1.25, 0.5, 587.33/2, 12)
schedule(3, 17.5, 1.25, 0.5, 349.23, 12)

; A G A C F
schedule(1, 18.75, 1.25, 0.5, 220, 12)
schedule(1, 18.75, 1.25, 0.5, 392, 12)
schedule(1, 18.75, 1.25, 0.5, 440, 12)
schedule(1, 18.75, 1.25, 0.5, 523.25, 12)
schedule(1, 18.75, 1.25, 0.5, 349.23*2, 12)

// ============================================================================
// Fox.wav
// ============================================================================

schedule(2, 0, 2.6, 1, 1)

schedule(2, 5, 2.6, 1, 1)
schedule(2, 5, 2.6, 1, 1.25)
schedule(2, 5, 2.6, 1, 1.5)

schedule(2, 10, 2.7, 1, 1)
schedule(2, 10, 2.7, 1, 1.25)
schedule(2, 10, 2.7, 1, 1.5)
schedule(2, 10, 2.7, 1, 1.75)
schedule(2, 10, 2.7, 1, 2)

schedule(2, 12.5, 2.7, 1, 1)
schedule(2, 12.75, 2.7, 1, 1)
schedule(2, 13, 2.7, 1, 1)
schedule(2, 13.25, 2.7, 1, 1)
schedule(2, 13.5, 2.7, 1, 2)

schedule(2, 13.75, 2.7, 1, 1.5)
schedule(2, 14, 2.7, 1, 1.5)
schedule(2, 14.25, 2.7, 1, 1.5)
schedule(2, 14.75, 2.7, 1, 1.5)
schedule(2, 15, 2.7, 1, 2)

// The quick brown fox
schedule(2, 20, 1.1, 1, 1)
schedule(2, 20, 1.1, 1, 1.25)
schedule(2, 20, 1.1, 1, 1.5)
schedule(2, 20, 1.1, 1, 1.75)
schedule(2, 20, 1.1, 1, 2)

// The quick brown
schedule(2, 21.2, 0.65, 1, 1)
schedule(2, 21.2, 0.65, 1, 1.25)
schedule(2, 21.2, 0.65, 1, 1.5)
schedule(2, 21.2, 0.65, 1, 1.75)
schedule(2, 21.2, 0.65, 1, 2)

// The quick!
schedule(2, 21.85, 0.4, 1, 1)
schedule(2, 21.85, 0.4, 1, 1.25)
schedule(2, 21.85, 0.4, 1, 1.5)
schedule(2, 21.85, 0.4, 1, 1.75)
schedule(2, 21.85, 0.4, 1, 2)

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
