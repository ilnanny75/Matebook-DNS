# Sblocca l'esecuzione per la sessione corrente
Set-ExecutionPolicy Bypass -Scope Process -Force

# Controllo privilegi Amministratore
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

function Update-DNS ([string[]]$dns) {
    Write-Host "`n[i] Configurazione in corso su Wi-Fi..." -ForegroundColor Cyan
    Set-DnsClientServerAddress -InterfaceAlias "Wi-Fi" -ServerAddresses $dns
    ipconfig /flushdns | Out-Null
    Write-Host "[V] Operazione completata!" -ForegroundColor Green
    Start-Sleep -Seconds 2
}

do {
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "       DNS-MATEBOOK PORTABLE v3.0        " -ForegroundColor Magenta
    Write-Host "==========================================" -ForegroundColor Magenta
    Write-Host "1) Google DNS (8.8.8.8 / 8.8.4.4)"
    Write-Host "2) Cloudflare DNS (1.1.1.1 / 1.0.0.1)"
    Write-Host "3) Ripristina Automatici (DHCP)"
    Write-Host "4) Mostra DNS attuali"
    Write-Host "5) Esci"
    Write-Host "------------------------------------------"
    $choice = Read-Host "Scegli un'opzione"

    switch ($choice) {
        "1" { Update-DNS @("8.8.8.8","8.8.4.4","2001:4860:4860::8888","2001:4860:4860::8844") }
        "2" { Update-DNS @("1.1.1.1","1.0.0.1","2606:4700:4700::1111","2606:4700:4700::1001") }
        "3" { Set-DnsClientServerAddress -InterfaceAlias "Wi-Fi" -ResetServerAddresses; ipconfig /flushdns | Out-Null; Write-Host "Reset effettuato!" -ForegroundColor Green; Start-Sleep -2 }
        "4" { Get-DnsClientServerAddress -InterfaceAlias "Wi-Fi"; Read-Host "`nPremi INVIO per tornare al menu" }
    }
} while ($choice -ne "5")