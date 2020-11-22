EESchema Schematic File Version 4
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
L SOC:IMM_GEN U?
U 1 1 5EBA30B4
P 4925 3875
F 0 "U?" H 4775 4075 39  0001 C CNN
F 1 "IMM_GEN" H 4850 4000 39  0000 C CNN
F 2 "" H 4875 3850 39  0001 C CNN
F 3 "" H 4875 3850 39  0001 C CNN
	1    4925 3875
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3825 5275 3825
Wire Wire Line
	4975 2800 4975 2750
Connection ~ 4975 2750
Wire Wire Line
	4975 2800 4975 2850
Connection ~ 4975 2800
Connection ~ 4975 2850
Wire Wire Line
	4975 2850 4975 2900
Wire Wire Line
	4975 2700 4975 2650
Connection ~ 4975 2700
Text Label 5275 4150 2    31   ~ 0
RS1Addr_D
Text Label 5275 4075 2    31   ~ 0
RS2Addr_D
Text Label 5275 4225 2    31   ~ 0
RDAddr_D
Text Label 5475 3825 0    31   ~ 0
Imm_E
$Comp
L SOC:DECODER U?
U 1 1 5EBA30F0
P 4900 2875
F 0 "U?" H 4900 3025 39  0001 C CNN
F 1 "DECODER" H 4575 3125 39  0000 C CNN
F 2 "" H 4900 2975 39  0001 C CNN
F 3 "" H 4900 2975 39  0001 C CNN
	1    4900 2875
	1    0    0    -1  
$EndComp
Text Label 5475 4150 0    31   ~ 0
RS1Addr_E
Text Label 5475 4075 0    31   ~ 0
RS2Addr_E
Text Label 6100 4600 2    31   ~ 0
RS2Addr_E
Text Label 6100 4525 2    31   ~ 0
RS1Addr_E
Text Label 5475 4225 0    31   ~ 0
RDAddr_E
Text Label 5475 2400 0    31   ~ 0
WBSrc_E
Wire Wire Line
	4975 2650 4975 2600
Connection ~ 4975 2650
Connection ~ 4975 2600
Wire Wire Line
	4975 2600 4975 2550
Wire Wire Line
	4975 2750 4975 2700
Text Label 6100 4825 2    31   ~ 0
RDAddr_M
Wire Wire Line
	4925 2700 4975 2700
Wire Wire Line
	5475 3825 5825 3825
Wire Wire Line
	4975 2550 5275 2550
Wire Wire Line
	4975 2600 5275 2600
Wire Wire Line
	4975 2700 5275 2700
Wire Wire Line
	4975 2800 5275 2800
Wire Wire Line
	4975 2900 5275 2900
Wire Wire Line
	4975 2650 5275 2650
Wire Wire Line
	4975 2750 5275 2750
Wire Wire Line
	4975 2850 5275 2850
Text Label 5350 4400 3    31   ~ 0
En_E
Text Label 5400 4400 3    31   ~ 0
Clr_E
Text Label 5475 3100 0    31   ~ 0
PC_E
Text Label 8800 3650 2    31   ~ 0
DBusWe_M
Text Label 8800 3575 2    31   ~ 0
DBusRe_M
Text Label 8800 3425 2    31   ~ 0
Func3_M
Text Label 7300 3575 2    31   ~ 0
Imm_E
Text Label 7300 3800 2    31   ~ 0
RDAddr_E
$Comp
L SOC:DBUS_MASTER U?
U 1 1 5EBA31C6
P 9050 3450
AR Path="/5EBA31C6" Ref="U?"  Part="1" 
AR Path="/5EB97B98/5EBA31C6" Ref="U?"  Part="1" 
F 0 "U?" H 8900 3750 50  0001 C CNN
F 1 "DBUS_MASTER" H 9050 3550 39  0000 C CNN
F 2 "" H 8950 3700 50  0001 C CNN
F 3 "" H 8950 3700 50  0001 C CNN
	1    9050 3450
	1    0    0    -1  
