require 'rails_helper'

describe Ui::Menu, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::Menu,
        [
          ->(_) {
            '<p>Item 1</p>'
          },
          '<p>Item 2</p>',
          [
            '<p>Submenu</p>',
            [
              '<p>Submenu item 1</p>',
              ->(_) {
                '<p>Submenu item 2</p>'
              }
            ]
          ]
        ],
        header: 'My title',
        style: 'my-style'
      ).()
    }

    it 'renders the menu items' do
      expect(result).to have_content "My title"
      expect(result).to have_content "Item 1"
      expect(result).to have_content "Item 2"
      expect(result).to have_content "Submenu item 1"
      expect(result).to have_content "Submenu item 2"
      expect(result).to have_css ".my-style"
    end
  end
end
