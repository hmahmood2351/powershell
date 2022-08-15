$data = Get-Service | where-Object status -eq 'Stopped' | select-Object Name, Status

$data | export-csv .\testing.csv

get-content .\services.csv | more