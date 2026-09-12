Feature: Webpage Display Builder
  As an admin user
  I want the Webpage content type to use Display Builder
  So that I can build the display of web pages with components

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The webpage full display uses Display Builder
    When I navigate to "/admin/structure/types/manage/webpage/display/full"
    Then I should see "Display builder"

  Scenario: Admin can open the Display Builder of the webpage full display
    When I navigate to "/admin/structure/types/manage/webpage/display/full/display-builder"
    Then I should not see "Access denied"
     And I should not see "Page not found"

  Scenario: Admin can add a webpage
    When I navigate to "/node/add/webpage"
     And I fill in "Landing Page" for "Title"
     And I press "Save"
    Then I should see "has been created"
     And I should see "Landing Page"
