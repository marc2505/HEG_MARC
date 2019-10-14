import random
'''
Exercice 9

ESCALADE : int = 1602
anneeEscalade : int = None

anneeEscalade = int(input("En quelle année s'est déroulée l'Escalade ? "))


if anneeEscalade == ESCALADE :
    print("C'est la bonne réponse !!")
# elif anneeEscalade > ESCALADE and anneeEscalade < 1607 or anneeEscalade < ESCALADE and anneeEscalade > 1597 :
elif anneeEscalade >= ESCALADE - 5 and anneeEscalade <= ESCALADE + 5 :
    print("C'est presque ça ...")
else :
    print("Nope c'est faux !!!!!")

'''


'''
Exercice 11
'''

chiffreJoueur : int = None
chiffreOrdinateur : int = None
object : str = None

chiffreJoueur = int(input("Quel est votre choix ? :\n1 (Pierre)\n2 (Papier)\n3 (Ciseaux)\n"))
chiffreOrdinateur = random.randint(1,3)
if chiffreJoueur == 1 or chiffreOrdinateur == 1:
    object = 'Pierre'
elif chiffreJoueur == 2 or chiffreOrdinateur == 2:
    object = 'Papier'
else :
    object = 'Ciseaux'


print("L'ordinateur a choisi : ")
