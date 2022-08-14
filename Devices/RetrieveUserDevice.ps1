#Retrieve associated device with user from Azure AD
#May be useful for audits or other activities

#TODO - reading list of names from .txt file, and then .csv file

#Dependencies - AzureAD 2.0.2.140

Connect-AzureAD


while($true)
{
$user = Read-Host -Prompt "Enter in user's email. n to quit"
Write-Output $user

$userlookup = Get-AzureADUser -Filter "userPrincipalName eq '$($user)'"
$objectid = $userlookup.ObjectId


$devicelookup = Get-AzureADUserRegisteredDevice -ObjectId "$($objectid)"
# Write-Output $devicelookup

Write-Output ""
Write-Output ""
Write-Output "Found devices for: $($user)"
Write-Output "There are $($devicelookup.count) devices associated with $($user)"


foreach ($object in $devicelookup)
{
Write-Output $object.DisplayName
}



if ($user -eq "n")
{
exit 
}


}

#debugging - check variable type
# Write-Output $userlookup.GetType().Name