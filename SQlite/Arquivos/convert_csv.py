import pandas as pd
import os

# Diretório onde este script está localizado
DIR = os.path.dirname(os.path.abspath(__file__))

# Lista de arquivos que você quer converter
arquivos = [
    "alunos.xlsx",
    "disciplinas.xlsx",
    "notas.xlsx",
    "professores.xlsx",
    "turmas.xlsx",
    "turma_alunos.xlsx",
    "turma_disciplinas.xlsx",
]

for arquivo in arquivos:
    caminho = os.path.join(DIR, arquivo)
    if os.path.exists(caminho):
        # Lê o Excel
        df = pd.read_excel(caminho)
        # Substitui a extensão .xlsx por .csv no nome do novo arquivo
        nome_csv = os.path.join(DIR, arquivo.replace(".xlsx", ".csv"))
        # Salva em CSV
        df.to_csv(nome_csv, index=False, encoding="utf-8")
        print(f"Convertido: {arquivo} -> {arquivo.replace('.xlsx', '.csv')}")
    else:
        print(f"Arquivo nao encontrado: {caminho}")
