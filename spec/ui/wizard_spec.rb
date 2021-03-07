require 'rails_helper'

describe Ui::Wizard, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::Wizard,
        [
          {
            title: 'First step',
            subtitle: 'Completed 5 minutes ago',
            status: 'finished',
            description: 'My second step description',
            content: '<p>My content</p>'
          },
          {
            title: 'Second step',
            subtitle: 'ETA 5 minutes',
            status: 'processing',
            icon: 'fas fa-home',
            description: 'My second step description',
            content: '<p>My second content</p>'
          },
        ],
        current_step: 1
      ).()
    }

    it 'renders the menu items' do
      expect(result).to have_content "My content"
      expect(result).to have_content "My second content"
      expect(result).to have_content "Next"
    end
  end
end
