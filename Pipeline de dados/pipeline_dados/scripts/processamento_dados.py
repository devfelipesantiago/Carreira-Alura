import json
import csv

class Dados:
    def __init__(self, dados):
        self.dados = dados
        self.colunas = self.__get_colunas()
        self.qtde_linhas = self.size_dados()

    def __leitura_json(path):
        with open(path, 'r', encoding='utf-8') as file:
            return json.load(file)

    def __leitura_csv(path):
        dados_csv = []
        with open(path, 'r', encoding='utf-8') as file:
            spamreader = csv.DictReader(file, delimiter=',')
            for row in spamreader:
                dados_csv.append(row)
        return dados_csv

    @classmethod
    def leitura_dados(cls, path=None, tipo_arquivo=None):
        dados = []

        if tipo_arquivo == 'json':
            dados = cls.__leitura_json(path)
        elif tipo_arquivo == 'csv':
            dados = cls.__leitura_csv(path)
        return cls(dados)


    def __get_colunas(self):
        return list(self.dados[-1].keys())

    def rename_columns(self, key_mapping):
        self.dados = [{key_mapping.get(old_key, old_key): value for old_key, value in old_dict.items()} for old_dict in self.dados]
        self.colunas = self.__get_colunas()

    def size_dados(self):
        return len(self.dados)

    @staticmethod
    def join_dados(dadosA, dadosB):
        combined_list = []
        combined_list.extend(dadosA.dados)
        combined_list.extend(dadosB.dados)
        return Dados(combined_list)

    def transformar_dados_tabela(self, dados):

        dados_combinados_tabela = [self.colunas]

        dados_combinados_tabela.extend([row.get(coluna, 'Indisponível') for coluna in self.colunas] for row in dados)
        return dados_combinados_tabela

    def salvar_dados_csv(self, path):

        dados_combinados_tabela = self.transformar_dados_tabela(self.dados)

        with open(path, 'w', newline='', encoding='utf-8') as file:
            writer = csv.writer(file)
            writer.writerows(dados_combinados_tabela)