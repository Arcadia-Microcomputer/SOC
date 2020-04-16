EESchema Schematic File Version 4
LIBS:SOCSchem-cache
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
Text Label 1800 4075 2    39   ~ 0
4
Wire Wire Line
	3850 2950 4150 2950
Wire Wire Line
	4150 3025 3850 3025
Text Label 3875 3025 0    31   ~ 0
Inst[24:20]
Text Label 3875 2950 0    31   ~ 0
Inst[19:15]
$Comp
L SOC:REGFILE U?
U 1 1 5E76926F
P 4625 3550
F 0 "U?" H 4500 3950 50  0001 C CNN
F 1 "REGFILE" H 4425 3850 39  0000 C CNN
F 2 "" H 4450 3675 50  0001 C CNN
F 3 "" H 4450 3675 50  0001 C CNN
	1    4625 3550
	1    0    0    -1  
$EndComp
$Comp
L SOC:IMM_GEN U?
U 1 1 5E76E7A5
P 4675 3950
F 0 "U?" H 4525 4150 39  0001 C CNN
F 1 "IMM_GEN" H 4600 4075 39  0000 C CNN
F 2 "" H 4625 3925 39  0001 C CNN
F 3 "" H 4625 3925 39  0001 C CNN
	1    4675 3950
	1    0    0    -1  
$EndComp
$Comp
L SOC:PC_ADD U?
U 1 1 5E760D2D
P 1950 4225
F 0 "U?" H 1925 4500 50  0001 C CNN
F 1 "PC_ADD" H 2025 4400 39  0000 C CNN
F 2 "" H 2100 4250 50  0001 C CNN
F 3 "" H 2100 4250 50  0001 C CNN
	1    1950 4225
	1    0    0    -1  
$EndComp
Connection ~ 3250 4075
Wire Wire Line
	3250 3175 3525 3175
Wire Wire Line
	3250 3175 3250 4075
Wire Wire Line
	4900 3350 5025 3350
Wire Wire Line
	4900 3425 5025 3425
Wire Wire Line
	4850 3900 5025 3900
$Comp
L SOC:PC U?
U 1 1 5E760631
P 2850 4225
F 0 "U?" H 2800 4375 50  0001 C CNN
F 1 "PC" H 2675 4475 39  0000 C CNN
F 2 "" H 2675 4425 50  0001 C CNN
F 3 "" H 2675 4425 50  0001 C CNN
	1    2850 4225
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2775 3850 2950
Text Label 1800 4375 2    31   ~ 0
PC_M
Wire Wire Line
	4725 2875 4725 2825
Connection ~ 4725 2825
Wire Wire Line
	4725 2875 4725 2925
Connection ~ 4725 2875
Connection ~ 4725 2925
Wire Wire Line
	4725 2925 4725 2975
Text Label 1875 4000 2    31   ~ 0
IsBranch_M
Text Label 5225 2875 0    31   ~ 0
IsBranch_E
Wire Wire Line
	4725 2775 4725 2725
Connection ~ 4725 2775
Text Label 4275 3550 2    31   ~ 0
RegWrEn_W
Text Label 4275 3700 2    31   ~ 0
WBData_W
Text Label 4150 2950 0    31   ~ 0
RS1Addr_D
Text Label 4150 3025 0    31   ~ 0
RS2Addr_D
Connection ~ 3850 3025
Text Label 4275 3350 2    31   ~ 0
RS1_D
Text Label 4275 3425 2    31   ~ 0
RS2_D
Text Label 5025 4150 2    31   ~ 0
RS1Addr_D
Text Label 5025 4225 2    31   ~ 0
RS2Addr_D
Connection ~ 3850 2950
Wire Wire Line
	3850 2950 3850 3025
Wire Wire Line
	3850 3025 3850 3100
Text Label 3875 3100 0    31   ~ 0
Inst[11:7]
Wire Wire Line
	3850 3100 4150 3100
Connection ~ 3850 3100
Text Label 4150 3100 0    31   ~ 0
RDAddr_D
Text Label 5025 4300 2    31   ~ 0
RDAddr_D
Wire Wire Line
	3850 3100 3850 3900
Wire Wire Line
	4425 3900 3850 3900
Connection ~ 3850 3900
Wire Wire Line
	3850 3900 3850 4075
Text Label 5225 3900 0    31   ~ 0
Immediate_E
Text Label 5225 2975 0    31   ~ 0
AluBSel_E
Text Label 5800 3600 2    31   ~ 0
AluBSel_E
Wire Wire Line
	5325 3425 5325 3600
