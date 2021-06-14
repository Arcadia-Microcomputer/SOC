EESchema Schematic File Version 4
LIBS:CPUSchem-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CPUSchem:IMM_GEN U?
U 1 1 5EBA30B4
P 5275 2825
F 0 "U?" H 5125 3025 39  0001 C CNN
F 1 "IMM_GEN" H 5200 2950 39  0000 C CNN
F 2 "" H 5225 2800 39  0001 C CNN
F 3 "" H 5225 2800 39  0001 C CNN
	1    5275 2825
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2775 5625 2775
Wire Wire Line
	5325 1750 5325 1700
Connection ~ 5325 1700
Wire Wire Line
	5325 1750 5325 1800
Connection ~ 5325 1750
Connection ~ 5325 1800
Wire Wire Line
	5325 1800 5325 1850
Wire Wire Line
	5325 1650 5325 1600
Connection ~ 5325 1650
Text Label 5625 3100 2    31   ~ 0
RS1Addr_D
Text Label 5625 3025 2    31   ~ 0
RS2Addr_D
Text Label 5625 3175 2    31   ~ 0
RDAddr_D
Text Label 5825 2775 0    31   ~ 0
Imm_EX1
$Comp
L CPUSchem:DECODER U?
U 1 1 5EBA30F0
P 5250 1825
F 0 "U?" H 5250 1975 39  0001 C CNN
F 1 "DECODER" H 4925 2075 39  0000 C CNN
F 2 "" H 5250 1925 39  0001 C CNN
F 3 "" H 5250 1925 39  0001 C CNN
	1    5250 1825
	1    0    0    -1  
$EndComp
Text Label 5825 3100 0    31   ~ 0
RS1Addr_EX1
Text Label 5825 3025 0    31   ~ 0
RS2Addr_EX1
Text Label 7425 4100 2    31   ~ 0
RS2Addr_EX1
Text Label 5825 3175 0    31   ~ 0
RDAddr_EX1
Text Label 5825 1350 0    31   ~ 0
WBSrc_EX1
Wire Wire Line
	5325 1600 5325 1550
Connection ~ 5325 1600
Connection ~ 5325 1550
Wire Wire Line
	5325 1550 5325 1500
Wire Wire Line
	5325 1700 5325 1650
Text Label 7425 4325 2    31   ~ 0
RDAddr_EX2
Wire Wire Line
	5275 1650 5325 1650
Wire Wire Line
	5825 2775 6225 2775
Wire Wire Line
	5325 1500 5625 1500
Wire Wire Line
	5325 1550 5625 1550
Wire Wire Line
	5325 1650 5625 1650
Wire Wire Line
	5325 1750 5625 1750
Wire Wire Line
	5325 1850 5625 1850
Wire Wire Line
	5325 1600 5625 1600
Wire Wire Line
	5325 1700 5625 1700
Wire Wire Line
	5325 1800 5625 1800
Text Label 5700 3350 3    31   ~ 0
En_E
Text Label 5750 3350 3    31   ~ 0
Clr_E
Text Label 5825 2050 0    31   ~ 0
PC_EX1
Wire Wire Line
	5325 1850 5325 1900
Wire Wire Line
	5325 1900 5625 1900
Connection ~ 5325 1850
Wire Wire Line
	5325 1900 5325 1950
Wire Wire Line
	5325 1950 5625 1950
Connection ~ 5325 1900
Text Label 5625 1950 2    31   ~ 0
RS1Valid_ID
Text Label 5625 1900 2    31   ~ 0
RS2Valid_ID
Text Label 7425 4400 2    31   ~ 0
RegWrEn_EX2
Text Label 5825 1550 0    31   ~ 0
Func3_EX1
$Comp
L CPUSchem:2-1Mux U?
U 1 1 5EADDABA
P 6150 2450
F 0 "U?" H 6175 2775 50  0001 C CNN
F 1 "2-1Mux" H 6150 2600 50  0001 C CNN
F 2 "" H 6175 2775 50  0001 C CNN
F 3 "" H 6175 2775 50  0001 C CNN
	1    6150 2450
	1    0    0    -1  
$EndComp
Text Label 6100 2475 2    31   ~ 0
AluRes_M
Wire Wire Line
	5825 2425 6100 2425
Text Label 6200 2450 0    31   ~ 0
Rs2For_E
Text Label 1900 3000 2    39   ~ 0
4
Wire Wire Line
	4275 1825 4625 1825
