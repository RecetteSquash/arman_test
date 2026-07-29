# language: en
Feature: Vérifier les produits disponibles

	Scenario: Vérifier les produits disponibles
		Given la machine est en marche
			"""
			Le message "Choisissez votre produit" apparaît.
			"""
		When je liste les produits disponibles.
			"""
			le prix des produits s'affiche à droite sur l'écran et le nom des produits à gauche
			"""
			#Seuls les produits de la catégorie Café sont vérifiés dans ce test 
		Then je constate que tous les produits suivants sont disponibles :
			| produit         | prix  |
			| Expresso        | 0.40  |
			| Lungo           | 0.50  |
			| Cappuccino      | 0.80  |
			#Vérifier un commentaire + une table de données 