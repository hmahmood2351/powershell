#Adds from a list of e-mail addresses in text file OutlookAddDistributionGroup.txt


### USAGE EXAMPLE
# [scriptname] [email of distribution list]
# .\OutlookAddDistributionGroupMembers.ps1 Ushers@roh.org.uk

###

$group = $args[0]

$users = Get-Content $PSScriptRoot\OutlookAddDistributionGroup.txt

foreach ($i in $users)
{
Add-DistributionGroupMember -Identity "$($group)" -Member "$($i)"
}