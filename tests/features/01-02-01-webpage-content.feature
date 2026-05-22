Feature: Webpage content type
  As an admin user
  I want to create Webpage content
  So that I can publish publicly accessible web pages

  Background:
    Given I am logged in as admin

  Scenario: Admin can access the webpage add form
    When I navigate to "/node/add/webpage"
    Then I should see "Create Webpage"
     And I should see a "Title" field
     And I should see the button "Save"

  Scenario: Admin can create a webpage
    When I navigate to "/node/add/webpage"
     And I fill in "About Us" for "Title"
     And I press "Save"
    Then I should see "has been created"
     And I should see "About Us"

  Scenario: A created webpage is reachable at its path
    When I navigate to "/node/add/webpage"
     And I fill in "Contact" for "Title"
     And I press "Save"
    Then I should see "has been created"
    When I navigate to "/contact"
    Then I should see "Contact"
