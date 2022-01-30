opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 4 "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
	dw 0X3F3A ;#
	FNCALL	_main,_Lcd_Intialization
	FNCALL	_main,_Lcd_Command
	FNCALL	_main,_Lcd_String
	FNCALL	_main,_ADC
	FNCALL	_main,_divider
	FNCALL	_divider,___awmod
	FNCALL	_divider,___awdiv
	FNCALL	_divider,_Lcd_Data
	FNCALL	_Lcd_Intialization,_Lcd_Command
	FNCALL	_Lcd_String,_Lcd_Data
	FNROOT	_main
	global	_a
	global	_b
	global	_c
	global	_d
	global	_temp1
	global	_temp2
	global	_v
	global	_ADCON0
psect	text218,local,class=CODE,delta=2
global __ptext218
__ptext218:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTA
_PORTA	set	5
	global	_PORTD
_PORTD	set	8
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RD2
_RD2	set	66
	global	_RD3
_RD3	set	67
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISD
_TRISD	set	136
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_2:	
	retlw	80	;'P'
	retlw	49	;'1'
	retlw	32	;' '
	retlw	86	;'V'
	retlw	65	;'A'
	retlw	76	;'L'
	retlw	85	;'U'
	retlw	69	;'E'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_3:	
	retlw	80	;'P'
	retlw	50	;'2'
	retlw	32	;' '
	retlw	86	;'V'
	retlw	65	;'A'
	retlw	76	;'L'
	retlw	85	;'U'
	retlw	69	;'E'
	retlw	58	;':'
	retlw	0
psect	strings
	
STR_1:	
	retlw	76	;'L'
	retlw	89	;'Y'
	retlw	67	;'C'
	retlw	65	;'A'
	retlw	83	;'S'
	retlw	79	;'O'
	retlw	70	;'F'
	retlw	84	;'T'
	retlw	0
psect	strings
	file	"ADC.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_a:
       ds      2

_b:
       ds      2

_c:
       ds      2

_d:
       ds      2

_temp1:
       ds      2

_temp2:
       ds      2

_v:
       ds      2

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
	clrf	((__pbssBANK0)+11)&07Fh
	clrf	((__pbssBANK0)+12)&07Fh
	clrf	((__pbssBANK0)+13)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_Lcd_Command
?_Lcd_Command:	; 0 bytes @ 0x0
	global	??_Lcd_Command
??_Lcd_Command:	; 0 bytes @ 0x0
	global	?_Lcd_Data
?_Lcd_Data:	; 0 bytes @ 0x0
	global	??_Lcd_Data
??_Lcd_Data:	; 0 bytes @ 0x0
	global	?_Lcd_String
?_Lcd_String:	; 0 bytes @ 0x0
	global	?_Lcd_Intialization
?_Lcd_Intialization:	; 0 bytes @ 0x0
	global	?_ADC
?_ADC:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	ADC@Channel
ADC@Channel:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	2
	global	??_ADC
??_ADC:	; 0 bytes @ 0x2
	global	Lcd_Command@cmd
Lcd_Command@cmd:	; 1 bytes @ 0x2
	global	Lcd_Data@Data
Lcd_Data@Data:	; 1 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_Lcd_String
??_Lcd_String:	; 0 bytes @ 0x3
	global	??_Lcd_Intialization
??_Lcd_Intialization:	; 0 bytes @ 0x3
	ds	1
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	Lcd_String@Str
Lcd_String@Str:	; 1 bytes @ 0x4
	ds	1
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	2
	global	?_divider
?_divider:	; 0 bytes @ 0x9
	global	divider@x
divider@x:	; 2 bytes @ 0x9
	ds	2
	global	??_divider
??_divider:	; 0 bytes @ 0xB
	global	??_main
??_main:	; 0 bytes @ 0xB
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	divider@Dig1
divider@Dig1:	; 2 bytes @ 0x0
	ds	2
	global	divider@Dig2
divider@Dig2:	; 2 bytes @ 0x2
	ds	2
	global	divider@Dig3
divider@Dig3:	; 2 bytes @ 0x4
	ds	2
	global	divider@Dig4
divider@Dig4:	; 2 bytes @ 0x6
	ds	2
	global	divider@Temp
