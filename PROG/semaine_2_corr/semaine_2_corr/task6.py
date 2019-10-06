""" affectation augmentée
données: number -> float
résultat: affiche la valeur de number après 2 opérations d'affections
"""

### déclaration et initilisation de variables
number: float = 9.0

### sequence d'opérations

print("number = " + str(number))

number -= 2
print("number = " + str(number))

number += 5

print("number = " + str(number))
