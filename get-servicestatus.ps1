Param (
    [Parameter(Mandatory=$true)]
    [string[]]
      $Computername
)

foreach ($name in $Computername) {write-output $name}
write-output "required parameter $Computername"

$Services = Get-Service

Foreach ($service in $services) {
    $ServiceStatus = $service.status 
    $ServiceDisplayName = $service.displayname 
    if ($ServiceStatus -eq "Running") {
        Write-Output "Service OK status of $ServiceDisplayName is $ServiceStatus" 
    }
    else {
        Write-Output "Check Service - Status of $ServiceDisplayName is $ServiceStatus"
    }
}