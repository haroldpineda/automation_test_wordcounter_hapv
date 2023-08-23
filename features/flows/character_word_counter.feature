@all_scenarios
Feature: Validation of character and word counters in wordcounter.net

Background: Enter to wordcounter.net url
  Given User enters the wordcounter.net page

@scenario_001
Scenario: User enters words and wants to know the amount entered.
  When User enters a 'random_number' words
  Then User validates the number of words in the counter

@scenario_002
Scenario: User enters words and wants to know the number of characters.
  When User enters a 'random_number' words
  Then User validates the number of characters in the counter

@scenario_003
Scenario: User enters words and displays the 3 most repeated words.
  When User enters a '2000' words
  Then User displays the 3 most repeated words in the text

@scenario_004
Scenario: User enters the words and displays the times counter of the 3 most used words.
  When User enters a '2000' words
  Then User displays the number of times that the 3 words were repeated in the text