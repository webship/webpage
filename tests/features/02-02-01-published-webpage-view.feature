Feature: Published webpage viewing
  As a site visitor
  I want to read a published webpage
  So that I can consume the site content

  The visitor's view is a request without a session (the API steps send it
  outside the browser), so the scenario logs in once and removes the page it
  made.

  Scenario: A published webpage is reachable at its path alias
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/node/add/webpage"
     And I fill in "Company Overview" for "Title"
     And I select "Published" from "Save as"
     And I save the content
    Then I should see "has been created"
    When the API base URL is "/"
     And I send a GET request to "/company-overview"
    Then the API response code should be 200
     And the API response should contain "Company Overview"
    When I delete the content item I created
    Then I should see "has been deleted"
