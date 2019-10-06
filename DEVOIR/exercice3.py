"""
Programme calculant le niveau de risque cardiovasculaire. 
  Données : - L'Age de l'utilisateur
            - Le sexe de l'utilisateur
            - Si l'utilisateur est un fumeur ou non
            - Si l'utilisateur pratique du sport
  Indications :
            - Si l'utilisateur est fumeur, le niveau de risque augmente de 2
            - Si l'utilisateur fait du sport, le niveau de risque diminue de 1
            - Si l'utilisateur est un homme de plus de 50 ans,
              le niveau de risque augmente de 1
            - Si l'utilisateur est une femme de plus de 60ans,
              le niveau de risque augmente de 1
            
  Résultats : Un message spécifiant le niveau de risque obtenu.
            - Si le niveau de risque est inférieur ou égal à 1,
              le niveau de risque est faible. Sinon il est élevé.
"""
### Déclaration des variables
fumeur : bool
sportif : bool
sexe : str
age : int
risque : int


### Initialisation des variables
fumeur = False
sportif = False
sexe = 'h'
age = 0
risque = 0


### Séquence d'opération

repfumeur = input('Êtes-vous fumeur ? (oui ou non) ')
if repfumeur == 'oui' :
    fumeur = True
else :
    fumeur = False
if fumeur :
    risque += 2

repsportif = input('Faîtes-vous du sport ? (oui ou non) ')
if repsportif == 'oui' :
    sportif = True
else :
    sportif = False
if sportif :
    risque -= 1

sexe = input('Quel est votre sexe ? (h ou f) ')
if sexe == 'h' :
    age = int(input('Quel est votre age ? '))
    if age > 50 :
        risque += 1
elif sexe == 'f' :
    age = int(input('Quel est votre age ? '))
    if age > 60 :
        risque += 1

if risque <= 0 :
    msg = 'Le niveau de risque est faible (' + str(risque) + ')'
else :
    msg = 'Le niveau de risque est élevé (' + str(risque) + ')'

print(msg)



# print(input('Êtes-vous fumeur ? (oui ou non) '))
# print(input('Faîtes-vous du sport ? (oui ou non) '))
# print(input('Quel est votre sexe ? (h ou f) '))
# print(input('Quel est votre age ? '))
# print('Le niveau de risque est ... (n)')
