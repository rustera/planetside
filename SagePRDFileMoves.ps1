#######################################################################################
#
# Move files from NAS location to server
# Move files from server to NAS
#
#######################################################################################
$exclude = @('ITM*.txt','INV*.txt')

IF (test-path "\\sagex3prd\sagex3\data\Halperns\Import\*")
{

Move-Item \\sagex3prd\sagex3\data\Halperns\Import\ITM_IT1*.txt \\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YImport\YIMPHALIT1 -force
Move-Item \\sagex3prd\sagex3\data\Halperns\Import\ITM_IT2*.txt \\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YImport\YIMPHALIT2 -force
Move-Item \\sagex3prd\sagex3\data\Halperns\Import\ITM_IT3*.txt \\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YImport\YIMPHALIT3 -force
Move-Item \\sagex3prd\sagex3\data\Halperns\Import\ITM_IT4*.txt \\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YImport\YIMPHALIT4 -force
Move-Item \\sagex3prd\sagex3\data\Halperns\Import\INV_IN1*.txt \\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YImport\YIMPSLSIN1 -force
Move-Item \\sagex3prd\sagex3\data\Halperns\Import\INV_IN2*.txt \\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YImport\YIMPSLSIN2 -force
Move-Item \\sagex3prd\sagex3\data\Halperns\Import\INV_IN3*.txt \\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YImport\YIMPSLSIN3 -force
Move-Item \\sagex3prd\sagex3\data\Halperns\Import\INV_IN4*.txt \\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YImport\YIMPSLSIN4 -force
Move-Item \\sagex3prd\sagex3\data\Halperns\Import\*.txt \\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YImport -Exclude $exclude -force
}

IF (test-path "\\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YExport\*")
{

Move-Item \\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YExport\*.xml \\sagex3prd\sagex3\data\Halperns\Export -force

}

IF (test-path "\\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YImport\Error\*")
{

Move-Item \\sagex3service\c$\Sage\X3V7\folders\HALLIVE\YImport\Error\*.* \\sagex3prd\sagex3\data\Halperns\Export -force

}

#IF (test-path "\\sagex3service\c$\Sage\X3V7\folders\HALLIVE\TRA\*")
#{

#robocopy \\sagex3service\c$\Sage\X3V7\folders\HALLIVE\TRA \\sagex3prd\sagex3\data\Halperns\Export\TRA /MIR /Z /XA:H /W:5 /log:\\sagex3service\c$\admin\pslog\SageX3LogFileSync.txt

#}

#IF (test-path "\\sagex3service\c$\Sage\X3V7\folders\SERVX3\TRA*")
#{

#robocopy \\sagex3service\c$\Sage\X3V7\folders\SERVX3\TRA \\sagex3prd\sagex3\data\Halperns\Export\SERVX3\TRA /MIR /Z /XA:H /W:5 /log:\\sagex3service\c$\admin\pslog\ServX3LogFileSync.txt

#}