Wire Wire Line
	4625 1900 4275 1900
Text Label 4300 1900 0    31   ~ 0
Inst[24:20]
Text Label 4300 1825 0    31   ~ 0
Inst[19:15]
Connection ~ 3025 3150
Wire Wire Line
	3025 2050 3250 2050
Wire Wire Line
	3025 2050 3025 2825
$Comp
L CPUSchem:PC U?
U 1 1 5EBA30C0
P 2800 3325
F 0 "U?" H 2750 3475 50  0001 C CNN
F 1 "PC" H 2625 3575 39  0000 C CNN
F 2 "" H 2625 3525 50  0001 C CNN
F 3 "" H 2625 3525 50  0001 C CNN
	1    2800 3325
	1    0    0    -1  
$EndComp
Wire Wire Line
	4275 1650 4275 1825
Text Label 1700 3475 2    31   ~ 0
PC_EX2
Connection ~ 4275 1900
Connection ~ 4275 1825
Wire Wire Line
	4275 1825 4275 1900
Wire Wire Line
	4275 1900 4275 1975
Text Label 4300 1975 0    31   ~ 0
Inst[11:7]
Wire Wire Line
	4275 1975 4625 1975
Connection ~ 4275 1975
Wire Wire Line
	4275 1975 4275 2400
Text Label 4925 4125 0    31   ~ 0
PcEn_PC
Text Label 3800 4200 2    31   ~ 0
RS1Addr_ID
Text Label 3800 4350 2    31   ~ 0
RS2Addr_ID
Text Label 3800 4450 2    31   ~ 0
RDAddr_EX1
Text Label 3800 5025 2    31   ~ 0
IsBranch_EX2
$Comp
L CPUSchem:BRANCH_UNIT U?
U 1 1 5EBA312E
P 1725 2500
F 0 "U?" H 1625 2875 31  0001 C CNN
F 1 "BRANCH_UNIT" H 1425 2700 39  0000 C CNN
F 2 "" H 1625 2875 31  0001 C CNN
F 3 "" H 1625 2875 31  0001 C CNN
	1    1725 2500
	1    0    0    -1  
$EndComp
Text Label 1200 2525 2    31   ~ 0
Func3_EX2
Text Label 1200 2450 2    31   ~ 0
IsBranch_EX2
Text Label 2200 2375 0    31   ~ 0
TakeBranch_EX2
Text Label 3800 5100 2    31   ~ 0
TakeBranch
Text Label 4925 4525 0    31   ~ 0
En_EX1
Text Label 4925 4925 0    31   ~ 0
Clr_EX1
Text Label 4925 4450 0    31   ~ 0
En_ID
Text Label 4925 4850 0    31   ~ 0
Clr_ID
Text Label 4925 4600 0    31   ~ 0
En_EX2
Text Label 4925 5000 0    31   ~ 0
Clr_EX2
Text Label 2550 3150 2    31   ~ 0
PcEn_PC
$Comp
L CPUSchem:HAZARD_UNIT U?
U 1 1 5EBA3150
P 4200 4275
AR Path="/5EBA3150" Ref="U?"  Part="1" 
AR Path="/5EB97B98/5EBA3150" Ref="U?"  Part="1" 
F 0 "U?" H 4100 4650 31  0001 C CNN
F 1 "HAZARD_UNIT" H 4025 4500 39  0000 C CNN
F 2 "" H 4100 4650 31  0001 C CNN
F 3 "" H 4100 4650 31  0001 C CNN
	1    4200 4275
	1    0    0    -1  
$EndComp
Text Label 1200 2600 2    31   ~ 0
AluZero_EX2
Text Label 3800 4525 2    31   ~ 0
RDAddr_EX2
Wire Wire Line
	3100 3150 3025 3150
Text Label 4925 4200 0    31   ~ 0
IBusRdEn_ID
Text Label 4925 4275 0    31   ~ 0
IBusOZero_ID
$Comp
L CPUSchem:ADDER U?
U 1 1 5EBA3168
P 1975 3050
F 0 "U?" H 1950 3300 50  0001 C CNN
F 1 "PC_ADDER" H 1975 3200 39  0000 C CNN
F 2 "" H 2125 3075 50  0001 C CNN
F 3 "" H 2125 3075 50  0001 C CNN
	1    1975 3050
	1    0    0    -1  
