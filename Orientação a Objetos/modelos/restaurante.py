class Restaurante:
    categoria = None
    nome = None
    ativo = True


restaurante_praca = Restaurante()
restaurante_praca.categoria = "Italiana"
restaurante_praca.nome = "Restaurante Praça"
print(restaurante_praca.nome)
print(f" O restaurante praça está {restaurante_praca.ativo}")
categoria = restaurante_praca.categoria
print(f" O restaurante praça é da categoria {categoria}")
restaurante_praca.nome = "Bistrô"

restaurante_pizza = Restaurante()
restaurante_pizza.categoria = "Fast Food"
restaurante_pizza.nome = "Pizza Place"
if restaurante_pizza.categoria == "Fast Food":
    print("A categoria é Fast Food.")
else:
    print("A categoria não é Fast Food.")
print(f"Nome: {restaurante_praca.nome}, Categoria: {restaurante_praca.categoria}")
