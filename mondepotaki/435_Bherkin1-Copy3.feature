# language: en
Feature: Gherkin1
  
Scenario: Check that the machine is available.
		Given the machine is operating.
		When I use my badge.
		Then I can check my balance.
		
		
Scenario: Check what products are available.
		Given the machine is operating.
		When I list the available products.
		Then I notice that the following products are available :
		| product		| price |
		| Expresso		| 0.40  |
		| Lungo				| 0.50  |
		| Cappuccino	| 0.80  |

Scenario Outline: Check the delivery of products.
		Given the machine is operating
		And my account contains at least <price>.
		When I select <product>.
		Then the machine delivers me a <product> and my account is charged <price>.
		Examples:
		| product			| price |
		| Expresso		| 0.40  |
		| Lungo				| 0.50  |
		| Cappuccino	| 0.80  |