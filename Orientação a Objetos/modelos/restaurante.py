class Restaurante:
    def __init__(self, nome, categoria):
        self.categoria = categoria
        self.nome = nome
        self.ativo = True

    def __str__(self):
        return f"Restaurante: {self.nome}, Categoria: {self.categoria}, Ativo: {self.ativo}"


restaurante_praca = Restaurante("Praça", "Italiana")
print(restaurante_praca)  # Saída: Restaurante: Praça, Categoria: Italiana, Ativo: True
restaurante_praca.nome = "Bistrô"
print(restaurante_praca)  # Saída: Restaurante: Bistrô, Categoria: Italiana, Ativo: True

restaurante_pizza = Restaurante("Pizza Place", "Fast Food")
print(
    restaurante_pizza
)  # Saída: Restaurante: Pizza Place, Categoria: Fast Food, Ativo: True
if restaurante_pizza.categoria == "Fast Food":
    print("A categoria é Fast Food.")
else:
    print("A categoria não é Fast Food.")

# Imprimir os atributos dos objetos
print(vars(restaurante_praca))
print(vars(restaurante_pizza))

# Imprimir os métodos e atributos disponíveis para o objeto
print(dir(restaurante_praca))
