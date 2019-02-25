# frozen_string_literal: true

require 'test_helper'

class TestSelector::HTMLHelperTest < ActionDispatch::IntegrationTest
  test "the test_selector's should return the right input in html" do
    get '/some/path'

    assert_includes response.body, '<span test-selector=_app_views_some_path__partial_html_erb__dummy>1</span>'
    assert_includes response.body, '<span test-selector=_app_views_some_path__partial_html_erb__dummy test-value=1>1</span>'
    assert_includes response.body, '<span test-selector=_app_views_some_path__partial_html_erb>1</span>'
  end
end
