require 'rails_helper'

describe Ui::Pagination, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::Pagination,
        [
          '/links',
          '/links?page=2',
          '/links?page=3',
          '/links?page=4'
        ],
        current_path: current_path
      ).()
    }

    context 'on the first page' do
      let(:current_path) { '/links' }

      it 'renders the page links' do
        expect(result).to have_link "1"
        expect(result).to have_link "2"
        expect(result).to have_link "3"
        expect(result).to have_link "4"

        expect(result).to have_xpath "//button[@disabled]"
      end
    end

    context 'on the last page' do
      let(:current_path) { '/links?page=4' }

      it 'renders the page links' do
        expect(result).to have_link "1"
        expect(result).to have_link "2"
        expect(result).to have_link "3"
        expect(result).to have_link "4"

        expect(result).to have_xpath "//button[@disabled]"
      end
    end
  end
end
