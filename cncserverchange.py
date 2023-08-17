# Caminho para o arquivo .ini
caminho_arquivo = r'C:\Users\gean5555\Desktop\teste.ini'

# Nome que você deseja substituir
nome_antigo = 'NOME_DO_SERVER'
novo_nome = 'SERVER_CNC'

# Lê o conteúdo do arquivo
with open(caminho_arquivo, 'r') as arquivo:
    linhas = arquivo.readlines()

# Substitui o nome antigo pelo novo nome nas linhas
novas_linhas = [linha.replace(nome_antigo, novo_nome) for linha in linhas]

# Escreve as linhas modificadas de volta para o arquivo
with open(caminho_arquivo, 'w') as arquivo:
    arquivo.writelines(novas_linhas)

print(f'O nome "{nome_antigo}" foi substituído por "{novo_nome}" no arquivo.')