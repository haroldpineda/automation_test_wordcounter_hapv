# frozen_string_literal: true

require 'byebug'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'cucumber'
require 'dotenv'
require 'faker'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'

Dotenv.load

World(RSpec::Matchers)
