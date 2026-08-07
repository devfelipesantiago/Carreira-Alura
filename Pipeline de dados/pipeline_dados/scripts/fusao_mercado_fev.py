import json
import csv

from processamento_dados import Dados

path_json = 'pipeline_dados/data_raw/dados_empresaA.json'
path_csv = 'pipeline_dados/data_raw/dados_empresaB.csv'

# Extract 
dados_empresaA = Dados.leitura_dados(path_json, 'json')
print(f"Dados JSON: {dados_empresaA.dados[0]}")

dados_empresaB = Dados.leitura_dados(path_csv, 'csv')
print(f"Dados CSV: {dados_empresaB.dados[0]}")

nomes_colunas_csv = dados_empresaB.colunas
print(f"Colunas CSV: {nomes_colunas_csv}")

# Transform
key_mapping = {
    'Nome do Item': 'Nome do Produto',
    'Classificação do Produto': 'Categoria do Produto',
    'Valor em Reais (R$)': 'Preço do Produto (R$)',
    'Quantidade em Estoque': 'Quantidade em Estoque',
    'Nome da Loja': 'Filial',
    'Data da Venda': 'Data da Venda'
}

dados_empresaB.rename_columns(key_mapping)
print(f"Colunas CSV renomeadas: {dados_empresaB.colunas}")

print(f"Tamanho dos dados CSV transformados: {dados_empresaB.qtde_linhas}")
print(f"Tamanho dos dados JSON transformados: {dados_empresaA.qtde_linhas}")

dados_fusao = Dados.join_dados(dados_empresaA, dados_empresaB)
nomes_colunas_fusao = dados_fusao.colunas
print(f'Tamanho dos dados combinados: {dados_fusao.qtde_linhas}')
print(f"Colunas dos dados combinados: {nomes_colunas_fusao}")

# Load
output_path = 'pipeline_dados/data_processed/dados_fusao.csv'
dados_fusao.salvar_dados_csv(output_path)
print(f'Dados salvos em: {output_path}')

#--------------------------------------------------------------------------------------------------
# Iniciando a leitura dos dados
#dados_json, dados_csv = leitura_dados(path_json, 'json'), leitura_dados(path_csv, 'csv')
#print(f"Dados JSON: {dados_json[0]}")
#print(f"Dados CSV: {dados_csv[0]}")
#
#print(f"Colunas CSV transformadas: {dados_csv[0]}")
#
#print(f"Tamanho dos dados CSV transformados: {size_dados(dados_csv)}")
#print(f"Tamanho dos dados JSON transformados: {size_dados(dados_json)}")
#
## Iniciando a transformação dos dados
#dados_csv = rename_columns(dados_csv, key_mapping)
#colunas_csv = get_coluns(dados_csv)
#print(f"Colunas CSV: {colunas_csv}")
#
#dados_fusao = merge_dados(dados_json, dados_csv)
#nomes_colunas_fusao = get_coluns(dados_fusao)
#print(f"Colunas dos dados combinados: {nomes_colunas_fusao}")
#print(f'Tamanho dos dados combinados: {size_dados(dados_fusao)}')
#
## Salvando os dados combinados em um arquivo CSV
#print(f'Dados combinados: {transformar_dados_tabela(dados_fusao)[0:2]}')
#
#output_path = 'pipeline_dados/data_processed/dados_fusao.csv'
#salvar_dados_csv(transformar_dados_tabela(dados_fusao), output_path)
#print(f'Dados salvos em: {output_path}')