Feature: Access Control
  As a site administrator
  I want proper access control on Webpage pages
  So that only authorized users can create web pages

  Scenario: Anonymous user cannot access the webpage add form
    Given I am an anonymous user
    Then I should be denied access to "/node/add/webpage"

  Scenario: Anonymous user cannot access the content admin page
    Given I am an anonymous user
    Then I should be denied access to "/admin/content"

  Scenario: Admin user can access the content admin page
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/admin/content"
    Then I should see "Content"
     And I should see "Add content"