$EndComp
Text Label 7500 3325 0    31   ~ 0
AluCarry_M
Text Label 7500 3250 0    31   ~ 0
AluBSign_M
Text Label 7500 3175 0    31   ~ 0
AluASign_M
Text Label 9875 2750 0    31   ~ 0
WBData_W
Text Label 9350 2450 0    31   ~ 0
RegWrEn_W
Text Label 7500 3800 0    31   ~ 0
RDAddr_M
Text Label 7500 2800 0    31   ~ 0
IsBranch_M
Text Label 7500 3575 0    31   ~ 0
Imm_M
Text Label 7500 2950 0    31   ~ 0
PC_M
Text Label 7425 3875 3    31   ~ 0
Clr_M
Text Label 7375 3875 3    31   ~ 0
En_M
$Comp
L SOC:FORWARDING_UNIT U?
U 1 1 5EBA3206
P 6450 4475
AR Path="/5EBA3206" Ref="U?"  Part="1" 
AR Path="/5EB97B98/5EBA3206" Ref="U?"  Part="1" 
F 0 "U?" H 6450 4750 31  0001 C CNN
F 1 "FORWARDING_UNIT" H 6400 4650 39  0000 C CNN
F 2 "" H 6450 4475 31  0001 C CNN
F 3 "" H 6450 4475 31  0001 C CNN
	1    6450 4475
	1    0    0    -1  
$EndComp
Text HLabel 9600 3625 2    31   Output ~ 0
DBUS_Addr
Text HLabel 9600 3675 2    31   Output ~ 0
DBUS_ByteEn
Text HLabel 9600 3725 2    31   Output ~ 0
DBUS_Read
Text HLabel 9600 3775 2    31   Output ~ 0
DBUS_Write
Text HLabel 9600 3825 2    31   Input ~ 0
DBUS_Rd
Text HLabel 9600 3875 2    31   Output ~ 0
DBUS_Wd
Text Label 8800 3875 2    31   ~ 0
DBusTranslatorEn_M
Wire Wire Line
	4975 2900 4975 2950
Wire Wire Line
	4975 2950 5275 2950
Connection ~ 4975 2900
Wire Wire Line
	4975 2950 4975 3000
Wire Wire Line
	4975 3000 5275 3000
Connection ~ 4975 2950
Text Label 5275 3000 2    31   ~ 0
RS1Valid_D
Text Label 5275 2950 2    31   ~ 0
RS2Valid_D
Text Label 6100 4900 2    31   ~ 0
RegWrEn_M
Text Label 7500 2700 0    31   ~ 0
Func3_M
Text Label 5475 2600 0    31   ~ 0
Func3_E
$Comp
L SOC:2-1Mux U?
U 1 1 5EADDABA
P 5725 3500
F 0 "U?" H 5750 3825 50  0001 C CNN
F 1 "2-1Mux" H 5725 3650 50  0001 C CNN
F 2 "" H 5750 3825 50  0001 C CNN
F 3 "" H 5750 3825 50  0001 C CNN
	1    5725 3500
	1    0    0    -1  
$EndComp
Text Label 5675 3525 2    31   ~ 0
AluRes_M
Wire Wire Line
	5475 3475 5675 3475
Text Label 5775 3500 0    31   ~ 0
Rs2For_E
Text Label 2275 3850 2    39   ~ 0
4
Wire Wire Line
	3975 2875 4325 2875
Wire Wire Line
	4325 2950 3975 2950
Text Label 4000 2950 0    31   ~ 0
Inst[24:20]
Text Label 4000 2875 0    31   ~ 0
Inst[19:15]
Connection ~ 3425 4000
Wire Wire Line
	3425 3100 3600 3100
Wire Wire Line
	3425 3100 3425 4000
$Comp
L SOC:PC U?
U 1 1 5EBA30C0
P 3075 4150
F 0 "U?" H 3025 4300 50  0001 C CNN
F 1 "PC" H 2900 4400 39  0000 C CNN
F 2 "" H 2900 4350 50  0001 C CNN
F 3 "" H 2900 4350 50  0001 C CNN
	1    3075 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3975 2700 3975 2875
Text Label 2075 4325 2    31   ~ 0
PC_M
Connection ~ 3975 2950
Connection ~ 3975 2875
Wire Wire Line
	3975 2875 3975 2950
Wire Wire Line
	3975 2950 3975 3025
