require 'rails_helper'

describe Ui::Tooltip, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::Buttons::Primary,
        'My button',
        layout: Ui::Tooltip,
        context: {
          tooltip: {
            content: ->() { '<p>Tooltip content</p>' },
            header: 'Tooltip header'
          }
        }
      ).()
    }

    it 'renders the menu items' do
      expect(result).to have_content "Tooltip content"
      expect(result).to have_content "Tooltip header"
    end
  end
end
