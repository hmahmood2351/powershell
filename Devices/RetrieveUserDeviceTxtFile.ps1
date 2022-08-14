#Similar to RetrieveUserDevice but works from a text file containing a list of e-mail addresses separated by newlines 

#runs on a file called emaildata.txt in the same directory
#appends to a file called retrieveuserdevicedata.txt in the same directory

$emailfile = Get-Content $PSScriptRoot\emaildata.txt

foreach ($i in $emailfile)
{

Add-Content $PSScriptRoot\retrieveuserdevicedata.txt $i

$userlookup = Get-AzureADUser -Filter "userPrincipalName eq '$($i)'"
$objectid = $userlookup.ObjectId


$devicelookup = Get-AzureADUserRegisteredDevice -ObjectId "$($objectid)"
# Write-Output $devicelookup

Write-Output ""
Write-Output ""
Write-Output "Found devices for: $($i)"
Write-Output "There are $($devicelookup.count) devices associated with $($i)"


foreach ($object in $devicelookup)
{
$objectiddevice = $object.DisplayName

Add-Content $PSScriptRoot\retrieveuserdevicedata.txt $objectiddevice
Write-Output $objectiddevice

}

Add-Content $PSScriptRoot\retrieveuserdevicedata.txt ""
Add-Content $PSScriptRoot\retrieveuserdevicedata.txt ""

}