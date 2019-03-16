# frozen_string_literal: true

module TestSelector
  module TestHelper
    def test_selector(path, name = nil, value = nil)
      underscore_path = path.gsub(%r{/|\.}, '_')

      if name && value
        "test-selector=_#{underscore_path}__#{name} test-value=#{value}"
      elsif name
        "test-selector=_#{underscore_path}__#{name}"
      else
        "test-selector=_#{underscore_path}"
      end
    end

    def find_test_selector(html, selector)
      test_selector = selector.split(' ').first
      test_value = selector.split(' ').second
      doc = Nokogiri::HTML(html).css("[#{test_selector}]")
      if test_value
        doc.css("[#{test_value}]")
      else
        doc
      end
    end
  end
end
