require 'rails_helper'

describe Ui::Notification, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::Notification,
        '<p>My content</p>',
        style: 'my-style',
        icon: 'fas fa-check',
        actions: [
          ->(_) {
            cell(
              Ui::Buttons::Primary,
              'Do something'
            ).()
          }
        ]
      ).()
    }

    it 'renders the menu items' do
      expect(result).to have_content "My content"
      expect(result).to have_content "Do something"

      expect(result).to have_css ".my-style"
      expect(result).to have_css ".fa-check"
    end
  end
end
