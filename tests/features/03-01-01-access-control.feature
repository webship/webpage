Feature: Access Control
  As a site administrator
  I want proper access control on Webpage pages
  So that only authorized users can create web pages

  Scenario: Anonymous user cannot access the webpage add form
    Given I am an anonymous user
    When I navigate to "/node/add/webpage"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot access the content admin page
    Given I am an anonymous user
    When I navigate to "/admin/content"
    Then I should see "Access denied"

  Scenario: Admin user can access the content admin page
    Given I am logged in as admin
    When I navigate to "/admin/content"
    Then I should see "Content"
     And I should see "Add content"
