# $members = Get-DistributionGroupMember -Identity "Archives" | Format-List

# Views members of a certain distribution list
# views permissions 

$param1 = $args[0]
Write-Host $param1 


$members = Get-DistributionGroupMember -Identity "$($param1)" | Format-List -Property PrimarySmtpAddress, Id 

Write-Output "Members:"

foreach ($i in $members) 
{
write-output $i
}


Write-Output "Owners:"

$group = Get-DistributionGroup -Identity "$($param1)" | Format-List -Property ManagedBy

foreach ($i in $group)
{
Write-Output $i
}