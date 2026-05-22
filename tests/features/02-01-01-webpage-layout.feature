Feature: Webpage Layout Builder
  As an admin user
  I want the Webpage content type to use the Layout Builder
  So that I can build the layout of each web page

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: The webpage full display uses the Layout Builder
    When I navigate to "/admin/structure/types/manage/webpage/display/full"
    Then I should see "Use Layout Builder"

  Scenario: Admin can open the layout of a webpage
    When I navigate to "/node/add/webpage"
     And I fill in "Landing Page" for "Title"
     And I press "Save"
    Then I should see "has been created"
     And I should see "Landing Page"
