require 'rails_helper'

describe Ui::Collapse, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::Collapse,
        [
          ["Header 1", "Content 1"],
          ["Header 2", ->() { "Content 2" }]
        ],
        style: 'my-style'
      ).()
    }

    it 'renders the menu items' do
      expect(result).to have_content "Header 1"
      expect(result).to have_content "Header 2"
      expect(result).to have_content "Content 1"
      expect(result).to have_content "Content 2"
      expect(result).to have_css ".my-style"
    end
  end
end