$EndComp
$Comp
L CPUSchem:ADDER U?
U 1 1 5EBA316E
P 1975 3375
F 0 "U?" H 1950 3625 50  0001 C CNN
F 1 "BRANCH_ADDER" H 1950 3500 39  0000 C CNN
F 2 "" H 2125 3400 50  0001 C CNN
F 3 "" H 2125 3400 50  0001 C CNN
	1    1975 3375
	1    0    0    -1  
$EndComp
$Comp
L CPUSchem:2-1Mux U?
U 1 1 5EBA3174
P 2275 3225
F 0 "U?" H 2300 3550 50  0001 C CNN
F 1 "2-1Mux" H 2275 3375 50  0001 C CNN
F 2 "" H 2300 3550 50  0001 C CNN
F 3 "" H 2300 3550 50  0001 C CNN
	1    2275 3225
	1    0    0    -1  
$EndComp
Wire Wire Line
	2175 3200 2225 3200
Wire Wire Line
	2175 3375 2175 3250
Wire Wire Line
	2175 3250 2225 3250
Wire Wire Line
	2275 3125 2275 2375
Text Label 1900 3325 2    31   ~ 0
Imm_EX2
Wire Wire Line
	2200 2375 2275 2375
Text Label 1200 2675 2    31   ~ 0
AluSignNeg_EX2
Text Label 3800 4275 2    31   ~ 0
RS2Valid_ID
Text Label 3800 4125 2    31   ~ 0
RS1Valid_ID
Wire Wire Line
	4275 2775 5025 2775
Text Label 4625 1825 0    31   ~ 0
RS1Addr_ID
Text Label 4625 1900 0    31   ~ 0
RS2Addr_ID
Text Label 4625 1975 0    31   ~ 0
RDAddr_ID
Text Label 8500 4025 0    31   ~ 0
Rs1ForSel_EX1
Text Label 4625 2200 2    31   ~ 0
RS1_ID
Text Label 4625 2275 2    31   ~ 0
RS2_ID
$Comp
L CPUSchem:REGFILE U?
U 1 1 5EBA30AE
P 4975 2400
F 0 "U?" H 4850 2800 50  0001 C CNN
F 1 "REGFILE" H 4775 2700 39  0000 C CNN
F 2 "" H 4800 2525 50  0001 C CNN
F 3 "" H 4800 2525 50  0001 C CNN
	1    4975 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 2225 5625 2225
Wire Wire Line
	5600 2425 5625 2425
Wire Wire Line
	5825 2225 5850 2225
Text Label 5825 1650 0    31   ~ 0
IsBranch_EX1
Text Label 3800 4700 2    31   ~ 0
DBusRe_EX1
Wire Wire Line
	5325 1500 5325 1450
Wire Wire Line
	5325 1450 5625 1450
Connection ~ 5325 1500
Text Label 5825 1600 0    31   ~ 0
IsJump_EX1
Text Label 1200 2375 2    31   ~ 0
IsJump_EX2
Wire Wire Line
	2050 3050 2175 3050
Wire Wire Line
	2050 3375 2175 3375
Wire Wire Line
	2175 3050 2175 3200
Wire Wire Line
	5850 2125 5850 2225
Text Label 6825 2150 2    31   ~ 0
A_EX1
Wire Wire Line
	6300 2150 6825 2150
Wire Wire Line
	5850 2125 6200 2125
Text Label 6200 2175 2    31   ~ 0
AluRes_M
Wire Wire Line
	6225 2500 6225 2775
Text Label 6825 2500 2    31   ~ 0
B_EX1
Wire Wire Line
	6225 2500 6550 2500
$Comp
L CPUSchem:2-1Mux U?
U 1 1 5EBA3184
P 6600 2475
F 0 "U?" H 6625 2800 50  0001 C CNN
F 1 "2-1Mux" H 6600 2625 50  0001 C CNN
F 2 "" H 6625 2800 50  0001 C CNN
F 3 "" H 6625 2800 50  0001 C CNN
	1    6600 2475
	1    0    0    -1  
$EndComp
$Comp
L CPUSchem:2-1Mux U?
U 1 1 5EC4C00F
P 1750 3500
F 0 "U?" H 1775 3825 50  0001 C CNN
F 1 "2-1Mux" H 1750 3650 50  0001 C CNN
F 2 "" H 1775 3825 50  0001 C CNN
F 3 "" H 1775 3825 50  0001 C CNN
	1    1750 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3500 1850 3500
