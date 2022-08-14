$data = Get-Service | where-Object status -eq 'Stopped' | select-Object Name, Status

$data | export-csv .\services.csv

get-content .\services.csv | more