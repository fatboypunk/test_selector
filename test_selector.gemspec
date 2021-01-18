# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'test_selector/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'test_selector'
  spec.version     = TestSelector::VERSION
  spec.authors     = ['Marcel Horlings']
  spec.email       = ['marcel@devrain.io']
  spec.homepage    = 'https://github.com/fatboypunk/test_selector'
  spec.summary     = 'Add test_selectors to rails views and use them in tests'
  spec.description = 'test_selector can be used to find specific elements in your tests without '\
                     'adding css variables or other html elements to your production environment'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'nokogiri', '>= 1.10', '< 1.12'
  spec.add_dependency 'rails', '>= 5.0'
end
