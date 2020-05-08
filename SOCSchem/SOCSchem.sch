EESchema Schematic File Version 4
LIBS:SOCSchem-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 9775 700  975  750 
U 5EB97B98
F0 "CPU" 39
F1 "CPU.sch" 39
F2 "DBUS_Addr" O L 9775 950 50 
F3 "DBUS_ByteEn" O L 9775 1025 50 
F4 "DBUS_Read" O L 9775 1100 50 
F5 "DBUS_Write" O L 9775 1175 50 
F6 "DBUS_Rd" I L 9775 1250 50 
F7 "DBUS_Wd" O L 9775 1325 50 
F8 "DBUS_Req" O L 9775 750 50 
F9 "DBUS_Gnt" I L 9775 825 50 
F10 "DBUS_WaitReq" I L 9775 1400 50 
$EndSheet
$Comp
L SOC:ARBITER U?
U 1 1 5EBABA86
P 8325 750
F 0 "U?" H 8400 1150 31  0001 C CNN
F 1 "ARBITER" H 8350 850 39  0000 C CNN
F 2 "" H 8400 1150 31  0001 C CNN
F 3 "" H 8400 1150 31  0001 C CNN
	1    8325 750 
	1    0    0    -1  
$EndComp
Text Label 9775 750  2    39   ~ 0
DBUS_Req
Text Label 9775 825  2    39   ~ 0
DBUS_Gnt
Text Label 8175 750  2    39   ~ 0
DBUS_Req
Text Label 8600 750  0    39   ~ 0
DBUS_Gnt
$EndSCHEMATC
