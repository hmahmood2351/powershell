#Takes in a CSV file named ddiaudit.xlsx
#Must be in the same directory as the script file 
#outputs a list of numbers that do not have any assigned users into txt file (by checking users actually assigned numbers on Teams Online)

### USAGE EXAMPLE
# [scriptname]
# .\phoneddiaudit.ps1

###



$uncheckednumbers = import-excel ddiaudit.xlsx | select-object "Full DDI" #gets all numbers known in the spreadsheet with DDI
$globalteamsnumbers = get-csonlineuser | select-object -Property "lineuri" #gets all known teams numbers with lineuri only


foreach ($i in $uncheckednumbers) {

}

# get-csonlineuser | where-object -Property "lineuri" -like 



#check 

# get-csonlineuser | where-object -Property "lineuri" -like "*+44*" | select-object *


# $globalteamsnumbers.lineuri | foreach-object {if ($_ -like "*+44*") {$_}}