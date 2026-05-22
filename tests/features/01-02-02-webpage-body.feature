Feature: Webpage body field
  As an admin user
  I want the Body field to be available on the Webpage form
  So that I can write the page content

  Background:
    Given I am logged in as admin

  Scenario: The webpage add form exposes the Body field
    When I navigate to "/node/add/webpage"
    Then I should see a "Title" field
     And I should see a "Body" field

  Scenario: A webpage can be saved with body content
    When I navigate to "/node/add/webpage"
     And I fill in "Mission Statement" for "Title"
     And I press "Save"
    Then I should see "has been created"
     And I should see "Mission Statement"
