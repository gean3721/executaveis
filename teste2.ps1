$url = "https://github.com/gean3721/executaveis/raw/main/scriptcnc.exe"
$destination = [System.Environment]::GetFolderPath("Desktop") + "\scriptcnc.exe"

Invoke-WebRequest -Uri $url -OutFile $destination

# Verifica se o download foi bem-sucedido
if (Test-Path $destination) {
    Start-Process -FilePath $destination
} else {
    Write-Host "Erro ao baixar o arquivo."
}