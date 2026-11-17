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

  # The permissions Webpage gives on a Standard site. A site template may give
  # content editors more: Webship Starter lets them create web pages.
  @standard-profile
  Scenario: Content editor cannot reach the webpage add form by default
    Given I am a logged in user with the "Content editor" user
    Then I should be denied access to "/node/add/webpage"

  Scenario: Content editor can reach the content admin listing
    Given I am a logged in user with the "Content editor" user
    When I navigate to "/admin/content"
    Then I should see "Content"

  Scenario: Authenticated user cannot reach the webpage add form
    Given I am a logged in user with the "Authenticated user" user
    Then I should be denied access to "/node/add/webpage"

  Scenario: Authenticated user cannot reach the content admin listing
    Given I am a logged in user with the "Authenticated user" user
    Then I should be denied access to "/admin/content"

  Scenario: Anonymous user cannot reach the webpage add form
    Given I am an anonymous user
    Then I should be denied access to "/node/add/webpage"

  Scenario: Anonymous user cannot reach the content admin listing
    Given I am an anonymous user
    Then I should be denied access to "/admin/content"

  Scenario: Anonymous user can view a published webpage at its path alias
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/node/add/webpage"
     And I fill in "Public Page" for "Title"
     And I select "Published" from "Save as"
     And I save the content
    Then I should see "has been created"
    When the API base URL is "/"
     And I send a GET request to "/public-page"
    Then the API response code should be 200
     And the API response should contain "Public Page"
    When I delete the content item I created
    Then I should see "has been deleted"
