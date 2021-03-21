require 'rails_helper'

describe Ui::DescriptiveList, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::DescriptiveList,
        [
          ["Name", "John Doe"],
          ["Phone number", "778-212-2322"],
          ["Street address", "1233 Fake Street"],
          ["Status", ->() { '<i class="fas fa-ellipsis-h"></i>' }]
        ],
        header: 'My title',
      ).()
    }

    it 'renders the menu items' do
      expect(result).to have_content "My title"

      expect(result).to have_content "Name"
      expect(result).to have_content "Phone number"
      expect(result).to have_content "Street address"
      expect(result).to have_content "Status"

      expect(result).to have_content "John Doe"
      expect(result).to have_content "778-212-2322"
      expect(result).to have_content "1233 Fake Street"
      expect(result).to have_css ".fa-ellipsis-h"
    end
  end
end
