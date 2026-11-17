Feature: Webpage content type
  As an admin user
  I want to create Webpage content
  So that I can publish publicly accessible web pages

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can access the webpage add form
    When I navigate to "/node/add/webpage"
    Then I should see "Create Webpage"
     And I should see a "Title" field
     And I should see the button "Save"

  Scenario: Admin can create a webpage
    When I navigate to "/node/add/webpage"
     And I fill in "About Us" for "Title"
     And I save the content
    Then I should see "has been created"
     And I should see "About Us"
    When I delete the content item I created
    Then I should see "has been deleted"

  Scenario: A created webpage is reachable at its path
    When I navigate to "/node/add/webpage"
     And I fill in "Webpage Path Check" for "Title"
     And I save the content
    Then I should see "has been created"
    When I navigate to "/webpage-path-check"
    Then I should see "Webpage Path Check"
    When I delete the content item I created
    Then I should see "has been deleted"
