require 'rails_helper'

describe Ui::Card, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) do
      cell(
        Ui::Card,
        'Some title',
        extra: '<a href="#">More</a>',
        style: 'my-style'
      ).() do
        '<p>My content</p>&lt;h1&gt;Hello world&lt;/h1&gt;'
      end
    end

    it 'renders the menu items' do
      expect(result).to have_content 'Some title'
      expect(result).to have_content 'My content'
      expect(result).not_to have_xpath '//h1'
      expect(result).to have_css '.my-style'
    end
  end
end
