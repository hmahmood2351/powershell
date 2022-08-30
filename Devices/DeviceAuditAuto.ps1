#Takes in spreadsheet, examines name field and device name.
#Searches up via name and compares entry in Azure AD (might also need insight 
#if there is a user using the CMDB entry name via the jira API

#Systems: Insight, Azure AD
#Dependency: works on the assumption that we have a spreadsheet of devices to work from (via exporting from Insight. Useful because it includes CMDB key as well)

#Plan: iterate through list of users. Find equivalent primary user in Azure AD and check if devices match. 2) Compare with Insight based on CMDB entry.
#      then have a list of users with possible incorrect matching between insight and azure ad and have it output to a txt file to be added in manually and/or (automatically?)
#      devices that are not active in azure ad and empty in insight may be 'invincible' to this script 

$obj = Import-Excel -path 'C:\Users\Mohammed.Mahmood\OneDrive - Royal Opera House\Desktop\Stuff\Scripting\powershell\Devices\useraudit.xlsx' -WorkSheetname 'nouser' 
$count = Import-Excel -path 'C:\Users\Mohammed.Mahmood\OneDrive - Royal Opera House\Desktop\Stuff\Scripting\powershell\Devices\useraudit.xlsx' -WorkSheetname 'nouser' | Format-Table | Measure-Object

Write-Output ""
Write-Output "Number of entries:" 
Write-Output $count 

foreach ($i in $obj | select-Object key, 'asset tag', user, 'serial number')
{
#Write-Output $i 
if ($i.'Asset Tag' -eq "4566") {$founddevice=$i}
}

$founddevice

Connect-AzureAD
$userlookup = Get-AzureADUser -Filter "userPrincipalName eq 'alex.hill@roh.org.uk'"
$objectid = $userlookup.ObjectId
$devicelookup = Get-AzureADUserRegisteredDevice -ObjectId "$($objectid)"
$devicenames = $devicelookup | Select DisplayName



foreach ($device in $devicenames) {Write-Output $device}

