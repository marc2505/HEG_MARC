"""
Une compagnie d'assurance automobile propose à ses clients quatre familles
de tarifs identifiables par une couleur, du moins au plus onéreux :
    tarifs bleu, vert, orange et rouge.
Le tarif dépend de la situation du conducteur :
    - un conducteur de moins de 25 ans et titulaire du permis depuis moins
      de deux ans, se voit attribuer le tarif rouge, si toutefois
      il n'a jamais été responsable d'accident.
      Sinon, la compagnie refuse de l'assurer.
    - un conducteur de moins de 25 ans et titulaire du permis depuis
      plus de deux ans, ou de plus de 25 ans mais titulaire du permis
      depuis moins de deux ans a le droit au tarif orange s'il
      n'a jamais provoqué d'accident, au tarif rouge pour un accident,
      sinon il est refusé.
    - un conducteur de plus de 25 ans titulaire du permis depuis plus de
      deux ans bénéficie du tarif vert s'il n'est à l'origine d'aucun
      accident et du tarif orange pour un accident, du tarif rouge pour
      deux accidents, et refusé au-delà
    - De plus, pour encourager la fidélité des clients acceptés,
      la compagnie propose un contrat de la couleur immédiatement la plus
      avantageuse s'il est entré dans la maison depuis plus de cinq ans.
      Ainsi, s'il satisfait à cette exigence, un client normalement "vert"
      devient "bleu", un client normalement "orange" devient "vert",
      et le "rouge" devient "orange".

Ecrire l'algorithme permettant de saisir les données nécessaires
(sans contrôle de saisie) et de traiter ce problème.

  Données : - L'Age du conducteur
            - Le nombre d'année de permis
            - Le nombre d'accidents
            - Le nombre d'années d'assurance
  Résultats : Un message spécifiant la situation du client
"""

### Déclaration des variables
age : int
nbAnneePermis : int
nbAccident : int
nbAnneeAssurance : int
situation : str

### Initialisation des variables
age = 0
nbAnneePermis = 0
nbAccident = 0
nbAnneeAssurance = 0
situation = ''

### Séquence d'opération

age = int(input('Entrez l\'age : '))
nbAnneePermis = int(input('Entrez le nombre d\'années de permis : '))
nbAccident = int(input('Entrez le nombre d\'accidents : '))
nbAnneeAssurance = int(input('Entrez le nombre d\'années d\'assurance : '))

if age < 25 :
    if nbAnneePermis < 2 :
        if nbAccident == 0 :
            situation = 'rouge'
        else :
            situation = 'pas accepté !'

if age < 25 & nbAnneePermis > 2 | age > 25 & nbAnneePermis < 2 :
    if nbAccident == 0 :
        situation = 'orange'
    elif nbAccident == 1 :
        situation = 'rouge'
    else :
        situation = 'pas accepté !'

if age >= 25 & nbAnneePermis >= 2 :
    if nbAccident == 0 :
        situation = 'vert'
    elif nbAccident == 1 :
        situation = 'orange'
    elif nbAccident == 2 :
        situation = 'rouge'
    else :
        situation = 'pas accepté !'

if nbAnneeAssurance > 5 :
    if situation == 'vert' :
        situation = 'bleu'
    if situation == 'orange' :
        situation = 'vert'
    if situation == 'rouge' :
        situation = 'orange'

print('Votre situation : ' + situation)
