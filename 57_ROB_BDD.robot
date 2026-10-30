*** Settings ***
Documentation    ROB_BDD
Metadata         ID                           57
Metadata         Automation priority          4
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
ROB_BDD
    [Documentation]    ROB_BDD

    Given je suis sur la page de connexion robot
    When je saisis mes identifiants robot
    Then le tableau de bord robot s affiche


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_57_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_57_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =       Get Variable Value    ${TEST_SETUP}
    ${TEST_57_SETUP_VALUE} =    Get Variable Value    ${TEST_57_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_57_SETUP_VALUE is not None
        Run Keyword    ${TEST_57_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_57_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_57_TEARDOWN}.

    ${TEST_57_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_57_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =       Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_57_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_57_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