$Comp
L SOC:ID-IE U?
U 1 1 5E768DE5
P 5125 3050
F 0 "U?" H 5125 3615 50  0001 C CNN
F 1 "ID_IE" H 5125 3550 39  0000 C CNN
F 2 "" H 5125 3050 50  0001 C CNN
F 3 "" H 5125 3050 50  0001 C CNN
	1    5125 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5675 3900 5675 3775
Wire Wire Line
	3850 2775 4150 2775
$Comp
L SOC:DECODER U?
U 1 1 5E7C2080
P 4650 2950
F 0 "U?" H 4650 3100 39  0001 C CNN
F 1 "DECODER" H 4325 3200 39  0000 C CNN
F 2 "" H 4650 3050 39  0001 C CNN
F 3 "" H 4650 3050 39  0001 C CNN
	1    4650 2950
	1    0    0    -1  
$EndComp
Text Label 5225 4150 0    31   ~ 0
RS1Addr_E
Text Label 5225 4225 0    31   ~ 0
RS2Addr_E
Text Label 5350 4800 2    31   ~ 0
RS2Addr_E
Text Label 5350 4725 2    31   ~ 0
RS1Addr_E
Text Label 6175 4800 0    31   ~ 0
AluForBSel
Text Label 6175 4725 0    31   ~ 0
AluForASel
Text Label 5600 3350 2    31   ~ 0
AluRes_M
Text Label 5650 3525 2    31   ~ 0
AluForASel
Text Label 5400 3675 2    31   ~ 0
AluRes_M
Text Label 5450 3850 2    31   ~ 0
AluForBSel
Wire Wire Line
	5450 3850 5475 3850
Wire Wire Line
	5475 3850 5475 3825
Wire Wire Line
	5400 3600 5325 3600
$Comp
L SOC:3-1MUX U?
U 1 1 5E8E7FB4
P 5500 3650
F 0 "U?" H 5500 3900 31  0001 C CNN
F 1 "3-1MUX" H 5500 3775 31  0001 C CNN
F 2 "" H 5500 3900 31  0001 C CNN
F 3 "" H 5500 3900 31  0001 C CNN
	1    5500 3650
	1    0    0    -1  
$EndComp
$Comp
L SOC:3-1MUX U?
U 1 1 5E8CFD57
P 5700 3325
F 0 "U?" H 5700 3575 31  0001 C CNN
F 1 "3-1MUX" H 5700 3450 31  0001 C CNN
F 2 "" H 5700 3575 31  0001 C CNN
F 3 "" H 5700 3575 31  0001 C CNN
	1    5700 3325
	1    0    0    -1  
$EndComp
Wire Wire Line
	5325 3350 5325 3275
Wire Wire Line
	5325 3275 5600 3275
Wire Wire Line
	5750 3350 5775 3350
Wire Wire Line
	5775 3350 5775 3425
Wire Wire Line
	5650 3525 5675 3525
Wire Wire Line
	5675 3525 5675 3500
Text Label 5325 3475 2    31   ~ 0
RS2_E
Text Label 5350 5175 2    31   ~ 0
RegWrEn_W
Text Label 5775 3125 0    31   ~ 0
AluOp_E
Text Label 5225 4300 0    31   ~ 0
RDAddr_E
Wire Wire Line
	3825 4075 3850 4075
Text Label 5250 2675 0    31   ~ 0
WBSrc_E
Text Label 2975 2125 2    31   ~ 0
WBSrc_E
Text Label 3800 1750 0    31   ~ 0
PcEn0
Text Label 5350 5100 2    31   ~ 0
RegWrEn_M
Text Label 4275 3625 2    31   ~ 0
RDAddr_W
Text Label 2975 1750 2    31   ~ 0
RS1Addr_D
Text Label 2975 1825 2    31   ~ 0
RS2Addr_D
Text Label 2975 1900 2    31   ~ 0
RDAddr_E
$Comp
L SOC:IF-ID U?
U 1 1 5E8C474F
P 3625 3650
F 0 "U?" H 3625 4350 50  0001 C CNN
F 1 "IF_ID" H 3625 4275 39  0000 C CNN
F 2 "" H 3625 3050 50  0001 C CNN
F 3 "" H 3625 3050 50  0001 C CNN
	1    3625 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4725 2725 4725 2675
Connection ~ 4725 2725
Connection ~ 4725 2675
Wire Wire Line
	4725 2675 4725 2625
Wire Wire Line
	6075 2675 6075 2825
Wire Wire Line
	6125 2625 6125 2775
Wire Wire Line
	5925 2825 5925 2975
Wire Wire Line
	5725 2925 5725 3125
