Feature: Published webpage viewing
  As a site visitor
  I want to read a published webpage
  So that I can consume the site content

  Scenario: A published webpage is reachable at its path alias
    Given I am logged in as admin
    When I navigate to "/node/add/webpage"
     And I fill in "Company Overview" for "Title"
     And I select "Published" from "Save as"
     And I press "Save"
    Then I should see "has been created"
    Given I am an anonymous user
    When I navigate to "/company-overview"
    Then I should see "Company Overview"
