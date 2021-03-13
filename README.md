# Organism Ui
Ui components made with cells (https://github.com/trailblazer/cells). This library is in ALPHA and subject to change anytime and dramatically before 1.0.

## Usage

### Components
Components are just configurable cells (https://github.com/trailblazer/cells) for basic ui components. Inspired by ant.design.

You render components in your views or controllers:
```ruby
<%= cell(
  Ui::Buttons::Primary,
  'Primary Button',
  path: '/'
) %>
```

You can see full examples of components in the style guide: https://github.com/nolantait/organism-ui/blob/master/app/views/ui/style_guide/show.html.erb

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'organism-ui'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install organism-ui
```

## Style guide
To quickly style your components you can mount the engine and navigate to an example style guide.

```ruby
Rails.application.routes.draw do
  mount Ui::Engine => "/ui"
end
```

You can then navigate to localhost:3000/ui/style_guide to see your components.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
