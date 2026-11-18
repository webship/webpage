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
     And the heading hierarchy should be valid

  # Role switch: a visitor sends the form, then the Webmaster removes the
  # submission, so the site keeps no test data. The form has a time limit
  # (Honeypot on a Webship site): the visitor waits it out before sending.
  @role-switch
  Scenario: A visitor submits the contact webform
    Given I am an anonymous user
    When I navigate to "/form/contact"
     And I fill in "Webship Team" for "Your Name"
     And I fill in "contact-anon@webship.co" for "Business email"
     And I fill in "Hello from the contact form test." for "Your message"
     And I wait out the form time limit
     And I press "Submit"
    Then I should see "Your message has been sent."
    Given I am a logged in user with the "Webmaster" user
    When I navigate to "/admin/structure/webform/manage/contact/results/submissions"
     And I open the "Delete" operation in the "contact-anon@webship.co" row
     And I confirm the deletion
    Then I should see "has been deleted"
