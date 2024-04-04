# powershell -executionpolicy bypass -FILE ./workstation.ps1

Write-Host "Checking WS state..."
$WS = "fh-workstation-oss-ikerin-2"
$WS_STATE = & { Invoke-Expression "gcloud workstations describe $WS --format 'get(state)'" }
Write-Host "Workstation: $WS_STATE"
If ($WS_STATE -eq 'STATE_STOPPED') {
    Invoke-Expression "gcloud workstations start $WS"
}
elseif ($WS_STATE -eq 'STATE_RUNNING') {
    Write-Host "Workstation already running"
}
else {
    Write-Host "Aborting script"
}

$ports = @(
    [pscustomobject]@{Workstation = 22; Local = 1025 }
    [pscustomobject]@{Workstation = 8080; Local = 8080 }
    [pscustomobject]@{Workstation = 5432; Local = 5432 }
)

# Start the (thread) jobs.
# You could use `Start-Job` here, but that would be more resource-intensive
# and make the script run considerably longer.
$jobs = $ports | Foreach-Object { 
    Start-Job -ScriptBlock {
        Param([string]$commnad)
        Invoke-Expression $commnad
    } -ArgumentList "gcloud workstations start-tcp-tunnel $WS $($_.Workstation) --local-host-port :$($_.Local)"
}

# Wait until all jobs have completed, passing their output through as it
# is received, and automatically clean up afterwards.
$jobs | Receive-Job -Wait -AutoRemoveJob