Text Label 4000 3025 0    31   ~ 0
Inst[11:7]
Wire Wire Line
	3975 3025 4325 3025
Connection ~ 3975 3025
Wire Wire Line
	3975 3025 3975 3825
Connection ~ 3975 3825
Wire Wire Line
	3975 3825 3975 4000
Text Label 3325 1375 0    31   ~ 0
PcEn
Text Label 2200 1450 2    31   ~ 0
RS1Addr_D
Text Label 2200 1600 2    31   ~ 0
RS2Addr_D
Text Label 2200 1700 2    31   ~ 0
RDAddr_E
Text Label 2200 2450 2    31   ~ 0
IsBranch_M
$Comp
L SOC:BRANCH_UNIT U?
U 1 1 5EBA312E
P 2100 3350
F 0 "U?" H 2000 3725 31  0001 C CNN
F 1 "BRANCH_UNIT" H 1800 3550 39  0000 C CNN
F 2 "" H 2000 3725 31  0001 C CNN
F 3 "" H 2000 3725 31  0001 C CNN
	1    2100 3350
	1    0    0    -1  
$EndComp
Text Label 1575 3375 2    31   ~ 0
Func3_M
Text Label 1575 3300 2    31   ~ 0
IsBranch_M
Text Label 2575 3225 0    31   ~ 0
TakeBranch_M
Text Label 2200 2525 2    31   ~ 0
TakeBranch
Text Label 3675 3400 3    31   ~ 0
En_D
Text Label 3725 3400 3    31   ~ 0
Clr_D
Text Label 3325 1675 0    31   ~ 0
En_E
Text Label 3325 1925 0    31   ~ 0
Clr_E
Text Label 3325 1625 0    31   ~ 0
En_D
Text Label 3325 1875 0    31   ~ 0
Clr_D
Text Label 3325 1725 0    31   ~ 0
En_M
Text Label 3325 1975 0    31   ~ 0
Clr_M
Text Label 2825 4000 2    31   ~ 0
PcEn
$Comp
L SOC:HAZARD_UNIT U?
U 1 1 5EBA3150
P 2600 1525
AR Path="/5EBA3150" Ref="U?"  Part="1" 
AR Path="/5EB97B98/5EBA3150" Ref="U?"  Part="1" 
F 0 "U?" H 2500 1900 31  0001 C CNN
F 1 "HAZARD_UNIT" H 2425 1750 39  0000 C CNN
F 2 "" H 2500 1900 31  0001 C CNN
F 3 "" H 2500 1900 31  0001 C CNN
	1    2600 1525
	1    0    0    -1  
$EndComp
Text Label 1575 3450 2    31   ~ 0
AluZero_M
Text Label 2200 1775 2    31   ~ 0
RDAddr_M
Wire Wire Line
	3300 4000 3425 4000
Wire Wire Line
	3475 4000 3425 4000
Text Label 3325 1425 0    31   ~ 0
IBusRdEn_D
Text Label 3325 1475 0    31   ~ 0
IBusOZero_D
$Comp
L SOC:ADDER U?
U 1 1 5EBA3168
P 2350 3900
F 0 "U?" H 2325 4150 50  0001 C CNN
F 1 "PC_ADDER" H 2350 4050 39  0000 C CNN
F 2 "" H 2500 3925 50  0001 C CNN
F 3 "" H 2500 3925 50  0001 C CNN
	1    2350 3900
	1    0    0    -1  
$EndComp
$Comp
L SOC:ADDER U?
U 1 1 5EBA316E
P 2350 4225
F 0 "U?" H 2325 4475 50  0001 C CNN
F 1 "BRANCH_ADDER" H 2325 4350 39  0000 C CNN
F 2 "" H 2500 4250 50  0001 C CNN
F 3 "" H 2500 4250 50  0001 C CNN
	1    2350 4225
	1    0    0    -1  
$EndComp
$Comp
L SOC:2-1Mux U?
U 1 1 5EBA3174
P 2650 4075
F 0 "U?" H 2675 4400 50  0001 C CNN
F 1 "2-1Mux" H 2650 4225 50  0001 C CNN
F 2 "" H 2675 4400 50  0001 C CNN
F 3 "" H 2675 4400 50  0001 C CNN
	1    2650 4075
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4050 2600 4050
Wire Wire Line
	2550 4225 2550 4100
