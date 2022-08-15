#Adds from a list of e-mail addresses in text file OutlookAddDistributionGroup.txt to distribution group specified via script argument

$group = $args[0]

$users = Get-Content $PSScriptRoot\OutlookAddDistributionGroup.txt

foreach ($i in $users)
{
Add-DistributionGroupMember -Identity "$($group)" -Member "$($i)"
}