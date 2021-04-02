require 'rails_helper'

describe Ui::Dropdown, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) do
      cell(
        Ui::Dropdown,
        cell(
          Ui::Menu,
          [
            ->(_) {
              '<p>Item 1</p>'
            },
            ->(_) {
              '<p>Item 2</p>'
            }
          ]
        ).()
      ).() do
        cell(
          Ui::Buttons::Primary,
          'Hover me',
          icon: 'fas fa-caret-down'
        ).()
      end
    end

    it 'renders the dropdown' do
      expect(result).to have_content 'Item 1'
      expect(result).to have_content 'Item 2'
      expect(result).to have_content 'Hover me'
    end
  end
end
