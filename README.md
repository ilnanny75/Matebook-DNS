\# 🌐 DNS-Matebook Portable (Windows 11)



Un'utility leggerissima e "portable" scritta in PowerShell per cambiare rapidamente i server DNS su Windows 11. Ottimizzata per dispositivi Huawei Matebook, ma compatibile con qualsiasi PC Windows.



\## ✨ Caratteristiche

\- \*\*Zero Installazione\*\*: Un singolo file `.exe` pronto all'uso.

\- \*\*Auto-Root\*\*: Richiede automaticamente i privilegi di amministratore all'avvio.

\- \*\*Supporto Dual-Stack\*\*: Configura automaticamente sia \*\*IPv4\*\* che \*\*IPv6\*\*.

\- \*\*Menu Interattivo\*\*:

&#x20; 1. \*\*Google DNS\*\* (8.8.8.8 / 8.8.4.4)

&#x20; 2. \*\*Cloudflare DNS\*\* (1.1.1.1 / 1.0.0.1)

&#x20; 3. \*\*Ripristino DHCP\*\* (DNS automatici del router)

&#x20; 4. \*\*Stato Rete\*\*: Visualizza i DNS attualmente in uso.



\## 🚀 Download \& Utilizzo

Scarica l'eseguibile dalla cartella principale o dalla sezione \[Releases](link-alle-tue-releases), fai doppio clic e scegli l'opzione desiderata.



\## 🛠️ Come compilare (Build)

Se desideri modificare il codice sorgente `.ps1` e generare un nuovo EXE:

1\. Installa il modulo: `Install-Module -Name ps2exe`

2\. Compila:

```powershell

Invoke-PS2EXE .\\dns-matebook.ps1 .\\dns-matebook.exe -IconFile ".\\icon.ico" -Title "DNS Matebook" -RequireAdmin

