########################################################################################################
#
# Appends the last 24 hours of logons/logoffs and failures to a text file in the autobackup directory
#
########################################################################################################

# start date, past 24 hours
$startDate = (get-date).adddays(-1) 


"Below are the logons/logoffs recorded in the past 24 Hours starting: $startDate" | Out-File c:\autobackup\accesslog.txt -Append

get-winevent -logname Microsoft-Windows-TerminalServices-LocalSessionManager/Operational |Where TimeCreated -gt (get-date).adddays(-1)|where {$_.id -eq "24" -OR $_.id -eq "21" -or $_.id -eq "23"} |select TimeCreated,Message |FT -auto -wrap |out-file c:\autobackup\accesslog.txt -Append
#GET-EVENTLOG -Logname Security |Where TimeCreated -gt (get-date).adddays(-1)|where { $_.EntryType -eq 'FailureAudit' -AND $_.EventID -eq '4625' -AND $_.message -match "User32" } |FL |out-file c:\autobackup\accesslog.txt -Append
# Table Creation
$LogonActivityTable = New-Object system.Data.DataTable “Logon/Logoff Activity”

# Create Columns
$date = New-Object system.Data.DataColumn "Date",([string])
$type = New-Object system.Data.DataColumn "Type",([string])
$status = New-Object system.Data.DataColumn "Status",([string])
$user = New-Object system.Data.DataColumn "User",([string])
$ipaddress = New-Object system.Data.DataColumn "IPAddress",([string])

# Add Columns to Table
$LogonActivityTable.columns.add($date)
$LogonActivityTable.columns.add($type)
$LogonActivityTable.columns.add($status)
$LogonActivityTable.columns.add($user)
$LogonActivityTable.columns.add($ipaddress)

# start date, past 24 hours
$startDate = (get-date).adddays(-1) 

# Store each event from the Security Log with the specificed dates and computer in an array 
$log = Get-Eventlog -LogName Security -after $startDate 
 
# Loop through each security event, print all login/logoffs with type, date/time, status, account name, and IP address if remote 

    foreach ($i in $log){ 
        if (($i.EventID -eq 4625 ) -and ($i.ReplacementStrings[10] -eq 10)){ 
            # Create a Row
            $row = $LogonActivityTable.NewRow()

            # Enter Data into the Row
            $row.date =  $i.TimeGenerated
            $row.type =  "Logon - Failure"
            $row.user =  $i.ReplacementStrings[5]
            $row.ipaddress = $i.ReplacementStrings[19]

            # Add the Row to the Table
            $LogonActivityTable.Rows.Add($row)
        } 
     }    
# Default output, returns the table object in list form by default

$LogonActivityTable | Out-File C:\autobackup\accesslog.txt -Append

########################################################################################################
#
# Checks for first of the month, if it is first of the month the file is moved to Rottweiler and renamed
# with the date and server name, and then deleted off the server.
#
########################################################################################################

$a = get-date
If ($a.day -eq 1) {

$SRV = $env:computername
$Now = get-date
$DateStr = $now.ToString('MM-dd-yyyy')
$copy = $SRV + "_" + $DateStr + "_AccessLog.txt"

Copy-Item C:\autobackup\accesslog.txt "\\rottweiler\c$\SecurityFiles\$COPY"

Remove-Item C:\autobackup\accesslog.txt -Confirm:$false

}
