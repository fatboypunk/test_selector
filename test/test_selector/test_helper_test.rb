# frozen_string_literal: true

require 'test_helper'
require 'test_selector/test_helper'

class TestSelector::TestHelperTest < ActiveSupport::TestCase
  test 'right value for 3 arguments' do
    assert_equal TestSelector::TestHelper.test_selector('/some/long/path.html.erb', 'dummy', 1), 'test-selector=__some_long_path_html_erb__dummy test-value=1'
  end
  test 'right value for 2 arguments' do
    assert_equal TestSelector::TestHelper.test_selector('/some/long/path.html.erb', 'dummy'), 'test-selector=__some_long_path_html_erb__dummy'
  end

  test 'right value for 1 argument' do
    assert_equal TestSelector::TestHelper.test_selector('/some/long/path.html.erb'), 'test-selector=__some_long_path_html_erb'
  end

  test 'finds the test-selector in a page' do
    html = '<html> <body><span test-selector="__some_long_path_html_erb"></span></body></html>'
    test_selector = TestSelector::TestHelper.test_selector('/some/long/path.html.erb')

    assert TestSelector::TestHelper.find_test_selector(html, test_selector) == '<span test-selector="__some_long_path_html_erb"></span>'
  end

  test 'finds the test-selector in a page with an added name' do
    html = '<html> <body><span test-selector="__some_long_path_html_erb__dummy"></span></body></html>'
    test_selector = TestSelector::TestHelper.test_selector('/some/long/path.html.erb', "dummy")

    assert TestSelector::TestHelper.find_test_selector(html, test_selector) == '<span test-selector="__some_long_path_html_erb__dummy"></span>'
  end

  test 'finds all test-selectors in a page' do
    html = '<html> <body><span test-selector="__some_long_path_html_erb"></span><span test-selector="__some_long_path_html_erb"></span></body></html>'
    test_selector = TestSelector::TestHelper.test_selector('/some/long/path.html.erb')

    assert TestSelector::TestHelper.find_test_selector(html, test_selector) == '<span test-selector="__some_long_path_html_erb"></span><span test-selector="__some_long_path_html_erb"></span>'
  end

  test 'finds the specific one with value' do
    html = '<html> <body><span test-selector="__some_long_path_html_erb__dummy" test-value="2"></span><span test-selector="__some_long_path_html_erb__dummy"></span></body></html>'
    test_selector = TestSelector::TestHelper.test_selector('/some/long/path.html.erb', "dummy", 2)

    assert TestSelector::TestHelper.find_test_selector(html, test_selector), '<span test-selector="__some_long_path_html_erb__dummy" test-value="2"></span>'
  end
end

