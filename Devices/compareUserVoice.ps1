Connect-MicrosoftTeams 

$object1 = Get-Csonlineuser first.lastname@roh.org.uk
$object2 = Get-Csonlineuser first.lastname@roh.org.uk



foreach ($i in $object1.PSObject.Properties) 
{

$propertyname = $i.Name

Write-Output $propertyname
Write-Output Object1
Write-Output $object1.$propertyname
Write-Output Object2
Write-Output $object2.$propertyname

Write-Output ""


if ($object1.$propertyname -ne $object2.$propertyname) {write-output ---------------} 

Write-Output ""



}