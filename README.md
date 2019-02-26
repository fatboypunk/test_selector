# TestSelector
Based on [TestSelector](https://github.com/DefactoSoftware/test_selector) for
Elixir, a gem that adds a `test-selector` to the HTML so it can be found in the
tests.

## Usage
After installing this gem the views have a helper method `test_selector` that
can be used as:

```erb
<!--- app/views/some/view.erb --->
<p <%= test_selector "description", 1 %>the description of entity 1</p>

<p <%= test_selector "description", 2 %>the description of entity 2</p>
```

That will result in:

```HTML
<p test-selector="_app_views_some_view_erb__description" test-value="1">the description of entity 1</p>

<p test-selector="_app_views_some_view_erb__description" test-value="2">the description of entity 2</p>
```

In the test this can be found with:

```rb
it "assert the second description" do
  ... # some setup

  test_part = test_selector(path, "description", 1)
  expect(find_test_selector page.body, test_part).to have_content "the description of entity 2"
end
```


## Installation
Add this line to your application's Gemfile:

- dependencie: rails

Add to `:development` and `:test` in the `Gemfile`
```ruby
gem 'test_selector'
```

Execute:
```bash
$ bundle
```

`include` in the test framework you're using, for RSpec:
```erb
require 'test_selector'

RSpec.configure do |config|
  ...

  config.include TestSelector::TestHelpers
end
```


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
