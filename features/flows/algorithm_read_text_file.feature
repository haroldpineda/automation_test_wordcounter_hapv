@algorithm
Feature: Count and classify words and characters and display by occurrence number of a text file

Scenario: User enters words and wants to know the amount entered.
  Given A text file is loaded and its content is extracted
  Then The text is processed and the number of characters, words and the density of use are identified