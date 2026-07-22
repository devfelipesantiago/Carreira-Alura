from modelos.restaurante import Restaurante

restaurante_praca = Restaurante("praça", "Gourmet")
restaurante_japones = Restaurante("Japan food", "Japonesa")
restaurante_mexicano = Restaurante("mexican food", "Mexicana")

restaurante_mexicano.alternar_estado()
restaurante_praca.receber_avaliacao("João", 4)
restaurante_japones.receber_avaliacao("Maria", 5)
restaurante_praca.receber_avaliacao("Carlos", 3)

print(restaurante_praca.media_avaliacoes)
print(restaurante_japones.media_avaliacoes)
print(restaurante_mexicano.media_avaliacoes)


def main():
    Restaurante.listar_restaurantes()


if __name__ == "__main__":
    main()
