import pandas as pd
import requests
from math import ceil

class DadosRepositorios:

    def __init__(self, owner):
        self.owner = owner
        self.api_base_url = "https://api.github.com"
        self.access_token = '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'
        self.headers = {'Authorization': 'Bearer' + self.access_token}

    def lista_repositorio(self):
        repos_list = []

        response = requests.get(f'https://api.github.com/users/{self.owner}')
        num_pages = ceil(response.json()['public_repos']/30)

        for page_num in range(1, num_pages+1):
            try:
                url_page = f'{self.api_base_url}/users/{self.owner}/repos?page={page_num}'
                response = requests.get(url_page, headers=self.headers)
                repos_list.append(response.json())
            except:
                repos_list.append(None)

        return repos_list

    def nomes_repos(self, repos_list):
        nomes_dos_repositorios = [repositorio['name'] for repositorios in repos_list for repositorio in repositorios]
        return nomes_dos_repositorios

    
    def nomes_linguagens(self, repos_list):
        linguagens_dos_repositorios = [repositorio['language'] for repositorios in repos_list for repositorio in repositorios]        
        return linguagens_dos_repositorios

    def cria_dataframe(self):
        dados_repositorios = pd.DataFrame(columns=['repoditory_name', 'language'])
        dados_repositorios['repoditory_name'] = self.nomes_repos(self.lista_repositorio())
        dados_repositorios['language'] = self.nomes_linguagens(self.lista_repositorio())
        return dados_repositorios


amazon_rep = DadosRepositorios('amzn')
ling_mais_usadas = amazon_rep.cria_dataframe()
#print(ling_mais_usadas)

netflix_rep = DadosRepositorios('netflix')
ling_mais_usadas_netflix = netflix_rep.cria_dataframe()
print(ling_mais_usadas_netflix)


spotify_rep = DadosRepositorios('spotify')
ling_mais_usadas_spotify = spotify_rep.cria_dataframe()
print(ling_mais_usadas_spotify)

ling_mais_usadas.to_csv('dados/amazon.csv', index=False)
ling_mais_usadas_netflix.to_csv('dados/netflix.csv', index=False)
ling_mais_usadas_spotify.to_csv('dados/spotify.csv', index=False)