Wire Wire Line
	2550 4100 2600 4100
Wire Wire Line
	2650 3975 2650 3225
Text Label 2275 4175 2    31   ~ 0
Imm_M
Text Label 3300 4000 0    28   ~ 0
PC_F
Text Label 2275 3950 2    28   ~ 0
PC_F
Wire Wire Line
	2700 4075 2825 4075
Wire Wire Line
	2575 3225 2650 3225
Text Label 1575 3525 2    31   ~ 0
AluSignNeg_M
Text HLabel 2200 2025 0    31   Input ~ 0
DBUS_WaitReq_M
Text Label 3325 1525 0    31   ~ 0
DBusTranslatorEn_E
Text Label 2200 1525 2    31   ~ 0
RS2Valid_D
Text Label 2200 1375 2    31   ~ 0
RS1Valid_D
Wire Wire Line
	3975 3825 4675 3825
Text Label 4325 2875 0    31   ~ 0
RS1Addr_D
Text Label 4325 2950 0    31   ~ 0
RS2Addr_D
Text Label 4325 3025 0    31   ~ 0
RDAddr_D
Wire Wire Line
	3975 2700 4400 2700
Text Label 6975 4525 0    31   ~ 0
Rs1ForSel_E
Text Label 4275 3250 2    31   ~ 0
RS1_D
Text Label 4275 3325 2    31   ~ 0
RS2_D
$Comp
L SOC:REGFILE U?
U 1 1 5EBA30AE
P 4625 3450
F 0 "U?" H 4500 3850 50  0001 C CNN
F 1 "REGFILE" H 4425 3750 39  0000 C CNN
F 2 "" H 4450 3575 50  0001 C CNN
F 3 "" H 4450 3575 50  0001 C CNN
	1    4625 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3275 5275 3275
Wire Wire Line
	5250 3475 5275 3475
Wire Wire Line
	5475 3275 5500 3275
Text Label 5475 2700 0    31   ~ 0
IsBranch_E
Text Label 2200 2125 2    31   ~ 0
DBusRe_E
Wire Wire Line
	4975 2550 4975 2500
Wire Wire Line
	4975 2500 5275 2500
Connection ~ 4975 2550
Text Label 7500 2750 0    31   ~ 0
IsJump_M
Text Label 5475 2650 0    31   ~ 0
IsJump_E
Text Label 2200 2375 2    31   ~ 0
IsBranch_E
Text Label 1575 3225 2    31   ~ 0
IsJump_M
$Comp
L SOC:3-1MUX U?
U 1 1 5EB6BAFC
P 9825 2725
F 0 "U?" H 9825 2975 31  0001 C CNN
F 1 "3-1MUX" H 9825 2850 31  0001 C CNN
F 2 "" H 9825 2975 31  0001 C CNN
F 3 "" H 9825 2975 31  0001 C CNN
	1    9825 2725
	1    0    0    -1  
$EndComp
Wire Wire Line
	2425 3900 2550 3900
Wire Wire Line
	2425 4225 2550 4225
Wire Wire Line
	2550 3900 2550 4050
Text Label 7500 2875 0    31   ~ 0
PC_Plus4_M
Text Label 7300 2950 2    31   ~ 0
PC_E
Text Label 7300 3175 2    31   ~ 0
A_E[31]
Text Label 7300 3250 2    31   ~ 0
B_E[31]
Wire Wire Line
	5500 3175 5500 3275
Text Label 6225 3200 0    31   ~ 0
A_E
Wire Wire Line
	5975 3200 6300 3200
Wire Wire Line
	5500 3175 5875 3175
Text Label 5875 3225 2    31   ~ 0
AluRes_M
Wire Wire Line
	5825 3550 5825 3825
Text Label 6225 3525 0    31   ~ 0
B_E
Wire Wire Line
	5825 3550 6125 3550
