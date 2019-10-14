import math
"""
1. Ecrire un algorithme pour calculer la surface et le périmètre d'un cercle
Le rayon du cercle et l'unité de mesure sont donnés par l'utilisateur

Exemples de déroulement :

Entrer le rayon du cercle ?
Entrer l'unité de mesure ? (ex., cm, m, km, etc.)
La surface est          <xx.xxx>    <unité>^2
Le périmètre est        <yy.yyy>    <unité>

2. Modifier l'algorithme pour afficher la condition (ou affirmation) "La valeur du rayon est positive:"
suivie du résultat de l'évaluation de l'expression "rayon est positif"

Exemple de fonctionnement :

Entrer le rayon du cercle ?
La valeur du rayon est positive: True
...
"""

rayon : float = None
surface : float = None
perimetre : float = None
uniteMesure : str = None
pi : float = math.pi


rayon = float(input('Entrer le rayon du cercle ? '))


# print('La valeur du rayon doit être positive !',rayon < 0)


if rayon < 0 :
    print('Le rayon doit être positive !')
else :
    uniteMesure = input('Entrer l\'unité de mesure ? (ex:cm,m,km) ')
    perimetre = 2 * pi * rayon
    surface = pi * rayon ** 2
#    print('\nLa surface est de : {:.2f} {}2'.format(surface,uniteMesure))
#    print('Le périmètre est de : {:.2f} {}'.format(perimetre,uniteMesure))

    print('\nLa surface est de : %2.3f %s2 ' %(surface,uniteMesure))
    print('Le périmètre est de : %2.3f %s' %(perimetre,uniteMesure))




