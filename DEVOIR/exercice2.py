"""
Programme simulant un distributeur de snacks
 Données : - Un montant entré par l'utilisateur
           - Un numéro d'article entré par l'utilisateur
 Indications :
           Le distributeur comporte :
           - Sandwich au poulet à 4.90
           - Chips paprika à 2.50
           - Barre chocolat à 2.00
           - Bonbons à 3.30
           - Ice Tea à 2.20
           - Limonade à 1.90
 Résultats : - Un message confirmant ou annulant la transaction
             - Un message indiquant la monnaie rendue si existante
             - Un message indiquant le produit vendu et souhaitant un bon appétit/santé
"""

### Déclaration des variables
Sandwich : int
PrixSandwich : float
Chips : int
PrixChips : float
BarreChocolat: int
PrixBarreChocolat : float
Bonbons: int
PrixBonbons : float
IceTea: int
PrixIceTea : float
Limonade: int
PrixLimonade : float
MonnaieInseree : float
ProduitChoisi : int
MonnaieARendre : float
NomProd : str

###Initialisation des variables
Sandwich = 1
PrixSandwich = 4.90
Chips = 2
PrixChips = 2.50
BarreChocolat = 3
PrixBarreChocolat = 2.00
Bonbons = 4
PrixBonbons = 3.30
IceTea = 5
PrixIceTea = 2.20
Limonade = 6
PrixLimonade = 1.90
MonnaieInseree = 0.00
ProduitChoisi = 0
MonnaieARendre = 0.00
NomProd = ''




### Séquence d'opération

print("Bienvenue ! Voici notre sélection de produit :")
print("----------------------------------------------")
print("1. Sandwich au poulet")
print("2. Chips Paprika")
print("3. Barre chocolatée")
print("4. Bonbons")
print("5. Ice Tea")
print("6. Limonade")
MonnaieInseree = float(input('Veuillez introduire votre monnaie : '))
ProduitChoisi = int(input('Veuillez sélectionner un produit : '))

if ProduitChoisi == 1 :
    MonnaieARendre = MonnaieInseree - PrixSandwich
    NomProd = 'Sandwich au poulet servi ! Bon appétit !'
elif ProduitChoisi == 2 :
    MonnaieARendre = MonnaieInseree - PrixChips
    NomProd = 'Chips Paprika servies ! Bon appétit !'
elif ProduitChoisi == 3 :
    MonnaieARendre = MonnaieInseree - PrixBarreChocolat
    NomProd = 'Barre chocolat servie ! Bon appétit !'
elif ProduitChoisi == 4 :
    MonnaieARendre = MonnaieInseree - PrixBonbons
    NomProd = 'Bonbons servis ! Bon appétit !'
elif ProduitChoisi == 5 :
    MonnaieARendre = MonnaieInseree - PrixIceTea
    NomProd = 'Ice Tea servi ! Santé !'
elif ProduitChoisi == 6 :
    MonnaieARendre = MonnaieInseree - PrixLimonade
    NomProd = 'Limonade servie ! Santé !'

print('Monnaie à rendre : ',round(MonnaieARendre,2))
print(NomProd)