Wire Wire Line
	1850 3500 1850 3425
Wire Wire Line
	1850 3425 1900 3425
Wire Wire Line
	6200 2450 6550 2450
Wire Wire Line
	6650 2475 6675 2475
Wire Wire Line
	6675 2475 6675 2500
Wire Wire Line
	6675 2500 6825 2500
$Comp
L CPUSchem:ALU U?
U 1 1 5EBA318F
P 6925 2325
F 0 "U?" H 7000 2575 50  0001 C CNN
F 1 "ALU" H 6925 2600 39  0000 C CNN
F 2 "" H 7000 2575 50  0001 C CNN
F 3 "" H 7000 2575 50  0001 C CNN
	1    6925 2325
	1    0    0    -1  
$EndComp
Text Label 8500 4100 0    31   ~ 0
Rs2ForSel_EX1
Text Label 8500 4175 0    31   ~ 0
Rs1ForSel_EX2
Text Label 6375 2150 0    31   ~ 0
Rs1For_EX1
Wire Wire Line
	5625 1400 5325 1400
Wire Wire Line
	5325 1400 5325 1450
Connection ~ 5325 1450
Text Label 1750 3400 2    31   ~ 0
BranchAdderBSel_EX2
Text Label 1700 3525 2    31   ~ 0
Rs1For_EX2
Text Label 7425 4175 2    31   ~ 0
RS1Addr_EX2
Text Label 4625 2400 2    31   ~ 0
RegWrEn_WB
Text Label 4625 2475 2    31   ~ 0
RDAddr_WB
Text Label 4625 2550 2    31   ~ 0
WBData_WB
Wire Wire Line
	5625 1350 5325 1350
Wire Wire Line
	5325 1350 5325 1400
Connection ~ 5325 1400
Text Label 4925 5075 0    31   ~ 0
Clr_WB
Text Label 4925 4675 0    31   ~ 0
En_WB
Text Label 8500 4250 0    31   ~ 0
Rs2ForSel_EX2
Text Label 6250 2050 0    31   ~ 0
Rs1ForSel_EX1
$Comp
L CPUSchem:2-1Mux U?
U 1 1 5EADD59E
P 6250 2150
F 0 "U?" H 6275 2475 50  0001 C CNN
F 1 "2-1Mux" H 6250 2300 50  0001 C CNN
F 2 "" H 6275 2475 50  0001 C CNN
F 3 "" H 6275 2475 50  0001 C CNN
	1    6250 2150
	1    0    0    -1  
$EndComp
$Comp
L CPUSchem:2-1Mux U?
U 1 1 5ED695AC
P 5550 2225
F 0 "U?" H 5575 2550 50  0001 C CNN
F 1 "2-1Mux" H 5550 2375 50  0001 C CNN
F 2 "" H 5575 2550 50  0001 C CNN
F 3 "" H 5575 2550 50  0001 C CNN
	1    5550 2225
	1    0    0    -1  
$EndComp
$Comp
L CPUSchem:2-1Mux U?
U 1 1 5ED6DABA
P 5550 2450
F 0 "U?" H 5575 2775 50  0001 C CNN
F 1 "2-1Mux" H 5550 2600 50  0001 C CNN
F 2 "" H 5575 2775 50  0001 C CNN
F 3 "" H 5575 2775 50  0001 C CNN
	1    5550 2450
	1    0    0    -1  
$EndComp
Text Label 5550 2125 2    31   ~ 0
Rs1ForSel_ID
Text Label 5550 2350 2    31   ~ 0
Rs2ForSel_ID
Wire Wire Line
	5600 2450 5600 2425
Wire Wire Line
	5250 2425 5500 2425
Wire Wire Line
	5250 2200 5500 2200
Text Label 5500 2250 2    31   ~ 0
AluRes_EX2
Text Label 5500 2475 2    31   ~ 0
AluRes_EX2
Text Label 7425 4025 2    31   ~ 0
RS1Addr_EX1
Text Label 7425 4250 2    31   ~ 0
RS2Addr_EX2
Text Label 7425 3875 2    31   ~ 0
RS1Addr_ID
Text Label 7425 3950 2    31   ~ 0
RS2Addr_ID
Text Label 6600 2375 2    31   ~ 0
AluBSel_EX1
$Comp
L CPUSchem:LOAD_UPPER U?
U 1 1 5EB59563
P 6925 2850
F 0 "U?" H 7100 3125 50  0001 C CNN
F 1 "LOAD_UPPER" H 6925 3050 39  0000 C CNN
F 2 "" H 7100 3125 50  0001 C CNN
F 3 "" H 7100 3125 50  0001 C CNN
	1    6925 2850
	1    0    0    -1  
