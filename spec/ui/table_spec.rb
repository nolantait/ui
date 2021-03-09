require 'rails_helper'

describe Ui::Table, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::Table,
        [
          "Data 1",
          "Data 2",
          "Data 3",
        ],
        columns: [
          ["Column 1", ->(data) { data } ],
          ["Column 2", ->(data) { "Column 2 data" } ],
          ["Column 3", ->(data) { "Column 3 data" } ]
        ],
        header: 'My title',
        style: 'my-style',
        features: {
          selectable: {
            multiple: true
          }
        }
      ).()
    }

    it 'renders the menu items' do
      expect(result).to have_content "My title"
      expect(result).to have_content "Data 1"
      expect(result).to have_content "Data 2"
      expect(result).to have_content "Data 3"

      expect(result).to have_content "Column 2 data"
      expect(result).to have_content "Column 3 data"
      expect(result).to have_css ".my-style"
    end
  end
end
