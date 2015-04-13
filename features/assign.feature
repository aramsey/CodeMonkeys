Feature: Assign judge to Posters
	In order to ensure every poster is judged
    As a judge for the contest
    I want to be assigned 2 - 3 posters randomly
    
    Background:
        Given this is a new judge
        And I am on the judge registration page
        And there are 3 posters in the database
    
    Scenario: Properly filled out form
        When I fill in "Name" with "Steven Bierwagen"
        And I fill in "Company Name" with "..."
        And I click on the "Submit" button
        Then there should be a judge named "Steven Bierwagen" with 3 assigned posters
    
    Scenario: Missing Name
        When I fill in "Company Name" with "..."
        And I click on the "Submit" button
        Then I should see the message "Input your name"

    Scenario: Missing Company Name
        When I fill in "Name" with "Steven Bierwagen"
        And I click on the "Submit" button
        Then I should see the message "Input your company's name"
    
    Scenario: Both fields are blank
        When I click on the "Submit" button
        Then I should see the message "Input your name"
        And I should see the message "Input your company's name"

    Scenario: Poster database empty
        Given I fill in "Name" with "Steven Bierwagen"
        And I fill in "Company Name" with "..."
        When I click on the "Submit" button
        Then I should sse the message "There are no more poster to be assigned."
