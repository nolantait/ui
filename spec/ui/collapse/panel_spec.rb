require 'rails_helper'

describe Ui::Collapse::Panel, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) do
      cell(
        Ui::Collapse::Panel,
        ['Header 1', 'Content 1'],
        style: 'my-style',
        actions: [
          ->(_) {
            '<a href="#">My action</a>'
          }
        ]
      ).()
    end

    it 'renders the menu items' do
      expect(result).to have_content 'Header 1'
      expect(result).to have_content 'Content 1'
      expect(result).to have_css '.my-style'
      expect(result).to have_link 'My action'
      expect(result).to have_xpath '//article[@data-controller="collapsable"]'
      expect(result).to have_xpath '//article[@data-collapsable-hidden-class="hidden"]'
      expect(result).to have_xpath '//article[@data-collapsable-collapsed-value="true"]'
      expect(result).to have_xpath '//article[@data-collapsable-collapsed-class="ui-collapsed"]'
    end
  end
end
