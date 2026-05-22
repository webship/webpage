Feature: Webpage in the content admin listing
  As an admin user
  I want webpages to appear in /admin/content
  So that I can manage them

  Background:
    Given I am logged in as admin

  Scenario: A new webpage appears in the admin content listing
    When I navigate to "/node/add/webpage"
     And I fill in "Press Room" for "Title"
     And I press "Save"
    Then I should see "has been created"
    When I navigate to "/admin/content"
    Then I should see "Press Room"
     And I should see "Webpage"
