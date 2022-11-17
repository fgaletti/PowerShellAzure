$apiSettings = Get-Content -Path $PSScriptRoot\prod.appsettings.json | ConvertFrom-Json

foreach($settings in $apiSettings)
{
    $key= "$($settings.name)=$($settings.value)"
    write-host $key
    az webapp config appsettings set --name testwebappfay `
        --resource-group fayservicingdemo `
        --subscription "Pay-As-You-Go" `
        --settings $key
    
    Write-Host "Sleep 5 seconds, for app service to restart"
    Start-Sleep -Seconds 5
}
