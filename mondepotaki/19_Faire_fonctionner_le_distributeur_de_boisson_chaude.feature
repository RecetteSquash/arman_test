# language: en
Feature: Faire fonctionner le distributeur de boisson chaude

	Scenario Outline: Faire fonctionner le distributeur de boisson chaude
		Given la machine est en marche.
		And mon solde est au moins de <prix>.
		When When je sélectionne le <produit>.
		Then Then la machine me sert un <produit> et mon compte est débité de <prix>.

		@JDD_Cappûcînô
		Examples:
		| prix | produit |
		| 1 | "Cappûcînô" |

		@JDD_Expresso
		Examples:
		| prix | produit |
		| 0,40 | "Expresso" |

		@JDD_Lungo
		Examples:
		| prix | produit |
		| 0,50 | "lungo" |