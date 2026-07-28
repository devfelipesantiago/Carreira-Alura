class Livro:
    def __init__(
        self, titulo="", autor="", ano_publicacao=0, disponivel=True, paginas=0
    ):
        self.titulo = titulo
        self.autor = autor
        self.ano_publicacao = ano_publicacao
        self.disponivel = disponivel
        self.paginas = paginas

    def __str__(self):
        return f"Livro: {self.titulo} | Autor: {self.autor} | Ano de Publicação: {self.ano_publicacao}"

    @property
    def titulo_autor(self):
        return f"{self.titulo} por {self.autor}"

    def aumentar_paginas(self, quantidade):
        self.paginas += quantidade

    def emprestar(self):
        self.disponivel = False

    @staticmethod
    def verificar_disponibilidade(ano):
        livros_disponiveis = [
            livro
            for livro in Livro.livros
            if livro.ano_publicacao == ano and livro.disponivel
        ]
        return livros_disponiveis


livro1 = Livro("Aprendendo Python", "John Doe", 2022)
livro2 = Livro("Data Science Fundamentals", "Jane Smith", 2020)

print(livro1)
print(livro2)

livro3 = Livro("Python Cookbook", "Samuel Developer", 2019)
print(f"Antes de emprestar: Livro disponível? {livro3.disponivel}")
livro3.emprestar()
print(f"Depois de emprestar: Livro disponível? {livro3.disponivel}")

Livro.livros = [livro1, livro2, livro3]


class Pessoa:
    def __init__(self, nome="", idade=0, profissao=""):
        self._nome = nome
        self._idade = idade
        self._profissao = profissao

    def __str__(self):
        return f"{self._nome}, {self._idade} anos, {self._profissao}"

    def aniversario(self):
        self._idade += 1

    @property
    def saudacao(self):
        if self._profissao:
            return f"Olá, sou {self._nome}! Trabalho como {self._profissao}."
        else:
            return f"Olá, sou {self._nome}!"


# Criando 3 instâncias da classe Pessoa
pessoa1 = Pessoa(nome="Alice", idade=25, profissao="Engenheira")
pessoa2 = Pessoa(nome="Luiza", idade=30, profissao="Desenvolvedor")
pessoa3 = Pessoa(nome="Jaque", idade=22)

# Imprimindo informações iniciais
print("Informações Iniciais:")
print(pessoa1)
print(pessoa2)
print(pessoa3)
print()

# Utilizando o método de instância aniversario para aumentar a idade de uma pessoa
pessoa1.aniversario()
pessoa3.aniversario()

# Imprimindo informações após aniversário
print("Informações após aniversário:")
print(pessoa1)
print(pessoa3)
print()

# Utilizando o método de classe saudacao para exibir mensagens personalizadas
print(pessoa1.saudacao)
print(pessoa2.saudacao)
print(pessoa3.saudacao)