Wire Wire Line
	5725 3125 5975 3125
Wire Wire Line
	6025 2725 6025 2875
Wire Wire Line
	4725 2825 4725 2775
$Comp
L SOC:FORWARDING_UNIT U?
U 1 1 5E9DCD3F
P 5700 4825
F 0 "U?" H 5700 5100 31  0001 C CNN
F 1 "FORWARDING_UNIT" H 5650 5000 39  0000 C CNN
F 2 "" H 5700 4825 31  0001 C CNN
F 3 "" H 5700 4825 31  0001 C CNN
	1    5700 4825
	1    0    0    -1  
$EndComp
Text Label 5350 5025 2    31   ~ 0
RDAddr_W
Text Label 5350 4950 2    31   ~ 0
RDAddr_M
Text Label 6175 4975 0    31   ~ 0
DBusForBSel
Text Label 6175 4900 0    31   ~ 0
DBusForASel
Text Label 5350 4875 2    31   ~ 0
RS2Addr_M
Wire Wire Line
	5975 2925 5975 2775
Wire Wire Line
	5875 2875 5875 3025
Text Label 2975 2350 2    31   ~ 0
IsBranch_E
Text Label 2975 2425 2    31   ~ 0
IsBranch_M
Text Label 5250 2725 0    31   ~ 0
Func3_E
Wire Wire Line
	2175 4225 2600 4225
Wire Wire Line
	1875 4000 1600 4000
Wire Wire Line
	1600 4000 1600 4225
Wire Wire Line
	1600 4225 1875 4225
Wire Wire Line
	3250 4450 1600 4450
Wire Wire Line
	1600 4450 1600 4300
Wire Wire Line
	1600 4300 1800 4300
Wire Wire Line
	3250 4075 3250 4450
$Comp
L SOC:BRANCH_UNIT U?
U 1 1 5EA17429
P 1625 3725
F 0 "U?" H 1525 4100 31  0001 C CNN
F 1 "BRANCH_UNIT" H 1550 3875 39  0000 C CNN
F 2 "" H 1525 4100 31  0001 C CNN
F 3 "" H 1525 4100 31  0001 C CNN
	1    1625 3725
	1    0    0    -1  
$EndComp
Wire Wire Line
	2175 3650 2350 3650
Wire Wire Line
	2350 3650 2350 4150
Wire Wire Line
	2350 4150 2600 4150
Text Label 1300 3725 2    31   ~ 0
Func3_M
Text Label 1300 3650 2    31   ~ 0
IsBranch_M
Text Label 2175 3650 0    31   ~ 0
TakeBranch
Text Label 2975 2500 2    31   ~ 0
TakeBranch
Wire Wire Line
	5225 3425 5325 3425
Wire Wire Line
	5225 3350 5325 3350
Wire Wire Line
	3725 3175 5025 3175
Wire Wire Line
	4675 2775 4725 2775
Wire Wire Line
	5225 2825 5925 2825
Wire Wire Line
	5225 2925 5725 2925
Wire Wire Line
	5225 3900 5675 3900
Wire Wire Line
	5225 2625 6125 2625
Wire Wire Line
	5225 2675 6075 2675
Wire Wire Line
	5225 2725 6025 2725
Wire Wire Line
	5225 2775 5975 2775
Wire Wire Line
	5225 2875 5875 2875
Wire Wire Line
	4725 2625 5025 2625
Wire Wire Line
	4725 2675 5025 2675
Wire Wire Line
	4725 2775 5025 2775
Wire Wire Line
	4725 2875 5025 2875
Wire Wire Line
	4725 2975 5025 2975
Wire Wire Line
	4725 2725 5025 2725
Wire Wire Line
	4725 2825 5025 2825
Wire Wire Line
	4725 2925 5025 2925
Wire Wire Line
	6100 4075 6150 4075
Text Label 6050 3975 2    31   ~ 0
DBusForBSel
Text Label 6000 4100 2    31   ~ 0
WBData_W
$Comp
L SOC:2-1Mux U?
U 1 1 5E9D59DD
P 6050 4075
F 0 "U?" H 6075 4400 50  0001 C CNN
F 1 "2-1Mux" H 6050 4225 50  0001 C CNN
F 2 "" H 6075 4400 50  0001 C CNN
F 3 "" H 6075 4400 50  0001 C CNN
	1    6050 4075
	1    0    0    -1  
