$list = Get-Content serverList.txt
$tabs = ""

foreach ($hName in $list) {
    #Get size of the hostname
    $size = $hName.Length
    echo $size

    #Check size and set tabs
    if ($size -le 5)                    { $tabs = "`t`t`t`t`t" }
    if ($size -le 10)                   { $tabs = "`t`t`t`t" }
    if ($size -gt 10 -and $size -lt 14) { $tabs = "`t`t`t" }
    if ($size -gt 14 -and $size -lt 18) { $tabs = "`t`t" }
    if ($size -ge 18 -and $size -lt 20) { $tabs = "`t" }
    if ($size -ge 20 -and $size -lt 24) { $tabs = "" }

    if(Test-Connection -ComputerName $hName -Count 1 -Quiet) {
        Write-Host "$hName $tabs- Online"        
    }
    else {
        Write-Host "$hName $tabs- Offline"
    }
}
