require 'rails_helper'

describe Ui::Wizard, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) do
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
    end

    it 'renders the menu items' do
      expect(result).to have_content 'My content'
      expect(result).to have_content 'My second content'
      expect(result).to have_content 'Next'
      expect(result).to have_xpath '//article[@data-controller="wizard"]'
      expect(result).to have_xpath '//article[@data-wizard-hidden-class="hidden"]'
      expect(result).to have_xpath '//article[@data-wizard-current-step-class="ui-step--current"]'
      expect(result).to have_xpath '//article[@data-wizard-step-position-value="1"]'
    end
  end
end
