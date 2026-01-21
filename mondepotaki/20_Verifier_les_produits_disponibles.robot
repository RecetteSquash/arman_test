*** Settings ***
Documentation    Vérifier les produits disponibles
Metadata         ID                           20
Metadata         Reference                    CT 004
Metadata         Automation priority          10
Metadata         Test case importance         Very high
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Vérifier les produits disponibles
    [Documentation]    Vérifier les produits disponibles

    &{datatables} =    Retrieve Datatables

    Given la machine est en marche "${datatables}[datatable_1]"
    When je liste les produits disponibles. "${datatables}[datatable_2]"
    # Seuls les produits de la catégorie Café sont vérifiés dans ce test
    Then je constate que tous les produits suivants sont disponibles : "${datatables}[datatable_3]"
    # Vérifier un commentaire + une table de données


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_20_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_20_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =       Get Variable Value    ${TEST_SETUP}
    ${TEST_20_SETUP_VALUE} =    Get Variable Value    ${TEST_20_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_20_SETUP_VALUE is not None
        Run Keyword    ${TEST_20_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_20_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_20_TEARDOWN}.

    ${TEST_20_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_20_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =       Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_20_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_20_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END

Retrieve Datatables
    [Documentation]    Retrieves SquashTM's datatables and stores them in a dictionary.
    ...
    ...                For instance, 2 datatables have been defined in SquashTM,
    ...                the first one containing data:
    ...                | name | firstName |
    ...                | Bob  |   Smith   |
    ...                the second one containing data
    ...                | name  | firstName | age |
    ...                | Alice |   Smith   | 45  |
    ...
    ...                First, for each datatable, this keyword retrieves the values of each row
    ...                and stores them in a list, as follows:
    ...                @{row_1_1} =    Create List    name    firstName
    ...
    ...                Then, for each datatable, this keyword creates a list containing all the rows,
    ...                as lists themselves, as follows:
    ...                @{datatable_1} =    Create List    ${row_1_1}    ${row_1_2}
    ...
    ...                Finally, this keyword stores the datatables into the &{datatables} dictionary
    ...                with each datatable name as key, and each datatable list as value :
    ...                &{datatables} =    Create Dictionary    datatable_1=${datatable_1}    datatable_2=${datatable_2}

    @{row_1_1} =    Create List    animal    quantité
    @{row_1_2} =    Create List    chien     3
    @{row_1_3} =    Create List    chat      4
    @{row_1_4} =    Create List    oiseau    6
    @{datatable_1} =    Create List    ${row_1_1}    ${row_1_2}    ${row_1_3}    ${row_1_4}

    @{row_2_1} =    Create List    outil       prix
    @{row_2_2} =    Create List    Balai       7.50
    @{row_2_3} =    Create List    Marteau     15.00
    @{row_2_4} =    Create List    Cisaille    12.50
    @{datatable_2} =    Create List    ${row_2_1}    ${row_2_2}    ${row_2_3}    ${row_2_4}

    @{row_3_1} =    Create List    produit       prix
    @{row_3_2} =    Create List    Expresso      0.40
    @{row_3_3} =    Create List    Lungo         0.50
    @{row_3_4} =    Create List    Cappuccino    0.80
    @{datatable_3} =    Create List    ${row_3_1}    ${row_3_2}    ${row_3_3}    ${row_3_4}

    &{datatables} =    Create Dictionary    datatable_1=${datatable_1}    datatable_2=${datatable_2}    datatable_3=${datatable_3}

    RETURN    &{datatables}
