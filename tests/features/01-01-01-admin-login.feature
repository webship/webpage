Feature: Admin login
  As an anonymous user
  I want to be able to log in as admin
  So that I can administer the Webpage module

  Scenario: Admin can log in successfully
    Given I am logged in as admin
    Then I should see "admin"
     And I should see "Log out"
