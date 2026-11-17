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
    Then I should be allowed access to "/admin/structure/types/manage/webpage/display/full/display-builder"

  Scenario: Admin can add a webpage
    When I navigate to "/node/add/webpage"
     And I fill in "Landing Page" for "Title"
     And I save the content
    Then I should see "has been created"
     And I should see "Landing Page"
    When I delete the content item I created
    Then I should see "has been deleted"