$EndComp
Text Label 6675 2800 2    31   ~ 0
PC_EX1
Wire Wire Line
	6675 2875 6225 2875
Wire Wire Line
	6225 2875 6225 2775
Connection ~ 6225 2775
Wire Wire Line
	5625 1300 5325 1300
Wire Wire Line
	5325 1300 5325 1350
Connection ~ 5325 1350
Text Label 3800 4600 2    31   ~ 0
RDAddr_WB
Text Label 3800 4775 2    31   ~ 0
DBusRe_EX2
Text Label 3800 4850 2    31   ~ 0
DBusRe_WB
Text Label 5825 1800 0    31   ~ 0
AluBSel_EX1
Text Label 5825 1850 0    31   ~ 0
LoadUpperOp_EX1
Text Label 6675 2725 2    31   ~ 0
LoadUpperOp_EX1
Text Label 5825 1700 0    31   ~ 0
ExeResSel_EX1
Text Label 3325 3325 3    31   ~ 0
IBusRdEn_ID
Text Label 3375 3325 3    31   ~ 0
IBusOZero_ID
Wire Wire Line
	5825 1750 7050 1750
Wire Wire Line
	7050 1750 7050 2150
Text Label 5825 1400 0    31   ~ 0
DBusRe_EX1
Wire Wire Line
	5625 2050 4150 2050
Text Label 3325 2750 3    31   ~ 0
En_IF
Text Label 3375 2750 3    31   ~ 0
Clr_IF
Text Notes 1750 1100 0    118  ~ 0
PC
Text Notes 3650 1100 0    118  ~ 0
IF
$Comp
L CPUSchem:PC_IF U?
U 1 1 5FE8DDFD
P 3350 2300
F 0 "U?" H 3350 2975 50  0001 C CNN
F 1 "PC_IF" H 3350 3325 39  0000 C CNN
F 2 "" H 3375 2425 50  0001 C CNN
F 3 "" H 3375 2425 50  0001 C CNN
	1    3350 2300
	1    0    0    -1  
$EndComp
$Comp
L CPUSchem:ICache U?
U 1 1 5FED08D9
P 3300 3175
F 0 "U?" H 3025 3400 50  0001 C CNN
F 1 "ICache" H 3250 3275 39  0000 C CNN
F 2 "" H 2975 3325 50  0001 C CNN
F 3 "" H 2975 3325 50  0001 C CNN
	1    3300 3175
	1    0    0    -1  
$EndComp
Text Notes 4775 1100 0    118  ~ 0
ID
$Comp
L CPUSchem:IF_ID U?
U 1 1 5FF4206C
P 4050 2300
F 0 "U?" H 4050 2975 50  0001 C CNN
F 1 "IF_ID" H 4050 3325 39  0000 C CNN
F 2 "" H 4075 1800 50  0001 C CNN
F 3 "" H 4075 1800 50  0001 C CNN
	1    4050 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 3150 3750 2400
Wire Wire Line
	3750 2400 3950 2400
Wire Wire Line
	3450 2050 3950 2050
Text Label 4025 2750 3    31   ~ 0
En_ID
Text Label 4075 2750 3    31   ~ 0
Clr_ID
Text Label 4925 4375 0    31   ~ 0
En_IF
Text Label 4925 4775 0    31   ~ 0
Clr_IF
Wire Wire Line
	4150 2400 4275 2400
Wire Wire Line
	4275 2400 4275 2775
$Comp
L CPUSchem:ID_EX1 U?
U 1 1 5FFFFFF7
P 5725 1925
F 0 "U?" H 5750 2725 50  0001 C CNN
F 1 "ID_EX1" H 5725 2650 39  0000 C CNN
F 2 "" H 5750 1650 50  0001 C CNN
F 3 "" H 5750 1650 50  0001 C CNN
	1    5725 1925
	1    0    0    -1  