divider@Temp:	; 2 bytes @ 0x8
	ds	2
;;Data sizes: Strings 29, constant 0, data 0, bss 14, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     10      24
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; Lcd_String@Str	PTR const unsigned char  size(1) Largest target is 10
;;		 -> STR_3(CODE[10]), STR_2(CODE[10]), STR_1(CODE[9]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_divider
;;   _divider->___awdiv
;;   _Lcd_Intialization->_Lcd_Command
;;   _Lcd_String->_Lcd_Data
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_divider
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0    1088
;;                                             11 COMMON     3     3      0
;;                  _Lcd_Intialization
;;                        _Lcd_Command
;;                         _Lcd_String
;;                                _ADC
;;                            _divider
;; ---------------------------------------------------------------------------------
;; (1) _divider                                             12    10      2     889
;;                                              9 COMMON     2     0      2
;;                                              0 BANK0     10    10      0
;;                            ___awmod
;;                            ___awdiv
;;                           _Lcd_Data
;; ---------------------------------------------------------------------------------
;; (1) _Lcd_Intialization                                    0     0      0      44
;;                        _Lcd_Command
;; ---------------------------------------------------------------------------------
;; (1) _Lcd_String                                           2     2      0      89
;;                                              3 COMMON     2     2      0
;;                           _Lcd_Data
;; ---------------------------------------------------------------------------------
;; (2) _Lcd_Data                                             3     3      0      44
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _Lcd_Command                                          3     3      0      44
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (1) _ADC                                                  4     2      2      22
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Lcd_Intialization
;;     _Lcd_Command
;;   _Lcd_Command
;;   _Lcd_String
;;     _Lcd_Data
;;   _ADC
;;   _divider
;;     ___awmod
;;     ___awdiv
;;     _Lcd_Data
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      26       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      A      18       5       30.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      28      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 85 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Lcd_Intialization
;;		_Lcd_Command
;;		_Lcd_String
;;		_ADC
;;		_divider
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
	line	85
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	86
	
l3005:	
;ADC.c: 86: TRISA=0X03;
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	87
	
l3007:	
;ADC.c: 87: PORTA=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	88
	
l3009:	
;ADC.c: 88: TRISD=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	89
	
l3011:	
;ADC.c: 89: PORTD=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	91
	
l3013:	
;ADC.c: 91: ADCON0=0X01;
	movlw	(01h)
	movwf	(31)	;volatile
	line	92
	
l3015:	
;ADC.c: 92: ADCON1=0Xce;
	movlw	(0CEh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	94
	
l3017:	
;ADC.c: 94: Lcd_Intialization();
	fcall	_Lcd_Intialization
	line	95
	
l3019:	
;ADC.c: 95: _delay((unsigned long)((100)*(20e6/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	138
movwf	((??_main+0)+0+1),f
	movlw	86
movwf	((??_main+0)+0),f
u2517:
	decfsz	((??_main+0)+0),f
	goto	u2517
	decfsz	((??_main+0)+0+1),f
	goto	u2517
	decfsz	((??_main+0)+0+2),f
	goto	u2517
	nop2
opt asmopt_on

	line	97
	
l3021:	
;ADC.c: 97: Lcd_Command(0x80);
	movlw	(080h)
	fcall	_Lcd_Command
	line	98
	
l3023:	
;ADC.c: 98: Lcd_String("LYCASOFT");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_Lcd_String
	line	99
	
l3025:	
;ADC.c: 99: _delay((unsigned long)((1000)*(20e6/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	94
movwf	((??_main+0)+0+1),f
	movlw	134
movwf	((??_main+0)+0),f
u2527:
	decfsz	((??_main+0)+0),f
	goto	u2527
	decfsz	((??_main+0)+0+1),f
	goto	u2527
	decfsz	((??_main+0)+0+2),f
	goto	u2527
	clrwdt
opt asmopt_on

	line	100
	
l3027:	
;ADC.c: 100: Lcd_Command(0x80);
	movlw	(080h)
	fcall	_Lcd_Command
	line	101
	
l3029:	
;ADC.c: 101: Lcd_String("P1 VALUE:");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_Lcd_String
	line	102
	
l3031:	
;ADC.c: 102: Lcd_Command(0xc0);
	movlw	(0C0h)
	fcall	_Lcd_Command
	line	103
	
l3033:	
;ADC.c: 103: Lcd_String("P2 VALUE:");
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_Lcd_String
	goto	l3035
	line	105
;ADC.c: 105: while(1)
	
l725:	
	line	107
	
l3035:	
;ADC.c: 106: {
;ADC.c: 107: ADC(0);
	movlw	low(0)
	movwf	(?_ADC)
	movlw	high(0)
	movwf	((?_ADC))+1
	fcall	_ADC
	line	108
	
l3037:	
;ADC.c: 108: Lcd_Command(0x8A);
	movlw	(08Ah)
	fcall	_Lcd_Command
	line	109
	
l3039:	
;ADC.c: 109: divider(v);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_v+1),w
	clrf	(?_divider+1)
	addwf	(?_divider+1)
	movf	(_v),w
	clrf	(?_divider)
	addwf	(?_divider)

	fcall	_divider
	line	111
	
l3041:	
;ADC.c: 111: ADC(1);
	movlw	low(01h)
	movwf	(?_ADC)
	movlw	high(01h)
	movwf	((?_ADC))+1
	fcall	_ADC
	line	112
	
l3043:	
;ADC.c: 112: Lcd_Command(0xCA);
	movlw	(0CAh)
	fcall	_Lcd_Command
	line	113
	
l3045:	
;ADC.c: 113: divider(v);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_v+1),w
	clrf	(?_divider+1)
	addwf	(?_divider+1)
	movf	(_v),w
	clrf	(?_divider)
	addwf	(?_divider)

	fcall	_divider
	goto	l3035
	line	114
	
l726:	
	line	105
	goto	l3035
	
l727:	
	line	115
	
l728:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_divider
psect	text219,local,class=CODE,delta=2
global __ptext219
__ptext219:

;; *************** function _divider *****************
;; Defined at:
;;		line 60 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
;; Parameters:    Size  Location     Type
;;  x               2    9[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  Temp            2    8[BANK0 ] int 
;;  Dig4            2    6[BANK0 ] int 
;;  Dig3            2    4[BANK0 ] int 
;;  Dig2            2    2[BANK0 ] int 
;;  Dig1            2    0[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0      10       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2      10       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___awmod
;;		___awdiv
;;		_Lcd_Data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text219
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
	line	60
	global	__size_of_divider
	__size_of_divider	equ	__end_of_divider-_divider
	
_divider:	
	opt	stack 6
; Regs used in _divider: [wreg+status,2+status,0+pclath+cstack]
	line	63
	
l2983:	
;ADC.c: 61: int Temp,Dig1,Dig2,Dig3,Dig4;
;ADC.c: 63: Temp = x;
	movf	(divider@x+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Temp+1)
	addwf	(divider@Temp+1)
	movf	(divider@x),w
	clrf	(divider@Temp)
	addwf	(divider@Temp)

	line	64
	
l2985:	
;ADC.c: 64: Dig1 = Temp%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(divider@Temp+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(divider@Temp),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Dig1+1)
	addwf	(divider@Dig1+1)
	movf	(0+(?___awmod)),w
	clrf	(divider@Dig1)
	addwf	(divider@Dig1)

	line	65
	
l2987:	
;ADC.c: 65: Temp = Temp/10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(divider@Temp+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(divider@Temp),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Temp+1)
	addwf	(divider@Temp+1)
	movf	(0+(?___awdiv)),w
	clrf	(divider@Temp)
	addwf	(divider@Temp)

	line	66
	
l2989:	
;ADC.c: 66: Dig2 = Temp%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(divider@Temp+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(divider@Temp),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Dig2+1)
	addwf	(divider@Dig2+1)
	movf	(0+(?___awmod)),w
	clrf	(divider@Dig2)
	addwf	(divider@Dig2)

	line	67
	
l2991:	
;ADC.c: 67: Temp = Temp/10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(divider@Temp+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(divider@Temp),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Temp+1)
	addwf	(divider@Temp+1)
	movf	(0+(?___awdiv)),w
	clrf	(divider@Temp)
	addwf	(divider@Temp)

	line	68
	
l2993:	
;ADC.c: 68: Dig3 = Temp%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(divider@Temp+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(divider@Temp),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Dig3+1)
	addwf	(divider@Dig3+1)
	movf	(0+(?___awmod)),w
	clrf	(divider@Dig3)
	addwf	(divider@Dig3)

	line	69
	
l2995:	
;ADC.c: 69: Dig4 = Temp/10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(divider@Temp+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(divider@Temp),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(divider@Dig4+1)
	addwf	(divider@Dig4+1)
	movf	(0+(?___awdiv)),w
	clrf	(divider@Dig4)
	addwf	(divider@Dig4)

	line	71
	
l2997:	
;ADC.c: 71: Lcd_Data(Dig4+48);
	movf	(divider@Dig4),w
	addlw	030h
	fcall	_Lcd_Data
	line	72
	
l2999:	
;ADC.c: 72: Lcd_Data(Dig3+48);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(divider@Dig3),w
	addlw	030h
	fcall	_Lcd_Data
	line	73
	
l3001:	
;ADC.c: 73: Lcd_Data(Dig2+48);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(divider@Dig2),w
	addlw	030h
	fcall	_Lcd_Data
	line	74
	
l3003:	
;ADC.c: 74: Lcd_Data(Dig1+48);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(divider@Dig1),w
	addlw	030h
	fcall	_Lcd_Data
	line	75
	
l716:	
	return
	opt stack 0
GLOBAL	__end_of_divider
	__end_of_divider:
;; =============== function _divider ends ============

	signat	_divider,4216
	global	_Lcd_Intialization
psect	text220,local,class=CODE,delta=2
global __ptext220
__ptext220:

;; *************** function _Lcd_Intialization *****************
;; Defined at:
;;		line 53 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Lcd_Command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text220
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
	line	53
	global	__size_of_Lcd_Intialization
	__size_of_Lcd_Intialization	equ	__end_of_Lcd_Intialization-_Lcd_Intialization
	
_Lcd_Intialization:	
	opt	stack 6
; Regs used in _Lcd_Intialization: [wreg+status,2+status,0+pclath+cstack]
	line	54
	
l2981:	
;ADC.c: 54: Lcd_Command(0x02);
	movlw	(02h)
	fcall	_Lcd_Command
	line	55
;ADC.c: 55: Lcd_Command(0x28);
	movlw	(028h)
	fcall	_Lcd_Command
	line	56
;ADC.c: 56: Lcd_Command(0x0c);
	movlw	(0Ch)
	fcall	_Lcd_Command
	line	57
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_Lcd_Intialization
	__end_of_Lcd_Intialization:
;; =============== function _Lcd_Intialization ends ============

	signat	_Lcd_Intialization,88
	global	_Lcd_String
psect	text221,local,class=CODE,delta=2
global __ptext221
__ptext221:

;; *************** function _Lcd_String *****************
;; Defined at:
;;		line 45 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
;; Parameters:    Size  Location     Type
;;  Str             1    wreg     PTR const unsigned char 
;;		 -> STR_3(10), STR_2(10), STR_1(9), 
;; Auto vars:     Size  Location     Type
;;  Str             1    4[COMMON] PTR const unsigned char 
;;		 -> STR_3(10), STR_2(10), STR_1(9), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Lcd_Data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text221
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
	line	45
	global	__size_of_Lcd_String
	__size_of_Lcd_String	equ	__end_of_Lcd_String-_Lcd_String
	
_Lcd_String:	
	opt	stack 6
; Regs used in _Lcd_String: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;Lcd_String@Str stored from wreg
	movwf	(Lcd_String@Str)
	line	46
	
l2973:	
;ADC.c: 46: while(*Str != 0)
	goto	l2979
	
l708:	
	line	48
	
l2975:	
;ADC.c: 47: {
;ADC.c: 48: Lcd_Data(*Str++);
	movf	(Lcd_String@Str),w
	movwf	fsr0
	fcall	stringdir
	fcall	_Lcd_Data
	
l2977:	
	movlw	(01h)
	movwf	(??_Lcd_String+0)+0
	movf	(??_Lcd_String+0)+0,w
	addwf	(Lcd_String@Str),f
	goto	l2979
	line	49
	
l707:	
	line	46
	
l2979:	
	movf	(Lcd_String@Str),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2501
	goto	u2500
u2501:
	goto	l2975
u2500:
	goto	l710
	
l709:	
	line	50
	
l710:	
	return
	opt stack 0
GLOBAL	__end_of_Lcd_String
	__end_of_Lcd_String:
;; =============== function _Lcd_String ends ============

	signat	_Lcd_String,4216
	global	_Lcd_Data
psect	text222,local,class=CODE,delta=2
global __ptext222
__ptext222:

;; *************** function _Lcd_Data *****************
;; Defined at:
;;		line 30 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
;; Parameters:    Size  Location     Type
;;  Data            1    wreg     const unsigned char 
;; Auto vars:     Size  Location     Type
;;  Data            1    2[COMMON] const unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Lcd_String
;;		_divider
;; This function uses a non-reentrant model
;;
psect	text222
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
	line	30
	global	__size_of_Lcd_Data
	__size_of_Lcd_Data	equ	__end_of_Lcd_Data-_Lcd_Data
	
_Lcd_Data:	
	opt	stack 6
; Regs used in _Lcd_Data: [wreg+status,2+status,0]
;Lcd_Data@Data stored from wreg
	movwf	(Lcd_Data@Data)
	line	31
	
l2953:	
;ADC.c: 31: PORTD = (Data & 0XF0);
	movf	(Lcd_Data@Data),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	32
	
l2955:	
;ADC.c: 32: RD2 = 1;
	bsf	(66/8),(66)&7
	line	33
	
l2957:	
;ADC.c: 33: RD3 = 1;
	bsf	(67/8),(67)&7
	line	34
	
l2959:	
;ADC.c: 34: _delay((unsigned long)((5)*(20e6/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_Lcd_Data+0)+0+1),f
	movlw	118
movwf	((??_Lcd_Data+0)+0),f
u2537:
	decfsz	((??_Lcd_Data+0)+0),f
	goto	u2537
	decfsz	((??_Lcd_Data+0)+0+1),f
	goto	u2537
	clrwdt
opt asmopt_on

	line	35
	
l2961:	
;ADC.c: 35: RD3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(67/8),(67)&7
	line	37
	
l2963:	
;ADC.c: 37: PORTD = ((Data<<4) & 0xF0);
	movf	(Lcd_Data@Data),w
	movwf	(??_Lcd_Data+0)+0
	movlw	(04h)-1
u2495:
	clrc
	rlf	(??_Lcd_Data+0)+0,f
	addlw	-1
	skipz
	goto	u2495
	clrc
	rlf	(??_Lcd_Data+0)+0,w
	andlw	0F0h
	movwf	(8)	;volatile
	line	38
	
l2965:	
;ADC.c: 38: RD2 = 1;
	bsf	(66/8),(66)&7
	line	39
	
l2967:	
;ADC.c: 39: RD3 = 1;
	bsf	(67/8),(67)&7
	line	40
	
l2969:	
;ADC.c: 40: _delay((unsigned long)((5)*(20e6/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_Lcd_Data+0)+0+1),f
	movlw	118
movwf	((??_Lcd_Data+0)+0),f
u2547:
	decfsz	((??_Lcd_Data+0)+0),f
	goto	u2547
	decfsz	((??_Lcd_Data+0)+0+1),f
	goto	u2547
	clrwdt
opt asmopt_on

	line	41
	
l2971:	
;ADC.c: 41: RD3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(67/8),(67)&7
	line	42
	
l704:	
	return
	opt stack 0
GLOBAL	__end_of_Lcd_Data
	__end_of_Lcd_Data:
;; =============== function _Lcd_Data ends ============

	signat	_Lcd_Data,4216
	global	_Lcd_Command
psect	text223,local,class=CODE,delta=2
global __ptext223
__ptext223:

;; *************** function _Lcd_Command *****************
;; Defined at:
;;		line 15 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     const unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1    2[COMMON] const unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Lcd_Intialization
;;		_main
;; This function uses a non-reentrant model
;;
psect	text223
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
	line	15
	global	__size_of_Lcd_Command
	__size_of_Lcd_Command	equ	__end_of_Lcd_Command-_Lcd_Command
	
_Lcd_Command:	
	opt	stack 7
; Regs used in _Lcd_Command: [wreg+status,2+status,0]
;Lcd_Command@cmd stored from wreg
	movwf	(Lcd_Command@cmd)
	line	16
	
l2933:	
;ADC.c: 16: PORTD = (cmd & 0XF0);
	movf	(Lcd_Command@cmd),w
	andlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	17
	
l2935:	
;ADC.c: 17: RD2 = 0;
	bcf	(66/8),(66)&7
	line	18
	
l2937:	
;ADC.c: 18: RD3 = 1;
	bsf	(67/8),(67)&7
	line	19
	
l2939:	
;ADC.c: 19: _delay((unsigned long)((5)*(20e6/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_Lcd_Command+0)+0+1),f
	movlw	118
movwf	((??_Lcd_Command+0)+0),f
u2557:
	decfsz	((??_Lcd_Command+0)+0),f
	goto	u2557
	decfsz	((??_Lcd_Command+0)+0+1),f
	goto	u2557
	clrwdt
opt asmopt_on

	line	20
	
l2941:	
;ADC.c: 20: RD3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(67/8),(67)&7
	line	22
	
l2943:	
;ADC.c: 22: PORTD = ((cmd<<4) & 0xF0);
	movf	(Lcd_Command@cmd),w
	movwf	(??_Lcd_Command+0)+0
	movlw	(04h)-1
u2485:
	clrc
	rlf	(??_Lcd_Command+0)+0,f
	addlw	-1
	skipz
	goto	u2485
	clrc
	rlf	(??_Lcd_Command+0)+0,w
	andlw	0F0h
	movwf	(8)	;volatile
	line	23
	
l2945:	
;ADC.c: 23: RD2 = 0;
	bcf	(66/8),(66)&7
	line	24
	
l2947:	
;ADC.c: 24: RD3 = 1;
	bsf	(67/8),(67)&7
	line	25
	
l2949:	
;ADC.c: 25: _delay((unsigned long)((5)*(20e6/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_Lcd_Command+0)+0+1),f
	movlw	118
movwf	((??_Lcd_Command+0)+0),f
u2567:
	decfsz	((??_Lcd_Command+0)+0),f
	goto	u2567
	decfsz	((??_Lcd_Command+0)+0+1),f
	goto	u2567
	clrwdt
opt asmopt_on

	line	26
	
l2951:	
;ADC.c: 26: RD3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(67/8),(67)&7
	line	27
	
l701:	
	return
	opt stack 0
GLOBAL	__end_of_Lcd_Command
	__end_of_Lcd_Command:
;; =============== function _Lcd_Command ends ============

	signat	_Lcd_Command,4216
	global	___awmod
psect	text224,local,class=CODE,delta=2
global __ptext224
__ptext224:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_divider
;; This function uses a non-reentrant model
;;
psect	text224
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l2899:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u2391
	goto	u2390
u2391:
	goto	l2903
u2390:
	line	10
	
l2901:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l2903
	line	12
	
l1619:	
	line	13
	
l2903:	
	btfss	(___awmod@divisor+1),7
	goto	u2401
	goto	u2400
u2401:
	goto	l2907
u2400:
	line	14
	
l2905:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l2907
	
l1620:	
	line	15
	
l2907:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2411
	goto	u2410
u2411:
	goto	l2925
u2410:
	line	16
	
l2909:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l2915
	
l1623:	
	line	18
	
l2911:	
	movlw	01h
	
u2425:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2425
	line	19
	
l2913:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l2915
	line	20
	
l1622:	
	line	17
	
l2915:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2431
	goto	u2430
u2431:
	goto	l2911
u2430:
	goto	l2917
	
l1624:	
	goto	l2917
	line	21
	
l1625:	
	line	22
	
l2917:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2445
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2445:
	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l2921
u2440:
	line	23
	
l2919:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l2921
	
l1626:	
	line	24
	
l2921:	
	movlw	01h
	
u2455:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2455
	line	25
	
l2923:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2461
	goto	u2460
u2461:
	goto	l2917
u2460:
	goto	l2925
	
l1627:	
	goto	l2925
	line	26
	
l1621:	
	line	27
	
l2925:	
	movf	(___awmod@sign),w
	skipz
	goto	u2470
	goto	l2929
u2470:
	line	28
	
l2927:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l2929
	
l1628:	
	line	29
	
l2929:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l1629
	
l2931:	
	line	30
	
l1629:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text225,local,class=CODE,delta=2
global __ptext225
__ptext225:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] int 
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_divider
;; This function uses a non-reentrant model
;;
psect	text225
	file	"C:\Program Files\HI-TECH Software\PICC\9.83\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l2859:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2291
	goto	u2290
u2291:
	goto	l2863
u2290:
	line	11
	
l2861:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l2863
	line	13
	
l1551:	
	line	14
	
l2863:	
	btfss	(___awdiv@dividend+1),7
	goto	u2301
	goto	u2300
u2301:
	goto	l2869
u2300:
	line	15
	
l2865:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l2867:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l2869
	line	17
	
l1552:	
	line	18
	
l2869:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l2871:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2311
	goto	u2310
u2311:
	goto	l2891
u2310:
	line	20
	
l2873:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l2879
	
l1555:	
	line	22
	
l2875:	
	movlw	01h
	
u2325:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2325
	line	23
	
l2877:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l2879
	line	24
	
l1554:	
	line	21
	
l2879:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l2875
u2330:
	goto	l2881
	
l1556:	
	goto	l2881
	line	25
	
l1557:	
	line	26
	
l2881:	
	movlw	01h
	
u2345:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2345
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2355
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2355:
	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l2887
u2350:
	line	28
	
l2883:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l2885:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l2887
	line	30
	
l1558:	
	line	31
	
l2887:	
	movlw	01h
	
u2365:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2365
	line	32
	
l2889:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2371
	goto	u2370
u2371:
	goto	l2881
u2370:
	goto	l2891
	
l1559:	
	goto	l2891
	line	33
	
l1553:	
	line	34
	
l2891:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2380
	goto	l2895
u2380:
	line	35
	
l2893:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l2895
	
l1560:	
	line	36
	
l2895:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l1561
	
l2897:	
	line	37
	
l1561:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	_ADC
psect	text226,local,class=CODE,delta=2
global __ptext226
__ptext226:

;; *************** function _ADC *****************
;; Defined at:
;;		line 78 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
;; Parameters:    Size  Location     Type
;;  Channel         2    0[COMMON] int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text226
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\23-ADC CHANNEL\CODE\ADC.c"
	line	78
	global	__size_of_ADC
	__size_of_ADC	equ	__end_of_ADC-_ADC
	
_ADC:	
	opt	stack 7
; Regs used in _ADC: [wreg+status,2+status,0+btemp+1]
	line	79
	
l2853:	
;ADC.c: 79: while((ADCON0=0X05|(Channel<<3))==1);
	goto	l2855
	
l720:	
	goto	l2855
	
l719:	
	
l2855:	
	movf	(ADC@Channel),w
	movwf	(??_ADC+0)+0
	movlw	(03h)-1
u2275:
	clrc
	rlf	(??_ADC+0)+0,f
	addlw	-1
	skipz
	goto	u2275
	clrc
	rlf	(??_ADC+0)+0,w
	iorlw	05h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	xorlw	01h
	skipnz
	goto	u2281
	goto	u2280
u2281:
	goto	l2855
u2280:
	goto	l2857
	
l721:	
	line	81
	
l2857:	
;ADC.c: 81: v=(ADRESH<<8)+ADRESL;
	movf	(30),w	;volatile
	movwf	(??_ADC+0)+0
	clrf	(??_ADC+0)+0+1
	movf	(??_ADC+0)+0,w
	movwf	(??_ADC+0)+1
	clrf	(??_ADC+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	addwf	0+(??_ADC+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_v)
	movlw	0
	skipnc
	movlw	1
	addwf	1+(??_ADC+0)+0,w
	movwf	1+(_v)
	line	82
	
l722:	
	return
	opt stack 0
GLOBAL	__end_of_ADC
	__end_of_ADC:
;; =============== function _ADC ends ============

	signat	_ADC,4216
psect	text227,local,class=CODE,delta=2
global __ptext227
__ptext227:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
