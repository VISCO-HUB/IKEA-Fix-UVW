/*
[INFO]

NAME = Fix UVW
AUTHOR = MastaMan
DEV = ViscoCG
HELP = \help\
CAT=ARCHVIZ
LAUNCH=\\visco.local\data\Instal_Sync\scripts\scripts\_IKEA\IKEA Fix UVW.ms

[ABOUT]

Toolbar button for Auto Material=

[SCRIPT]

*/

macroScript IKEA_FixUVW
category:"[IKEA]"
toolTip:"Fix UVW"
(
	try(fileIn(getIniSetting (getThisScriptFilename()) "INFO" "LAUNCH"))catch(messageBox "Lost network connection!" title: "Warning!")	
)