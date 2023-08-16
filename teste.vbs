Set objShell = CreateObject("WScript.Shell")

url = "https://github.com/gean3721/executaveis/raw/main/scriptcnc.exe"
destination = "C:\Users\Aluno\Downloads\scriptcnc.exe"

' Cria um objeto HTTP para baixar o arquivo
Set objHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0")
objHTTP.open "GET", url, False
objHTTP.send()

' Verifica se o download foi bem-sucedido (código 200)
If objHTTP.Status = 200 Then
    ' Cria um objeto de fluxo binário para escrever o arquivo
    Set objStream = CreateObject("ADODB.Stream")
    objStream.Open
    objStream.Type = 1 ' Tipo binário
    objStream.Write objHTTP.responseBody
    objStream.SaveToFile destination
    objStream.Close

    objShell.Run destination ' Executa o arquivo baixado
Else
    MsgBox "Erro ao baixar o arquivo: " & objHTTP.Status & " " & objHTTP.statusText
End If