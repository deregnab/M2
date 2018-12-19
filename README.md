.
├── a
│   ├── troll-grayscale.stif
│   └── troll.stif
├── b
│   ├── crashes
│   │   ├── id:000000,sig:11,src:000000,op:flip1,pos:20
│   │   ├── id:000001,sig:06,src:000005,op:flip2,pos:17
│   │   ├── id:000002,sig:06,src:000008,op:flip1,pos:17
│   │   ├── id:000003,sig:06,src:000008,op:flip4,pos:17
│   │   ├── id:000004,sig:11,src:000016,op:arith8,pos:7,val:-7
│   │   ├── id:000005,sig:06,src:000041,op:int16,pos:17,val:+1000
│   │   ├── id:000006,sig:06,src:000042,op:arith8,pos:22,val:+27
│   │   ├── id:000007,sig:06,src:000056,op:arith8,pos:22,val:+28
│   │   ├── id:000008,sig:06,src:000064,op:arith8,pos:23,val:+28
│   │   └── README.txt
│   ├── fuzz_bitmap
│   ├── fuzzer_stats
│   ├── hangs
│   ├── plot_data
│   └── queue
│       ├── id:000000,orig:troll-grayscale.stif
│       ├── id:000001,orig:troll.stif
│       ├── id:000002,src:000000,op:flip1,pos:0,+cov
│       ├── id:000003,src:000000,op:flip1,pos:2,+cov
│       ├── id:000004,src:000000,op:flip1,pos:3,+cov
│       ├── id:000005,src:000000,op:flip1,pos:7,+cov
│       ├── id:000006,src:000000,op:flip1,pos:9,+cov
│       ├── id:000007,src:000000,op:flip1,pos:15,+cov
│       ├── id:000008,src:000000,op:flip1,pos:15,+cov
│       ├── id:000009,src:000000,op:flip1,pos:17
│       ├── id:000010,src:000000,op:flip1,pos:17,+cov
│       ├── id:000011,src:000000,op:flip1,pos:17
│       ├── id:000012,src:000000,op:flip1,pos:18,+cov
│       ├── id:000013,src:000000,op:flip1,pos:18,+cov
│       ├── id:000014,src:000000,op:flip1,pos:20,+cov
│       ├── id:000015,src:000000,op:flip1,pos:86
│       ├── id:000016,src:000000,op:flip1,pos:89,+cov
│       ├── id:000017,src:000000,op:flip1,pos:155
│       ├── id:000018,src:000000,op:flip1,pos:224
│       ├── id:000019,src:000000,op:flip1,pos:224
│       ├── id:000020,src:000000,op:flip1,pos:224
│       ├── id:000021,src:000000,op:flip1,pos:431
│       ├── id:000022,src:000000,op:flip1,pos:500
│       ├── id:000023,src:000000,op:flip1,pos:983
│       ├── id:000024,src:000000,op:flip1,pos:1052
│       ├── id:000025,src:000000,op:flip1,pos:1949
│       ├── id:000026,src:000000,op:flip1,pos:2087
│       ├── id:000027,src:000000,op:flip1,pos:2156
│       ├── id:000028,src:000000,op:flip2,pos:2225
│       ├── id:000029,src:000000,op:arith8,pos:224,val:+11
│       ├── id:000030,src:000000,op:int8,pos:17,val:+1,+cov
│       ├── id:000031,src:000002,op:havoc,rep:128,+cov
│       ├── id:000032,src:000005,op:flip1,pos:15,+cov
│       ├── id:000033,src:000005,op:havoc,rep:32,+cov
│       ├── id:000034,src:000008,op:flip1,pos:17,+cov
│       ├── id:000035,src:000008,op:flip2,pos:17
│       ├── id:000036,src:000008,op:arith8,pos:17,val:+9,+cov
│       ├── id:000037,src:000008,op:int8,pos:17,val:+1,+cov
│       ├── id:000038,src:000008,op:int8,pos:17,val:+16
│       ├── id:000039,src:000008,op:ext_AO,pos:17
│       ├── id:000040,src:000008,op:havoc,rep:2,+cov
│       ├── id:000041,src:000013,op:flip1,pos:15
│       ├── id:000042,src:000034,op:havoc,rep:2,+cov
│       ├── id:000043,src:000039,op:flip1,pos:17
│       ├── id:000044,src:000039,op:flip1,pos:17
│       ├── id:000045,src:000042,op:flip1,pos:22
│       ├── id:000046,src:000020,op:flip1,pos:224,+cov
│       ├── id:000047,src:000001,op:flip1,pos:214
│       ├── id:000048,src:000001,op:flip1,pos:411
│       ├── id:000049,src:000001,op:flip1,pos:608
│       ├── id:000050,src:000001,op:flip1,pos:1396
│       ├── id:000051,src:000001,op:flip1,pos:2972
│       ├── id:000052,src:000017,op:flip1,pos:155,+cov
│       ├── id:000053,src:000024,op:flip1,pos:1052
│       ├── id:000054,src:000028,op:flip1,pos:2225
│       ├── id:000055,src:000054,op:havoc,rep:2
│       ├── id:000056,src:000045,op:flip1,pos:15
│       ├── id:000057,src:000050,op:flip1,pos:1396
│       ├── id:000058,src:000055,op:havoc,rep:4
│       ├── id:000059,src:000058,op:ext_AO,pos:16
│       ├── id:000060,src:000058,op:havoc,rep:4,+cov
│       ├── id:000061,src:000059,op:flip2,pos:707
│       ├── id:000062,src:000059,op:havoc,rep:2,+cov
│       ├── id:000063,src:000059,op:havoc,rep:8
│       ├── id:000064,src:000042,op:havoc,rep:2
│       ├── id:000065,src:000042,op:havoc,rep:2
│       ├── id:000066,src:000059+000065,op:splice,rep:2
│       ├── id:000067,src:000064+000065,op:splice,rep:4
│       ├── id:000068,src:000067,op:havoc,rep:2
│       ├── id:000069,src:000066,op:flip1,pos:15
│       ├── id:000070,src:000066,op:havoc,rep:2
│       ├── id:000071,src:000069+000019,op:splice,rep:4
│       ├── id:000072,src:000071,op:havoc,rep:2
│       └── id:000073,src:000072,op:flip1,pos:15
├── bin
│   └── spcheck
├── common.mk
├── images
│   ├── bmp2stif.py
│   ├── meme.bmp
│   ├── meme-grayscale.bmp
│   ├── meme-grayscale.stif
│   ├── meme.jpg
│   ├── meme.stif
│   ├── pixel-grayscale.stif
│   ├── pixel.stif
│   ├── test -> ../bin/spcheck
│   ├── troll.bmp
│   ├── troll-grayscale.bmp
│   ├── troll-grayscale.stif
│   ├── troll.jpg
│   └── troll.stif
├── include
│   └── stif.h
├── Makefile
├── obj
│   ├── regress
│   │   └── main.o
│   └── stif
│       └── stif.o
├── README.md
├── regress
│   ├── main.c
│   └── Makefile
└── src
    ├── Makefile
    ├── stif.c
    ├── stif.c.old
    └── stif.h
