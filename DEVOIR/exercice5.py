"""
Programme de calcul du prix d'un billet de cinéma selon plusieurs rabais possible.
    Prix normal d'un billet : 10chf
    Rabais étudiant : 2chf
    Rabais membre : 3chf
    Forfait famille : 1chf
    Carte mensuelle : L'entrée est gratuite

Indications :
    - Il est possible de bénéficier d'un rabais membre et étudiant en même temps
    - Il n'est pas possible de bénéficier d'un rabais famille et étudiant
    - Il est possible de bénéficier d'un rabais membre et famille
    - Il est possible d'avoir une carte mensuelle permettant
      l'accès gratuitement à ce film
    - Si une personne possède la carte membre et étudiante ainsi que le rabais famille,
      le rabais membre et étudiant s'applique (car le rabais étudiant est plus grand)

Contrainte : Si la personne possède la carte mensuelle,
             il ne faut pas lui demander d'autres informations."
"""
### Déclaration des variables
prixNormal : int
rabaisEtudiant : int
rabaisMembre : int
forfaitFamille : int
carteMensuelle : bool
prixAPayer : int

### Initialisation des variables
prixNormal = 10
rabaisEtudiant = 2
rabaisMembre = 3
forfaitFamille = 1
carteMensuelle = False
prixAPayer = 0

### Séquence d'opération

carte = input('Possédez-vous la carte mensuelle ? (oui ou non) ')
if carte == 'oui' :
    carteMensuelle = True
    print('Le prix à payer est de :', prixAPayer ,'CHF')
else :
    membre = input('Possédez-vous la carte membre ? (oui ou non) ')
    if membre == 'oui' :
        prixAPayer = prixNormal - rabaisMembre
    else :
        prixAPayer = prixNormal
    etudiant = input('Possédez-vous la carte étudiant ? (oui ou non) ')
    if etudiant == 'oui' :
        prixAPayer -= rabaisEtudiant
    famille = input('Bénéficiez-vous du forfait famille ? (oui ou non) ')
    if famille == 'oui' :
        if etudiant == 'non' :
            prixAPayer -= forfaitFamille

    print('Le prix à payer est de :', prixAPayer, 'CHF')


"""
print('1 * 7 =',1*7)
nb = 7
i = 0
while i < 10 :
    print(i+1,' * ',nb,' = ',(i+1)*nb)
    i+=1

chaine = 'Bonjour à tous :D'
for lettre in chaine :
    print(lettre)

def multipleDe7():
    nb = 7
    i = 0
    while i<10:
        print(i+1,'*',nb,'=',(i+1)*nb)
        i += 1

#multipleDe7()

def table(nb):
    i=0
    while i<10:
        print(i+1,'*',nb,'=',(i+1)*nb)
        i+=1

#table(8)

def table(nb,max):
    i=0
    while i<max:
        print(i+1,'*',nb,'=',(i+1)*nb)
        i+=1

#table(10,20)

def table2():
    for numClient in range(1,6):
        print('Vous êtes le client n°',numClient)

#table2()

def exempleForEach():
    emails = ['test@gmail.com','abcdef@gmail.com','blabla@gmail.com','adresse@gmail.com']
    for email in emails:
        print('Email envoyé à : ',email)
        # break
        # continue

exempleForEach()
"""