$EndComp
Text Label 6150 2350 2    31   ~ 0
Rs2ForSel_EX1
Text Label 3800 4950 2    31   ~ 0
IsBranch_EX1
Text Notes 6600 1100 0    118  ~ 0
EX1
Connection ~ 8550 2450
Wire Wire Line
	9550 2450 8550 2450
Wire Wire Line
	8175 2450 8550 2450
Wire Wire Line
	10350 1775 10350 2375
Wire Wire Line
	7950 1300 7950 1400
Wire Wire Line
	7900 1350 7900 1450
Wire Wire Line
	7775 1400 7775 1500
Wire Wire Line
	7725 1450 7725 1550
Wire Wire Line
	7625 1500 7625 1600
Wire Wire Line
	7575 1550 7575 1650
Wire Wire Line
	7525 1600 7525 1700
Wire Wire Line
	7475 1650 7475 1750
Wire Wire Line
	10475 1450 10475 1550
Wire Wire Line
	8175 1500 9825 1500
Wire Wire Line
	8175 1450 9825 1450
Wire Wire Line
	8175 1400 9825 1400
Wire Wire Line
	7975 1450 7900 1450
Wire Wire Line
	7950 1400 7975 1400
Wire Wire Line
	8550 2450 8550 2600
Wire Wire Line
	8575 1900 8575 1975
Wire Wire Line
	8575 2050 8575 2150
Wire Wire Line
	8175 2050 8575 2050
Text Label 7700 2350 2    31   ~ 0
ExeResSel_EX1
Wire Wire Line
	7200 2325 7275 2325
Wire Wire Line
	7175 2725 7275 2725
$Comp
L CPUSchem:2-1Mux U?
U 1 1 5EB931AF
P 7700 2450
F 0 "U?" H 7725 2775 50  0001 C CNN
F 1 "2-1Mux" H 7700 2600 50  0001 C CNN
F 2 "" H 7725 2775 50  0001 C CNN
F 3 "" H 7725 2775 50  0001 C CNN
	1    7700 2450
	1    0    0    -1  
$EndComp
Text Label 10025 1500 0    31   ~ 0
DBusRe_WB
Text Label 8175 1500 0    31   ~ 0
DBusRe_EX2
Text Label 8175 1550 0    31   ~ 0
DBusWe_EX2
Text Label 8175 2600 0    31   ~ 0
RS2Addr_EX2
Text Label 7975 2600 2    31   ~ 0
RS2Addr_EX1
Text Label 8500 3875 0    31   ~ 0
Rs1ForSel_ID
Text Label 7375 2425 0    31   ~ 0
AluRes_EX1
Wire Wire Line
	8175 1975 8575 1975
Connection ~ 8550 2600
Wire Wire Line
	8550 2600 8600 2600
Wire Wire Line
	8550 2700 8550 2600
Wire Wire Line
	8550 2700 8675 2700
Text Label 8675 2700 0    31   ~ 0
ExeSignNeg_EX2
Text Label 8550 2700 0    28   ~ 0
[31]
$Comp
L CPUSchem:0Comparator U?
U 1 1 5EBA31D6
P 8675 2600
F 0 "U?" H 8875 2875 31  0001 C CNN
F 1 "0Comparator" H 8700 2850 39  0001 C CNN
F 2 "" H 8875 2875 31  0001 C CNN
F 3 "" H 8875 2875 31  0001 C CNN
	1    8675 2600
	1    0    0    1   
$EndComp
Text Label 8750 2600 0    31   ~ 0
ExeZero_EX2
Text Label 9550 2675 2    31   ~ 0
Rs2For_EX2
Text Label 9025 1925 0    31   ~ 0
Rs2For_EX2
Text Label 8975 1825 2    31   ~ 0
Rs2ForSel_EX2
$Comp
L CPUSchem:2-1Mux U?
U 1 1 5ED0AAB6
P 8975 1925
F 0 "U?" H 9000 2250 50  0001 C CNN
F 1 "2-1Mux" H 8975 2075 50  0001 C CNN
F 2 "" H 9000 2250 50  0001 C CNN
F 3 "" H 9000 2250 50  0001 C CNN
	1    8975 1925
	1    0    0    -1  