$Comp
L SOC:2-1Mux U?
U 1 1 5EBA3184
P 6175 3525
F 0 "U?" H 6200 3850 50  0001 C CNN
F 1 "2-1Mux" H 6175 3675 50  0001 C CNN
F 2 "" H 6200 3850 50  0001 C CNN
F 3 "" H 6200 3850 50  0001 C CNN
	1    6175 3525
	1    0    0    -1  
$EndComp
$Comp
L SOC:2-1Mux U?
U 1 1 5EC4C00F
P 2125 4350
F 0 "U?" H 2150 4675 50  0001 C CNN
F 1 "2-1Mux" H 2125 4500 50  0001 C CNN
F 2 "" H 2150 4675 50  0001 C CNN
F 3 "" H 2150 4675 50  0001 C CNN
	1    2125 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2175 4350 2225 4350
Wire Wire Line
	2225 4350 2225 4275
Wire Wire Line
	2225 4275 2275 4275
Wire Wire Line
	5775 3500 6125 3500
Wire Wire Line
	6225 3525 6275 3525
Wire Wire Line
	6275 3525 6275 3550
Wire Wire Line
	6275 3550 6300 3550
Wire Wire Line
	7100 2875 7300 2875
$Comp
L SOC:ALU U?
U 1 1 5EBA318F
P 6400 3375
F 0 "U?" H 6475 3625 50  0001 C CNN
F 1 "ALU" H 6400 3650 39  0000 C CNN
F 2 "" H 6475 3625 50  0001 C CNN
F 3 "" H 6475 3625 50  0001 C CNN
	1    6400 3375
	1    0    0    -1  
$EndComp
$Comp
L SOC:ADDER U?
U 1 1 5EB700C9
P 6975 2950
F 0 "U?" H 6950 3200 50  0001 C CNN
F 1 "ADDER" H 7000 3050 39  0000 C CNN
F 2 "" H 7125 2975 50  0001 C CNN
F 3 "" H 7125 2975 50  0001 C CNN
	1    6975 2950
	1    0    0    -1  
$EndComp
Text Label 6900 2900 2    31   ~ 0
PC_E
Text Label 6900 3000 2    31   ~ 0
4
Wire Wire Line
	7050 2950 7100 2950
Wire Wire Line
	7100 2950 7100 2875
Wire Wire Line
	6675 3325 7300 3325
Text Label 6975 4600 0    31   ~ 0
Rs2ForSel_E
Text Label 6975 4675 0    31   ~ 0
Rs1ForSel_M
Text Label 5975 3200 0    31   ~ 0
Rs1For_E
$Comp
L SOC:2-1Mux U?
U 1 1 5EB3AFB0
P 8150 3225
F 0 "U?" H 8175 3550 50  0001 C CNN
F 1 "2-1Mux" H 8150 3375 50  0001 C CNN
F 2 "" H 8175 3550 50  0001 C CNN
F 3 "" H 8175 3550 50  0001 C CNN
	1    8150 3225
	1    0    0    -1  
$EndComp
Text Label 8200 3225 0    31   ~ 0
Rs1For_M
Text Label 8100 3250 2    31   ~ 0
AluRes_M
Wire Wire Line
	5275 2450 4975 2450
Wire Wire Line
	4975 2450 4975 2500
Connection ~ 4975 2500
Text Label 2125 4250 2    31   ~ 0
BranchAdderBSel_M
Text Label 7500 2650 0    31   ~ 0
BranchAdderBSel_M
$Comp
L SOC:ID_IE U?
U 1 1 5EB8A9BC
P 5375 2975
F 0 "U?" H 5425 3625 50  0001 C CNN
F 1 "ID_IE" H 5375 3775 39  0000 C CNN
F 2 "" H 5400 2700 50  0001 C CNN
F 3 "" H 5400 2700 50  0001 C CNN
	1    5375 2975
	1    0    0    -1  
$EndComp
$Comp
L SOC:IF_ID U?
U 1 1 5EB8D32B
P 3700 3575
F 0 "U?" H 3700 4250 50  0001 C CNN
F 1 "IF_ID" H 3700 4241 39  0000 C CNN
F 2 "" H 3725 3700 50  0001 C CNN
F 3 "" H 3725 3700 50  0001 C CNN
	1    3700 3575
	1    0    0    -1  
