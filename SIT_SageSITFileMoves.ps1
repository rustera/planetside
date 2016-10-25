#######################################################################################
#
# Move files from NAS location to server
# Move files from server to NAS
#
#######################################################################################
$exclude = @('ITM*.txt','INV*.txt')

IF (test-path "\\sagex3sit\sagex3\data\Halperns\Import\*")
{

Move-Item \\sagex3sit\sagex3\data\Halperns\Import\ITM_IT1*.txt \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport\YIMPHALIT1 -force
Move-Item \\sagex3sit\sagex3\data\Halperns\Import\ITM_IT2*.txt \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport\YIMPHALIT2 -force
Move-Item \\sagex3sit\sagex3\data\Halperns\Import\ITM_IT3*.txt \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport\YIMPHALIT3 -force
Move-Item \\sagex3sit\sagex3\data\Halperns\Import\ITM_IT4*.txt \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport\YIMPHALIT4 -force
Move-Item \\sagex3sit\sagex3\data\Halperns\Import\INV_IN1*.txt \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport\YIMPSLSIN1 -force
Move-Item \\sagex3sit\sagex3\data\Halperns\Import\INV_IN2*.txt \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport\YIMPSLSIN2 -force
Move-Item \\sagex3sit\sagex3\data\Halperns\Import\INV_IN3*.txt \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport\YIMPSLSIN3 -force
Move-Item \\sagex3sit\sagex3\data\Halperns\Import\INV_IN4*.txt \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport\YIMPSLSIN4 -force
Move-Item \\sagex3sit\sagex3\data\Halperns\Import\*.txt \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport -Exclude $exclude -force
}

IF (test-path "\\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YExport\*")
{

Move-Item \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YExport\*.xml \\sagex3sit\sagex3\data\Halperns\Export -force

}

IF (test-path "\\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport\Error\*")
{

Move-Item \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport\Error\*.* \\sagex3sit\sagex3\data\Halperns\Export -force

}

IF (test-path "\\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\TRA\*")
{

robocopy \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\TRA \\sagex3sit\sagex3\data\Halperns\Export\TRA /MIR /XO /XA:H /R:0 /log+:\\sagex3sitservice\c$\admin\pslog\SageX3LogFileSync.txt /TS /FP

}