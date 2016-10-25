#########################################################################################
# Removes Old files
#########################################################################################

$temppath = "c:\windows\temp"
$limit = (Get-Date).AddDays(-7)

#########################################################################################
# Delete Old files older than 7 days
# or ls | where-object {(new-timespan $_.LastWriteTime).days -ge 7}
#########################################################################################

get-childitem $temppath -recurse | Where-Object { !$_.PSIsContainer -and $_.LastWriteTime -lt $limit } | Remove-Item -Force

#########################################################################################
# Delete empty directories left after deleting files
#########################################################################################

Get-ChildItem -Path $temppath -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null }  | Remove-Item -Force -Recurse