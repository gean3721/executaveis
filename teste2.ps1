$url = "https://www.example.com/arquivo.exe"
$destination = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "arquivo.exe")

Invoke-WebRequest -Uri $url -OutFile $destination

# Verifica se o download foi bem-sucedido
if (Test-Path $destination) {
    Start-Process -FilePath $destination
} else {
    Write-Host "Erro ao baixar o arquivo."
}
