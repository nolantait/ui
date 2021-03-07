require 'rails_helper'

describe Ui::Card, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::Card,
        'Some title',
        extra: '<a href="#">More</a>',
        style: 'my-style'
      ).() do
        '<p>My content</p>'
      end
    }

    it 'renders the menu items' do
      expect(result).to have_content "Some title"
      expect(result).to have_content "My content"
      expect(result).to have_css ".my-style"
    end
  end
end
