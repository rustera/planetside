#######################################################################################
#
# Move files from NAS location to server
# Move files from server to NAS
#
#######################################################################################

IF (test-path "\\sagex3sit\sagex3\data\Halperns\Import\*")
{


#Move-Item \\sagex3sit\sagex3\data\Halperns\Import\*.txt \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport -force

}

IF (test-path "\\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YExport\*")
{

Move-Item \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YExport\*.xml \\sagex3sit\sagex3\data\Halperns\Export -force

}

IF (test-path "\\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport\Error\*")
{

Move-Item \\sagex3sitservice\c$\Sage\X3V7\folders\HALPILOT\YImport\Error\*.* \\sagex3sit\sagex3\data\Halperns\Export -force

}