Feature: Contact webform
  As a site visitor
  I want a contact form
  So that I can send a message to the site team

  Scenario: The contact webform page loads
    Given I am an anonymous user
    When I navigate to "/form/contact"
    Then I should see "We'd love to talk to you"
     And I should see "Your Name"
     And I should see "Business email"
     And I should see "Your message"

  Scenario: A visitor submits the contact webform
    Given I am an anonymous user
    When I navigate to "/form/contact"
     And I fill in "Webship Team" for "Your Name"
     And I fill in "contact-anon@webship.co" for "Business email"
     And I fill in "Hello from the contact form test." for "Your message"
     And I press "Submit"
    Then I should see "Your message has been sent."