$EndComp
$Comp
L SOC:IE_MEM U?
U 1 1 5EB8DE08
P 7400 3000
F 0 "U?" H 7400 3575 50  0001 C CNN
F 1 "IE_MEM" H 7400 3625 39  0000 C CNN
F 2 "" H 7400 3575 50  0001 C CNN
F 3 "" H 7400 3575 50  0001 C CNN
	1    7400 3000
	1    0    0    -1  
$EndComp
Text Label 5725 3400 2    31   ~ 0
Rs2ForSel_E
Text Label 8150 3125 2    31   ~ 0
Rs1ForSel_M
Text Label 2075 4375 2    31   ~ 0
Rs1For_M
Text Label 7300 3100 2    31   ~ 0
Rs1For_E
Text Label 7300 3725 2    31   ~ 0
RS1Addr_E
Text Label 7500 3725 0    31   ~ 0
RS1Addr_M
Text Label 6100 4675 2    31   ~ 0
RS1Addr_M
$Comp
L SOC:MEM_WB U?
U 1 1 5EB3DE22
P 9250 2600
F 0 "U?" H 9250 2825 50  0001 C CNN
F 1 "MEM_WB" H 9250 2825 39  0000 C CNN
F 2 "" H 9275 2600 50  0001 C CNN
F 3 "" H 9275 2600 50  0001 C CNN
	1    9250 2600
	1    0    0    -1  
$EndComp
Text Label 7500 2500 0    31   ~ 0
WBSrc_M
Text Label 9350 2500 0    31   ~ 0
WBSrc_W
Text Label 9150 2675 2    31   ~ 0
PC_Plus4_M
Text Label 9150 2750 2    31   ~ 0
ExeRes_M
Wire Wire Line
	9350 2675 9725 2675
Wire Wire Line
	9350 2750 9725 2750
Wire Wire Line
	9675 2825 9725 2825
Wire Wire Line
	9350 2500 9800 2500
Text Label 4275 3450 2    31   ~ 0
RegWrEn_W
Text Label 9150 2925 2    31   ~ 0
RDAddr_M
Text Label 9350 2925 0    31   ~ 0
RDAddr_W
Text Label 4275 3525 2    31   ~ 0
RDAddr_W
Text Label 4275 3600 2    31   ~ 0
WBData_W
Wire Wire Line
	5275 2400 4975 2400
Wire Wire Line
	4975 2400 4975 2450
Connection ~ 4975 2450
Text Label 3325 2025 0    31   ~ 0
Clr_W
Text Label 3325 1775 0    31   ~ 0
En_W
Text Label 9225 3050 3    31   ~ 0
En_W
Text Label 9275 3050 3    31   ~ 0
Clr_W
Wire Wire Line
	7300 2650 7025 2650
Wire Wire Line
	7300 2700 6975 2700
Wire Wire Line
	7300 2750 6925 2750
Wire Wire Line
	7300 2800 6875 2800
Text Label 7300 3025 2    31   ~ 0
Rs2For_E
$Comp
L SOC:2-1Mux U?
U 1 1 5ED0AAB6
P 8150 2975
F 0 "U?" H 8175 3300 50  0001 C CNN
F 1 "2-1Mux" H 8150 3125 50  0001 C CNN
F 2 "" H 8175 3300 50  0001 C CNN
F 3 "" H 8175 3300 50  0001 C CNN
	1    8150 2975
	1    0    0    -1  
$EndComp
Text Label 8150 2875 2    31   ~ 0
Rs2ForSel_M
Text Label 8100 3000 2    31   ~ 0
AluRes_M
Text Label 8200 2975 0    31   ~ 0
Rs2For_M
Text Label 8800 3725 2    31   ~ 0
Rs2For_M
Text Label 6975 4750 0    31   ~ 0
Rs2ForSel_M
Text Label 8075 3650 0    31   ~ 0
ExeZero_M
$Comp
L SOC:0Comparator U?
U 1 1 5EBA31D6
P 8000 3650
F 0 "U?" H 8200 3925 31  0001 C CNN
F 1 "0Comparator" H 8025 3900 39  0001 C CNN
F 2 "" H 8200 3925 31  0001 C CNN
F 3 "" H 8200 3925 31  0001 C CNN
	1    8000 3650
	1    0    0    1   
