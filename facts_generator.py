import random
import os

# Helper data for generating random facts
primeros = ["Gazpacho", "Ensalada de queso", "Tofu salteado", "Crema de calabaza", "Bruschetta", "Sopa de miso"]
segundos = ["Paella", "Lasaña", "Hamburguesa vegetariana", "Polenta con setas", "Ratatouille", "Berenjenas rellenas"]
postres = ["Tarta de chocolate", "Flan", "Fruta fresca", "Helado de vainilla", "Mousse de limón", "Bizcocho de zanahoria"]
ingredientes_base = ["tomate", "pepino", "queso", "lechuga", "nueces", "tofu", "chocolate", "nata", "soja", "verduras"]
bebidas = ["Agua mineral", "Vino tinto", "Zumo de naranja", "Cerveza artesanal", "Té verde", "Refresco de cola"]

tipos_plato = ["primero", "segundo", "postre"]
estilos = ["clasico", "moderno", "fusion"]
temporadas = ["verano", "invierno", "todo"]
si_no = ["si", "no"]

# Generate 100 platos
def generate_plato_fact(index):
    nombre = f"Plato{index}"
    tipo = random.choice(tipos_plato)
    temporada = random.choice(temporadas)
    estilo = random.choice(estilos)
    vegetariano = random.choice(si_no)
    precio = random.randint(3, 15)
    ingredientes = random.sample(ingredientes_base, k=random.randint(2, 4))
    ingredientes_str = " ".join(ingredientes)
    return f'(plato (nombre "{nombre}") (tipo {tipo}) (temporada {temporada}) (estilo {estilo}) (vegetariano {vegetariano}) (precio {precio}) (ingredientes {ingredientes_str}))'

# Generate 100 bebidas
def generate_bebida_fact(index):
    nombre = f"Bebida{index}"
    compatibles = [f"Plato{random.randint(1, 100)}" for _ in range(random.randint(1, 3))]
    compatibles_str = " ".join(f'"{c}"' for c in compatibles)
    precio = random.randint(1, 6)
    return f'(bebida (nombre "{nombre}") (compatible-con {compatibles_str}) (precio {precio}))'

# Collect all facts
platos_facts = [generate_plato_fact(i) for i in range(1, 101)]
bebidas_facts = [generate_bebida_fact(i) for i in range(1, 101)]

# Final deffacts structure
deffacts = "\n".join(platos_facts) + "\n" + \
           "\n".join(bebidas_facts) + "\n"

# Output snippet of the result
deffacts[:1000]  # Return only the beginning as a preview

with open("facts_generator_output.txt", "w") as f:
    f.writelines(deffacts)

