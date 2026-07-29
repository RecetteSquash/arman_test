# language: en
Feature: Vérifier la livraison des produits

	Scenario Outline: Vérifier la livraison des produits
		Given la machine est en état de marche
		And mon solde est au moins de <prix>
		When je sélectionne le <produit>
		Then la machine me sert un <produit> et mon compteur est débité de <prix>

		@JDD_Cappûcînô
		Examples:
		| prix | produit |
		| 1 | "cappûcînô" |

		@JDD_Expresso
		Examples:
		| prix | produit |
		| 0,40 | "expresso" |

		@JDD_Lungo
		Examples:
		| prix | produit |
		| 0,50 | "lungo" |