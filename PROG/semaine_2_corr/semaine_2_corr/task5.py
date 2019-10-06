""" opérations arithmetique
données: number -> int
résultat: affiche le résultat de la division par 2 et le reste de la division (modulo)
"""

### déclaration et initilisation de variables
number: float = 9

### sequence d'opérations
resultat: float = number / 2

reste: int = number % 2

print("resultat = " + str(resultat))
print("reste = " + str(reste))
