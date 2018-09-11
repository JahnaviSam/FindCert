
Clear-Content -Path D:\scripts\Result.CSV

$serverList=@(Get-Content "C:\Users\abch\Desktop\server.txt");

"ServerName`tRemark" | Out-File D:\scripts\Result.CSV -Append

Foreach($server in $serverList)
{

$Remark = Invoke-Command -ComputerName $server -ScriptBlock {
$global:Output = ''
$decCert = Get-ChildItem  Cert:\LocalMachine\123wfd5454cgfg
$mayCert = Get-ChildItem  Cert:\LocalMachine\CA\dfw23232

if ($decCert -ne $null -and $mayCert -eq $null) { $global:Output = "Node is affected" } else {$global:Output = "Node is not Affected" }
Return $global:Output
}
}

"$Server`t$Remark" | Out-File D:\scripts\Result.CSV -Append

}

