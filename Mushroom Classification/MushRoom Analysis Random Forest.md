Mushroom Analysis Random Forest
========================================================
author: Casey Jenkins
date: 28-Aug-2017
autosize: true

Slide With Code
========================================================


```
     Edible CapShape CapSurface CapColor Bruises    Odor GillAttachment
1 Poisonous   Convex     Smooth    Brown    True Pungent           Free
2    Edible   Convex     Smooth   Yellow    True  Almond           Free
3    Edible     Bell     Smooth    White    True   Anise           Free
4 Poisonous   Convex      Scaly    White    True Pungent           Free
5    Edible   Convex     Smooth     Gray   False    None           Free
6    Edible   Convex      Scaly   Yellow    True  Almond           Free
  GillSpacing GillSize GillColor StalkShape StalkRoot
1       Close   Narrow     Black  Enlarging     Equal
2       Close    Broad     Black  Enlarging      Club
3       Close    Broad     Brown  Enlarging      Club
4       Close   Narrow     Brown  Enlarging     Equal
5     Crowded    Broad     Black   Tapering     Equal
6       Close    Broad     Brown  Enlarging      Club
  StalkSurfaceAboveRing StalkSurfaceBelowRing StalkColorAboveRing
1                Smooth                Smooth               White
2                Smooth                Smooth               White
3                Smooth                Smooth               White
4                Smooth                Smooth               White
5                Smooth                Smooth               White
6                Smooth                Smooth               White
  StalkColorBelowRing VeilType VeilColor RingNumber   RingType
1               White  Partial     White        One    Pendant
2               White  Partial     White        One    Pendant
3               White  Partial     White        One    Pendant
4               White  Partial     White        One    Pendant
5               White  Partial     White        One Evanescent
6               White  Partial     White        One    Pendant
  SporePrintColor Population Habitat
1           Black  Scattered   Urban
2           Brown   Numerous Grasses
3           Brown   Numerous Meadows
4           Black  Scattered   Urban
5           Brown  Abundnant Grasses
6           Black   Numerous Grasses
```

```
       Edible        CapShape      CapSurface      CapColor   
 Edible   :4208   Convex :3656   Scaly  :3244   Brown  :2284  
 Poisonous:3916   Flat   :3152   Smooth :2556   Gray   :1840  
                  Knobbed: 828   Fibrous:2320   Red    :1500  
                  Bell   : 452   Grooves:   4   Yellow :1072  
                  Sunken :  32   f      :   0   White  :1040  
                  Conical:   4   g      :   0   Buff   : 168  
                  (Other):   0   (Other):   0   (Other): 220  
  Bruises          Odor         GillAttachment  GillSpacing  
 f    :   0   None   :3528   a         :   0   c      :   0  
 t    :   0   Foul   :2160   f         :   0   w      :   0  
 True :3376   Fishy  : 576   Attached  : 210   Close  :6812  
 False:4748   Spicy  : 576   Descending:   0   Crowded:1312  
              Almond : 400   Free      :7914   Distant:   0  
              Anise  : 400   Notched   :   0                 
              (Other): 484                                   
   GillSize        GillColor        StalkShape     StalkRoot   
 b     :   0   Buff     :1728   e        :   0   Bulbous:3776  
 n     :   0   Pink     :1492   t        :   0   Missing:2480  
 Broad :5612   White    :1202   Enlarging:3516   Equal  :1120  
 Narrow:2512   Brown    :1048   Tapering :4608   Club   : 556  
               Gray     : 752                    Rooted : 192  
               Chocolate: 732                    ?      :   0  
               (Other)  :1170                    (Other):   0  
 StalkSurfaceAboveRing StalkSurfaceBelowRing StalkColorAboveRing
 Smooth :5176          Smooth :4936          White  :4464       
 Silky  :2372          Silky  :2304          Pink   :1872       
 Fibrous: 552          Fibrous: 600          Gray   : 576       
 Scaly  :  24          Scaly  : 284          Brown  : 448       
 f      :   0          f      :   0          Buff   : 432       
 k      :   0          k      :   0          Orange : 192       
 (Other):   0          (Other):   0          (Other): 140       
 StalkColorBelowRing      VeilType      VeilColor    RingNumber 
 White  :4384        p        :   0   White  :7924   n   :   0  
 Pink   :1872        Partial  :8124   Brown  :  96   o   :   0  
 Gray   : 576        Universal:   0   Orange :  96   t   :   0  
 Brown  : 512                         Yellow :   8   None:  36  
 Buff   : 432                         n      :   0   One :7488  
 Orange : 192                         o      :   0   Two : 600  
 (Other): 156                         (Other):   0              
       RingType     SporePrintColor     Population      Habitat    
 Pendant   :3968   White    :2388   Several  :4040   Woods  :3148  
 Evanescent:2776   Brown    :1968   Solitary :1712   Grasses:2148  
 Large     :1296   Black    :1872   Scattered:1248   Paths  :1144  
 Flaring   :  48   Chocolate:1632   Numerous : 400   Leaves : 832  
 None      :  36   Green    :  72   Abundnant: 384   Urban  : 368  
 e         :   0   Buff     :  48   Clustered: 340   Meadows: 292  
 (Other)   :   0   (Other)  : 144   (Other)  :   0   (Other): 192  
```

Slide With Plot
========================================================

![plot of chunk unnamed-chunk-2](MushRoom Analysis Random Forest-figure/unnamed-chunk-2-1.png)