$EndComp
Text Label 6000 4050 2    31   ~ 0
RS2_E
Text Label 5100 4475 3    31   ~ 0
En_E
Text Label 3600 3475 3    31   ~ 0
En_D
Text Label 6250 4450 3    31   ~ 0
En_M
Text Label 5150 4475 3    31   ~ 0
Clr_E
Text Label 3650 3475 3    31   ~ 0
Clr_D
Text Label 6300 4450 3    31   ~ 0
Clr_M
Text Label 3800 2000 0    31   ~ 0
En_E
Text Label 3800 2225 0    31   ~ 0
Clr_E
Text Label 3800 1950 0    31   ~ 0
En_D
Text Label 3800 2175 0    31   ~ 0
Clr_D
Text Label 3800 2050 0    31   ~ 0
En_M
Text Label 3800 2275 0    31   ~ 0
Clr_M
Text Label 3800 2100 0    31   ~ 0
En_W
Text Label 3800 2325 0    31   ~ 0
Clr_W
Text Label 2600 4075 2    31   ~ 0
PcEn0
$Comp
L SOC:HAZARD_UNIT U?
U 1 1 5EB8EEC9
P 3375 1900
F 0 "U?" H 3275 2275 31  0001 C CNN
F 1 "HAZARD_UNIT" H 3200 2125 39  0000 C CNN
F 2 "" H 3275 2275 31  0001 C CNN
F 3 "" H 3275 2275 31  0001 C CNN
	1    3375 1900
	1    0    0    -1  
$EndComp
Text Label 1300 3800 2    31   ~ 0
AluZero_M
Wire Wire Line
	6150 3825 6150 4075
Wire Wire Line
	5675 3900 6100 3900
Connection ~ 5675 3900
Wire Wire Line
	6100 3675 6100 3900
Text Label 6375 3175 0    31   ~ 0
PC_M
Text Label 6175 4225 2    31   ~ 0
RS2Addr_E
Text Label 6375 3675 0    31   ~ 0
Imm_M
Wire Wire Line
	5975 3375 5975 3125
Wire Wire Line
	5775 3425 5800 3425
Wire Wire Line
	5675 3775 5725 3775
Wire Wire Line
	5550 3675 5725 3675
Wire Wire Line
	6125 2775 6175 2775
Wire Wire Line
	6075 2825 6175 2825
Wire Wire Line
	6175 2875 6025 2875
Wire Wire Line
	6175 2925 5975 2925
Wire Wire Line
	5925 2975 6175 2975
Wire Wire Line
	5875 3025 6175 3025
Wire Wire Line
	5225 3175 6175 3175
$Comp
L SOC:ALU U?
U 1 1 5E76A565
P 5850 3600
F 0 "U?" H 5925 3278 50  0001 C CNN
F 1 "ALU" H 5900 3900 39  0000 C CNN
F 2 "" H 5950 3600 50  0001 C CNN
F 3 "" H 5950 3600 50  0001 C CNN
	1    5850 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3675 6175 3675
Wire Wire Line
	6150 3825 6175 3825
Wire Wire Line
	5225 4300 6175 4300
$Comp
L SOC:IE-MEM U?
U 1 1 5E77694B
P 6275 3150
F 0 "U?" H 6275 3500 50  0001 C CNN
F 1 "IE_MEM" H 6275 3600 39  0000 C CNN
F 2 "" H 6275 3500 50  0001 C CNN
F 3 "" H 6275 3500 50  0001 C CNN
	1    6275 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6375 4300 7400 4300
Wire Wire Line
	6375 3825 6575 3825
Text Label 6575 3875 2    31   ~ 0
WBData_W
Wire Wire Line
	6675 3850 6825 3850
Wire Wire Line
	6375 3625 6725 3625
Wire Wire Line
	6375 2775 6925 2775
Wire Wire Line
	6375 2825 6875 2825
Wire Wire Line
	6375 2875 6825 2875
Wire Wire Line
	6375 2925 6775 2925
Wire Wire Line
	6375 2975 6675 2975
Text Label 7525 4450 3    31   ~ 0
Clr_W
Text Label 7475 4450 3    31   ~ 0
En_W
$Comp
L SOC:2-1Mux U?
U 1 1 5E9C588E
P 6625 3850
F 0 "U?" H 6650 4175 50  0001 C CNN
F 1 "2-1Mux" H 6625 4000 50  0001 C CNN
F 2 "" H 6650 4175 50  0001 C CNN
F 3 "" H 6650 4175 50  0001 C CNN
	1    6625 3850
	1    0    0    -1  
$EndComp
Text Label 6625 3750 2    31   ~ 0
DBusForASel
Connection ~ 6725 3625
Wire Wire Line
	7575 3575 7575 3525
Wire Wire Line
	7425 3575 7575 3575
