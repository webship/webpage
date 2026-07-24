Feature: Webpage Layout Builder - add a section
  As an admin user
  I want to add a section to a Webpage layout and choose a layout for it
  So that the Webpage shows the chosen layout when rendered

  Background:
    Given I am a logged in user with the "Webmaster" user

  Scenario: Admin can open the layout chooser and see core layouts
    When I navigate to "/node/add/webpage"
     And I fill in "Layout Chooser" for "Title"
     And I press "Save"
    Then I should see "has been created"
    When I click "top-bar-page-actions" by "aria-controls" attr
     And I click "Layout"
    Then I should see "Add section at end of layout"
    When I click "Add section at end of layout"
     And I wait for the modal to appear
    Then I should see "Choose a layout for this section" in the modal
     And I should see "One column" in the modal
     And I should see "Two column" in the modal
     And I should see "Three column" in the modal
     And I should see "Four column" in the modal

  Scenario: Admin can add a One-column section and save the layout
    When I navigate to "/node/add/webpage"
     And I fill in "Layout Saver" for "Title"
     And I press "Save"
    Then I should see "has been created"
    When I click "top-bar-page-actions" by "aria-controls" attr
     And I click "Layout"
    Then I should see "Add section at end of layout"
    When I click "Add section at end of layout"
     And I wait for the modal to appear
    Then I should see "One column" in the modal
    When I click on "a[href$='/layout_onecol']" in the modal
     And I wait for AJAX to finish
    Then I should see "Add section" in the modal
    When I click "Add section" in the modal
     And I wait for AJAX to finish
    When I press "Save layout"
    Then I should see "The layout override has been saved"
