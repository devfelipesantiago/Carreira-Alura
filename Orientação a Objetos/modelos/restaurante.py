from modelos.avaliacao import Avaliacao


class Restaurante:
    restaurantes = []

    def __init__(self, nome, categoria):
        self._nome = nome.title()
        self._categoria = categoria.upper()
        self._ativo = False
        self._avaliacoes = []
        Restaurante.restaurantes.append(self)

    def __str__(self):
        return f"{self._nome} | {self._categoria}"

    @classmethod
    def listar_restaurantes(cls):
        print(
            f"{'Nome do restaurante'.ljust(25)} | {'Categoria'.ljust(25)} | {'Status'.ljust(10)} | {'Avaliações'.ljust(3)}"
        )
        for restaurante in cls.restaurantes:
            print(
                f"{restaurante._nome.ljust(25)} | {restaurante._categoria.ljust(25)} | {restaurante.ativo.ljust(10)} | {str(restaurante.media_avaliacoes).ljust(3)}"
            )

    @property
    def ativo(self):
        return "⌧" if self._ativo else "☐"

    def alternar_estado(self):
        self._ativo = not self._ativo

    def adicionar_avaliacao(self, nota, cliente):
        avaliacao = Avaliacao(nota, cliente)
        self._avaliacoes.append(avaliacao)

    @property
    def media_avaliacoes(self):
        if not self._avaliacoes:
            return 0
        total = sum(avaliacao._nota for avaliacao in self._avaliacoes)
        return round(total / len(self._avaliacoes), 1)


# Imprimir os atributos dos objetos
# print(vars(restaurante_praca))
# print(vars(restaurante_pizza))

# Imprimir os métodos e atributos disponíveis para o objeto
# print(dir(restaurante_praca))
