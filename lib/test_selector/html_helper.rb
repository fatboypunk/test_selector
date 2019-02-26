# frozen_string_literal: true

module TestSelector
  module HTMLHelper
    def test_selector(name = nil, value = nil)
      return if disable?

      called_by = caller
      setup_test_selector(called_by, name, value)
    end

    private

    def setup_test_selector(called_by, name = nil, value = nil)
      return if disable?

      if name && value
        "test-selector=#{get_selector(called_by)}__#{name} test-value=#{value}"
      elsif name
        "test-selector=#{get_selector(called_by)}__#{name}"
      else
        "test-selector=#{get_selector(called_by)}"
      end
    end

    def get_selector(called_by)
      return if disable?

      first_line = called_by.split('/n').first.first
      file_hash = first_line.split('`').second
      file_under_path = "#{file_hash.split('_erb__').first}_erb"
    end

    def disable?
      Rails.env == 'production'
    end
  end
end

ActionView::Base.send :include, TestSelector::HTMLHelper
