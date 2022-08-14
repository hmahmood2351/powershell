#Similar to RetrieveUserDevice but works from a list of supplied e-mail addresses


$emailaddresses = New-Object -TypeName 'System.Collections.ArrayList';


while ($true)
{
$input = Read-Host -prompt "Type in all e-mail addresses to lookup. n to finish"

if ($input -eq "n"){ break }

[void]$emailaddresses.Add($input)
}





foreach ($i in $emailaddresses)
{


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
Write-Output $object.DisplayName
}



}
