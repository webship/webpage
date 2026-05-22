Feature: Webpage access matrix across Standard profile roles
  As a site administrator
  I want to verify webpage access for every default role on the Standard profile
  So that I know who can and cannot create or view webpages

  Scenario: Webmaster can reach the webpage add form
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/node/add/webpage"
    Then I should see "Create Webpage"
     And I should see a "Title" field

  Scenario: Webmaster can reach the content admin listing
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/admin/content"
    Then I should see "Content"
     And I should see "Add content"

  Scenario: Content editor cannot reach the webpage add form by default
    Given I am a logged in user with the "Content editor" user
    When I navigate to "/node/add/webpage"
    Then I should see "Access denied"

  Scenario: Content editor can reach the content admin listing
    Given I am a logged in user with the "Content editor" user
    When I navigate to "/admin/content"
    Then I should see "Content"

  Scenario: Authenticated user cannot reach the webpage add form
    Given I am a logged in user with the "Authenticated user" user
    When I navigate to "/node/add/webpage"
    Then I should see "Access denied"

  Scenario: Authenticated user cannot reach the content admin listing
    Given I am a logged in user with the "Authenticated user" user
    When I navigate to "/admin/content"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot reach the webpage add form
    Given I am an anonymous user
    When I navigate to "/node/add/webpage"
    Then I should see "Access denied"

  Scenario: Anonymous user cannot reach the content admin listing
    Given I am an anonymous user
    When I navigate to "/admin/content"
    Then I should see "Access denied"

  Scenario: Anonymous user can view a published webpage at its path alias
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/node/add/webpage"
     And I fill in "Public Page" for "Title"
     And I select "Published" from "Save as"
     And I press "Save"
    Then I should see "has been created"
    Given I am an anonymous user
    When I navigate to "/public-page"
    Then I should see "Public Page"
