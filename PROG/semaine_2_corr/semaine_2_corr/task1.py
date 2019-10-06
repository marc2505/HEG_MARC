""" definition de variables
données: l'année d'entrée year1 et year2
résultat: affiche les valeurs de variables et une message de bienvenue
"""

### déclaration et initilisation de variables
year1: int = 2019
year2: int = 2020
greetings: str = "greetings"

### sequence d'opérations
print("year 1 = " + str(year1))     # Nous expliquerons l'expression str(year1) plus tard dans le cours
                                    # Pour l'instant, elle est utilisée pour convertir la variable "year1"
                                    # en chaîne de caractères
print("year 2 = " + str(year2))
print("greetings = " + greetings)

greetings = "Bonjour, "
print(greetings + " l'année " + str(year1) + "-" + str(year2))