$EndComp
Text Label 7975 1975 2    31   ~ 0
Rs2For_EX1
Text Label 9950 2000 3    31   ~ 0
Clr_WB
Text Label 9900 2000 3    31   ~ 0
En_WB
Text Label 10025 1875 0    31   ~ 0
RDAddr_WB
Text Label 9825 1875 2    31   ~ 0
RDAddr_EX2
Wire Wire Line
	10025 1450 10475 1450
Wire Wire Line
	10350 1775 10400 1775
Wire Wire Line
	10025 1700 10400 1700
Wire Wire Line
	10025 1625 10400 1625
Text Label 9825 1700 2    31   ~ 0
ExeRes_EX2
Text Label 9825 1625 2    31   ~ 0
PC_Plus4_EX2
Text Label 10025 1450 0    31   ~ 0
WBSrc_WB
Text Label 8175 1450 0    31   ~ 0
WBSrc_EX2
Text Label 8175 2675 0    31   ~ 0
RS1Addr_EX2
Text Label 7975 2675 2    31   ~ 0
RS1Addr_EX1
Text Label 7975 2050 2    31   ~ 0
Rs1For_EX1
Text Label 8975 2075 2    31   ~ 0
Rs1ForSel_EX2
Text Label 8175 1600 0    31   ~ 0
BranchAdderBSel_EX2
Text Label 9025 2175 0    31   ~ 0
Rs1For_EX2
$Comp
L CPUSchem:2-1Mux U?
U 1 1 5EB3AFB0
P 8975 2175
F 0 "U?" H 9000 2500 50  0001 C CNN
F 1 "2-1Mux" H 8975 2325 50  0001 C CNN
F 2 "" H 9000 2500 50  0001 C CNN
F 3 "" H 9000 2500 50  0001 C CNN
	1    8975 2175
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 1900 7700 1825
Text Label 7450 1950 2    31   ~ 0
4
Text Label 7450 1850 2    31   ~ 0
PC_EX1
$Comp
L CPUSchem:ADDER U?
U 1 1 5EB700C9
P 7525 1900
F 0 "U?" H 7500 2150 50  0001 C CNN
F 1 "ADDER" H 7550 2000 39  0000 C CNN
F 2 "" H 7675 1925 50  0001 C CNN
F 3 "" H 7675 1925 50  0001 C CNN
	1    7525 1900
	1    0    0    -1  
$EndComp
Text Label 7975 2200 2    31   ~ 0
B_EX1[31]
Text Label 7975 2125 2    31   ~ 0
A_EX1[31]
Text Label 7975 1900 2    31   ~ 0
PC_EX1
Text Label 8175 1825 0    31   ~ 0
PC_Plus4_EX2
$Comp
L CPUSchem:3-1MUX U?
U 1 1 5EB6BAFC
P 10500 1675
F 0 "U?" H 10500 1925 31  0001 C CNN
F 1 "3-1MUX" H 10500 1800 31  0001 C CNN
F 2 "" H 10500 1925 31  0001 C CNN
F 3 "" H 10500 1925 31  0001 C CNN
	1    10500 1675
	1    0    0    -1  
$EndComp
Text Label 8175 1700 0    31   ~ 0
IsJump_EX2
Text Label 8175 1650 0    31   ~ 0
Func3_EX2
$Comp
L CPUSchem:FORWARDING_UNIT U?
U 1 1 5EBA3206
P 7775 3975
AR Path="/5EBA3206" Ref="U?"  Part="1" 
AR Path="/5EB97B98/5EBA3206" Ref="U?"  Part="1" 
F 0 "U?" H 7775 4250 31  0001 C CNN
F 1 "FORWARDING_UNIT" H 7725 4150 39  0000 C CNN
F 2 "" H 7775 3975 31  0001 C CNN
F 3 "" H 7775 3975 31  0001 C CNN
	1    7775 3975
	1    0    0    -1  
$EndComp
Text Label 8050 2825 3    31   ~ 0
En_EX2
Text Label 8100 2825 3    31   ~ 0
Clr_EX2
Text Label 8175 1900 0    31   ~ 0
PC_EX2
Text Label 8175 2525 0    31   ~ 0
Imm_EX2
Text Label 8175 1750 0    31   ~ 0
IsBranch_EX2
Text Label 8175 2750 0    31   ~ 0
RDAddr_EX2
Text Label 10025 1400 0    31   ~ 0
RegWrEn_WB
Text Label 10550 1700 0    31   ~ 0
WBData_WB
Text Label 8175 2125 0    31   ~ 0
AluASign_EX2
Text Label 8175 2200 0    31   ~ 0
AluBSign_EX2
Text Label 8175 2275 0    31   ~ 0
AluCarry_EX2
Text Label 7975 2750 2    31   ~ 0
RDAddr_EX1
Text Label 7975 2525 2    31   ~ 0
Imm_EX1
Text Label 9550 2375 2    31   ~ 0
Func3_EX2
Text Label 9550 2525 2    31   ~ 0
DBusRe_EX2
Text Label 9550 2600 2    31   ~ 0
DBusWe_EX2
Wire Wire Line
	5825 1400 7775 1400