Wire Wire Line
	7425 3525 7425 3575
Wire Wire Line
	7725 3350 7600 3350
Wire Wire Line
	7725 3425 7725 3350
Wire Wire Line
	7800 3425 7725 3425
Wire Wire Line
	6725 3350 7400 3350
Wire Wire Line
	6875 3025 7400 3025
Wire Wire Line
	6925 2975 7400 2975
Wire Wire Line
	7600 3025 7875 3025
Text Label 6550 2875 0    31   ~ 0
Func3_M
Text Label 6375 3025 0    31   ~ 0
IsBranch_M
Wire Wire Line
	6675 2975 6675 3775
Wire Wire Line
	6825 3525 6825 2875
$Comp
L SOC:DBUS U?
U 1 1 5E8FAB0E
P 7075 3650
F 0 "U?" H 6925 3950 50  0001 C CNN
F 1 "DBUS" H 6950 3875 39  0000 C CNN
F 2 "" H 6975 3900 50  0001 C CNN
F 3 "" H 6975 3900 50  0001 C CNN
	1    7075 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6725 3625 6825 3625
Wire Wire Line
	6775 3700 6825 3700
Wire Wire Line
	6675 3775 6825 3775
Wire Wire Line
	6775 2925 6775 3700
Wire Wire Line
	6875 2825 6875 3025
Wire Wire Line
	6925 2775 6925 2975
Text Label 6375 4225 0    31   ~ 0
RS2Addr_M
Text Label 6375 4300 0    31   ~ 0
RDAddr_M
Wire Wire Line
	6725 3350 6725 3625
Text Label 7075 2975 0    31   ~ 0
RegWrEn_M
Text Label 7975 3475 0    31   ~ 0
WBData_W
Text Label 6675 3425 1    31   ~ 0
DRamWe_M
Text Label 7875 3250 1    31   ~ 0
WBSrc_W
Text Label 7075 3025 0    31   ~ 0
WBSrc_M
Text Label 6900 3350 0    31   ~ 0
AluRes_M
Wire Wire Line
	7875 3025 7875 3325
Text Label 7600 2975 0    31   ~ 0
RegWrEn_W
Text Label 7600 4300 0    31   ~ 0
RDAddr_W
Text Label 6375 3550 0    31   ~ 0
AluZero_M
$Comp
L SOC:WB-MUX U?
U 1 1 5E7BC4C4
P 7875 3475
F 0 "U?" H 7875 3900 50  0001 C CNN
F 1 "WB-MUX" H 7875 3825 50  0001 C CNN
F 2 "" H 7875 3450 50  0001 C CNN
F 3 "" H 7875 3450 50  0001 C CNN
	1    7875 3475
	1    0    0    -1  
$EndComp
Text Label 1800 4150 2    31   ~ 0
Imm_M
$Comp
L SOC:MEM-WB U?
U 1 1 5ECE5DAF
P 7500 3075
F 0 "U?" H 7500 3300 50  0001 C CNN
F 1 "MEM-WB" H 7500 3301 39  0000 C CNN
F 2 "" H 7525 3075 50  0001 C CNN
F 3 "" H 7525 3075 50  0001 C CNN
	1    7500 3075
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3525 7425 3525
Wire Wire Line
	7575 3525 7800 3525
Text Label 7600 3350 0    31   ~ 0
AluRes_W
Text Label 5600 3425 2    31   ~ 0
AluRes_W
Text Label 5400 3750 2    31   ~ 0
AluRes_W
Text Label 2975 2200 2    31   ~ 0
WBSrc_M
Text Label 2975 2275 2    31   ~ 0
WBSrc_W
Text Label 2975 1975 2    31   ~ 0
RDAddr_M
Text Label 2975 2050 2    31   ~ 0
RDAddr_W
Wire Wire Line
	3125 4075 3250 4075
Wire Wire Line
	3400 4075 3250 4075
$Comp
L SOC:IRAM U?
U 1 1 5E9D39C4
P 3600 4150
F 0 "U?" H 3500 4400 50  0001 C CNN
F 1 "IRAM" H 3500 4325 39  0000 C CNN
F 2 "" H 3450 4325 50  0001 C CNN
F 3 "" H 3450 4325 50  0001 C CNN
	1    3600 4150
	1    0    0    -1  
$EndComp
Text Label 3800 1850 0    31   ~ 0
IRamRdEn
Text Label 3800 1800 0    31   ~ 0
IRamOZero
Text Label 3600 4250 3    31   ~ 0
IRamRdEn
Text Label 3650 4250 3    31   ~ 0
IRamOZero
$EndSCHEMATC
