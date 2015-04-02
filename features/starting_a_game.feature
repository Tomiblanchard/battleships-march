Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

Scenario: Beginning a game
  Given I am on the homepage
  When I follow "New game"
  Then I should see "What's your name?"

Scenario: Registering
  Given I am on the login page
  When I type in "name" with "Tomi"
  And I click "Fire"
  Then I should see "Welcome, Tomi"

Scenario: Registering without a name
  Given I am on the login page
  When I type in "name" with ""
  And I click "Fire"
  Then I should see "Please register!"

Scenario: Seeing a game board
  Given I am on the login page
  When I type in "name" with "Tomi"
  When I click "Fire"
  When I follow "here"
  Then I should see the new game page