Wire Wire Line
	5825 1450 7725 1450
Wire Wire Line
	5825 1500 7625 1500
Wire Wire Line
	5825 1550 7575 1550
Wire Wire Line
	5825 1600 7525 1600
Wire Wire Line
	5825 1650 7475 1650
Wire Wire Line
	7275 2725 7275 2475
Wire Wire Line
	7275 2325 7275 2425
Wire Wire Line
	7275 2425 7650 2425
Wire Wire Line
	7275 2475 7650 2475
Wire Wire Line
	7600 1900 7700 1900
$Comp
L CPUSchem:EX1_EX2 U?
U 1 1 601251FD
P 8075 1950
F 0 "U?" H 8075 2625 50  0001 C CNN
F 1 "EX1_EX2" H 8075 2575 39  0000 C CNN
F 2 "" H 8075 2625 50  0001 C CNN
F 3 "" H 8075 2625 50  0001 C CNN
	1    8075 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8575 1900 8925 1900
Wire Wire Line
	8575 2150 8925 2150
Text Label 8175 2450 0    31   ~ 0
ExeRes_EX2
$Comp
L CPUSchem:DCache U?
U 1 1 6014D6DD
P 9800 2400
F 0 "U?" H 9650 2700 50  0001 C CNN
F 1 "DCache" H 9700 2500 39  0000 C CNN
F 2 "" H 9700 2550 50  0001 C CNN
F 3 "" H 9700 2550 50  0001 C CNN
	1    9800 2400
	1    0    0    -1  
$EndComp
Text Notes 8800 1100 0    118  ~ 0
EX2
Wire Wire Line
	7750 2450 7975 2450
Wire Wire Line
	7200 2275 7975 2275
Wire Wire Line
	7475 1750 7975 1750
Wire Wire Line
	7525 1700 7975 1700
Wire Wire Line
	7575 1650 7975 1650
Wire Wire Line
	7625 1600 7975 1600
Wire Wire Line
	7725 1550 7975 1550
Wire Wire Line
	7775 1500 7975 1500
Wire Wire Line
	7700 1825 7975 1825
Wire Wire Line
	5825 1300 7950 1300
Wire Wire Line
	5825 1350 7900 1350
$Comp
L CPUSchem:EX2_WB U?
U 1 1 601A0D07
P 9925 1550
F 0 "U?" H 9925 1825 50  0001 C CNN
F 1 "EX2_WB" H 9925 1775 39  0000 C CNN
F 2 "" H 9950 1550 50  0001 C CNN
F 3 "" H 9950 1550 50  0001 C CNN
	1    9925 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2825 1800 3100
Wire Wire Line
	1800 3100 1900 3100
Text Label 8500 3950 0    31   ~ 0
Rs2ForSel_ID
Text Notes 10500 1100 0    118  ~ 0
WB
Wire Wire Line
	3750 3150 3625 3150
Wire Wire Line
	10225 2375 10350 2375
Wire Wire Line
	2325 3225 2550 3225
Wire Wire Line
	2975 3150 3025 3150
Wire Wire Line
	1800 2825 3025 2825
Connection ~ 3025 2825
Wire Wire Line
	3025 2825 3025 3150
Text Label 3625 3225 0    31   ~ 0
ICacheStall_PC
Text Label 10225 2450 0    31   ~ 0
DCacheStall_EX2
Text Label 3800 5300 2    31   ~ 0
DCacheStall_EX2
Text Label 3800 5225 2    31   ~ 0
ICacheStall_PC
Wire Wire Line
	4275 1650 4750 1650
Connection ~ 4275 2400
Text Label 8925 1950 2    31   ~ 0
WBData_WB
Text Label 8925 2200 2    31   ~ 0
WBData_WB
$EndSCHEMATC
