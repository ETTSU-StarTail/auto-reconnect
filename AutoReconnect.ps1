[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [String]
    $AdapterName,
    [Parameter()]
    [int]
    $Interval = 30
)

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "管理者権限で実行してください"
    return
}

Write-Host "無限ループのため、Ctrl + C で終了してください。"

do {
    $AdapterStatus = (Get-NetAdapter "$AdapterName").Status
    Write-Host "$AdapterName の接続状態: $AdapterStatus"
    if ($AdapterStatus -eq "Disconnected") {
        Write-Host "$AdapterName の切断を検知、再起動します。"
        Restart-NetAdapter $AdapterName
    }

    cmd /c timeout $Interval
} while ($true)