$EndComp
Text Label 7875 3750 0    28   ~ 0
[31]
Text Label 8000 3750 0    31   ~ 0
ExeSignNeg_M
Wire Wire Line
	7875 3750 8000 3750
Wire Wire Line
	7875 3750 7875 3650
Wire Wire Line
	7875 3650 7925 3650
Connection ~ 7875 3650
Wire Wire Line
	7500 3025 7825 3025
Text Label 5925 3100 2    31   ~ 0
Rs1ForSel_E
$Comp
L SOC:2-1Mux U?
U 1 1 5EADD59E
P 5925 3200
F 0 "U?" H 5950 3525 50  0001 C CNN
F 1 "2-1Mux" H 5925 3350 50  0001 C CNN
F 2 "" H 5950 3525 50  0001 C CNN
F 3 "" H 5950 3525 50  0001 C CNN
	1    5925 3200
	1    0    0    -1  
$EndComp
$Comp
L SOC:2-1Mux U?
U 1 1 5ED695AC
P 5200 3275
F 0 "U?" H 5225 3600 50  0001 C CNN
F 1 "2-1Mux" H 5200 3425 50  0001 C CNN
F 2 "" H 5225 3600 50  0001 C CNN
F 3 "" H 5225 3600 50  0001 C CNN
	1    5200 3275
	1    0    0    -1  
$EndComp
$Comp
L SOC:2-1Mux U?
U 1 1 5ED6DABA
P 5200 3500
F 0 "U?" H 5225 3825 50  0001 C CNN
F 1 "2-1Mux" H 5200 3650 50  0001 C CNN
F 2 "" H 5225 3825 50  0001 C CNN
F 3 "" H 5225 3825 50  0001 C CNN
	1    5200 3500
	1    0    0    -1  
$EndComp
Text Label 5200 3175 2    31   ~ 0
Rs1ForSel_D
Text Label 5200 3400 2    31   ~ 0
Rs2ForSel_D
Wire Wire Line
	5250 3500 5250 3475
Wire Wire Line
	3900 4000 3975 4000
Wire Wire Line
	3800 3100 5275 3100
Wire Wire Line
	4900 3475 5150 3475
Wire Wire Line
	4900 3250 5150 3250
Text Label 6775 3475 0    31   ~ 0
AluRes_E
Text Label 5150 3300 2    31   ~ 0
AluRes_M
Text Label 5150 3525 2    31   ~ 0
AluRes_M
Text Label 6975 4375 0    31   ~ 0
Rs1ForSel_D
Text Label 6975 4450 0    31   ~ 0
Rs2ForSel_D
Text Label 6100 4525 2    31   ~ 0
RS1Addr_E
Text Label 6100 4750 2    31   ~ 0
RS2Addr_M
Text Label 6100 4375 2    31   ~ 0
RS1Addr_D
Text Label 6100 4450 2    31   ~ 0
RS2Addr_D
Text Label 7300 3650 2    31   ~ 0
RS2Addr_E
Text Label 7500 3650 0    31   ~ 0
RS2Addr_M
Text Label 7500 2600 0    31   ~ 0
DBusWe_M
Text Label 7500 2550 0    31   ~ 0
DBusRe_M
Text Label 9350 2550 0    31   ~ 0
DBusRe_W
Text Label 6175 3425 2    31   ~ 0
AluBSel_E
$Comp
L SOC:LOAD_UPPER U?
U 1 1 5EB59563
P 6475 3900
F 0 "U?" H 6650 4175 50  0001 C CNN
F 1 "LOAD_UPPER" H 6475 4100 39  0000 C CNN
F 2 "" H 6650 4175 50  0001 C CNN
F 3 "" H 6650 4175 50  0001 C CNN
	1    6475 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5475 2700 6875 2700
Wire Wire Line
	5475 2650 6925 2650
Wire Wire Line
	5475 2600 6975 2600
Wire Wire Line
	5475 2550 7025 2550
Wire Wire Line
	5475 2500 7125 2500
Wire Wire Line
	5475 2450 7175 2450
Wire Wire Line
	5475 2400 7225 2400
