require 'rails_helper'

describe Ui::Steps, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::Steps,
        [
          {
            title: 'First step',
            subtitle: 'Completed 5 minutes ago',
            status: 'finished',
            description: 'My second step description'
          },
          {
            title: 'Second step',
            subtitle: 'ETA 5 minutes',
            status: 'processing',
            icon: 'fas fa-home',
            description: 'My second step description'
          },

        ],
        current_step: 1
      ).()
    }

    it 'renders the menu items' do
      expect(result).to have_content "First step"
      expect(result).to have_content "Second step"
      expect(result).to have_css ".fa-check"
      expect(result).to have_css ".fa-home"
      expect(result).to have_css ".ui-step__icon"
    end
  end
end
