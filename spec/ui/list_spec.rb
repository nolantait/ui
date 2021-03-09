require 'rails_helper'

describe Ui::List, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::List,
        data,
        header: 'My header',
        style: 'my-style',
        footer: 'My footer'
      ).()
    }

    context 'with data' do
      let(:data) {
        [
          'Item 1',
          'Item 2',
          'Item 3'
        ]
      }

      it 'renders the menu items' do
        expect(result).to have_content "My header"
        expect(result).to have_content "Item 1"
        expect(result).to have_content "Item 2"
        expect(result).to have_content "Item 3"
        expect(result).to have_content "My footer"
        expect(result).to have_css ".my-style"
      end
    end

    context 'with no data' do
      let(:data) { Array.new }

      it 'renders an empty item' do
        expect(result).to have_content "No data"
      end
    end
  end
end