$Comp
L SOC:2-1Mux U?
U 1 1 5EB931AF
P 7100 3500
F 0 "U?" H 7125 3825 50  0001 C CNN
F 1 "2-1Mux" H 7100 3650 50  0001 C CNN
F 2 "" H 7125 3825 50  0001 C CNN
F 3 "" H 7125 3825 50  0001 C CNN
	1    7100 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6725 3775 6775 3775
Wire Wire Line
	6775 3775 6775 3525
Wire Wire Line
	6775 3525 7050 3525
Wire Wire Line
	6675 3375 6775 3375
Wire Wire Line
	6775 3375 6775 3475
Wire Wire Line
	6775 3475 7050 3475
Wire Wire Line
	7150 3500 7300 3500
Text Label 6225 3850 2    31   ~ 0
PC_E
Wire Wire Line
	6225 3925 5825 3925
Wire Wire Line
	5825 3925 5825 3825
Connection ~ 5825 3825
Wire Wire Line
	5275 2350 4975 2350
Wire Wire Line
	4975 2350 4975 2400
Connection ~ 4975 2400
Text Label 2200 1850 2    31   ~ 0
RDAddr_W
Text Label 2200 2200 2    31   ~ 0
DBusRe_M
Text Label 2200 2275 2    31   ~ 0
DBusRe_W
Text Label 5475 2850 0    31   ~ 0
AluBSel_E
Text Label 5475 2900 0    31   ~ 0
LoadUpperOp_E
Text Label 6225 3775 2    31   ~ 0
LoadUpperOp_E
Text Label 5475 2750 0    31   ~ 0
ExeResSel_E
Text Label 7100 3400 2    31   ~ 0
ExeResSel_E
Text Label 7500 3500 0    31   ~ 0
ExeRes_M
Wire Wire Line
	7500 3100 7825 3100
Wire Wire Line
	7825 3100 7825 3200
Wire Wire Line
	7825 3200 8100 3200
Wire Wire Line
	8100 2950 7825 2950
Wire Wire Line
	7825 2950 7825 3025
Wire Wire Line
	7875 3500 7875 3650
Wire Wire Line
	7275 2450 7300 2450
Wire Wire Line
	7300 2500 7225 2500
Wire Wire Line
	7175 2550 7300 2550
Wire Wire Line
	7300 2600 7125 2600
Wire Wire Line
	7500 2450 9150 2450
Wire Wire Line
	7500 2500 9150 2500
Wire Wire Line
	7500 2550 9150 2550
Wire Wire Line
	9800 2500 9800 2600
$Comp
L SOC:IBUS U?
U 1 1 5ED7A87C
P 3675 4075
F 0 "U?" H 3575 4325 50  0001 C CNN
F 1 "IBUS" H 3675 4250 39  0000 C CNN
F 2 "" H 3525 4250 50  0001 C CNN
F 3 "" H 3525 4250 50  0001 C CNN
	1    3675 4075
	1    0    0    -1  
$EndComp
Text Label 3650 4175 3    31   ~ 0
IBusRdEn_D
Text Label 3700 4175 3    31   ~ 0
IBusOZero_D
Wire Wire Line
	6875 2700 6875 2800
Wire Wire Line
	6925 2650 6925 2750
Wire Wire Line
	6975 2600 6975 2700
Wire Wire Line
	7025 2550 7025 2650
Wire Wire Line
	7125 2500 7125 2600
Wire Wire Line
	7175 2450 7175 2550
Wire Wire Line
	7225 2400 7225 2500
Wire Wire Line
	7275 2350 7275 2450
Wire Wire Line
	5475 2350 7275 2350
Wire Wire Line
	5475 2800 6525 2800
Wire Wire Line
	6525 2800 6525 3200
Wire Wire Line
	9675 2825 9675 3425
Wire Wire Line
	7500 3500 7875 3500
Wire Wire Line
	9600 3425 9675 3425
Wire Wire Line
	8800 3500 7875 3500
Connection ~ 7875 3500
Text Label 5475 2450 0    31   ~ 0
DBusRe_E
Text HLabel 2200 1950 0    31   Input ~ 0
IBus_WaitReq_D
$EndSCHEMATC
