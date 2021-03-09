require 'rails_helper'

describe Ui::Empty, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::Empty,
        nil,
        caption: 'My caption',
        image: 'https://www.website.com/image.jpg',
        style: 'my-style',
        actions: [
          ->(_) {
            cell(
              Ui::Buttons::Tertiary,
              'My action',
            ).()
          }
        ]
      ).()
    }

    it 'renders the menu items' do
      expect(result).to have_content "My caption"
      expect(result).to have_link "My action"
      expect(result).to have_css ".my-style"
      expect(result).to have_xpath "//img"
    end
  end
end
