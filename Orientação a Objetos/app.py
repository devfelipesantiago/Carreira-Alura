from modelos.restaurante import Restaurante

restaurante_praca = Restaurante("praça", "Gourmet")
restaurante_japones = Restaurante("Japan food", "Japonesa")
restaurante_mexicano = Restaurante("mexican food", "Mexicana")

restaurante_mexicano.alternar_estado()
restaurante_praca.adicionar_avaliacao(4, "João")
restaurante_japones.adicionar_avaliacao(5, "Maria")
restaurante_praca.adicionar_avaliacao(3, "Carlos")

print(restaurante_praca.media_avaliacoes)
print(restaurante_japones.media_avaliacoes)
print(restaurante_mexicano.media_avaliacoes)


def main():
    Restaurante.listar_restaurantes()


if __name__ == "__main__":
    main()
