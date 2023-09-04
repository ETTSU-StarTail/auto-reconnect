[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [String]
    $AdapterName,
    [Parameter()]
    [int]
    $Interval = 30,
    [Parameter()]
    [switch]
    $Logging
)

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "管理者権限で実行してください"
    return
}

Write-Host "無限ループのため、Ctrl + C で終了してください。"

do {
    $DateTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $AdapterStatus = (Get-NetAdapter "$AdapterName").Status
    $AdapterStatusLog = "$DateTime - $AdapterName の接続状態: $AdapterStatus"

    Write-Host $AdapterStatusLog

    if ($Logging) {
        Write-Output $AdapterStatusLog | Out-File -FilePath reconnect.log -Encoding utf8 -Append
    }

    if ($AdapterStatus -eq "Disconnected") {
        $RestartLog = "$DateTime - $AdapterName の切断を検知 → 再起動"

        Write-Host -ForegroundColor Red $RestartLog

        if ($Logging) {
            Write-Output "$RestartLog" | Out-File -FilePath reconnect.log -Encoding utf8 -Append
        }

        Restart-NetAdapter $AdapterName
    }

    # cmd /c timeout $Interval
    Start-Sleep -Seconds $Interval
} while ($true)