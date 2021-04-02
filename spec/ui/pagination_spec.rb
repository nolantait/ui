require 'rails_helper'

describe Ui::Pagination, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:current_path) { nil }
    let(:html) do
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
    end

    it 'renders its data attributes' do
      expect(result).to have_xpath '//nav[@data-controller="pagination"]'
      expect(result).to have_xpath '//nav[@data-pagination-hidden-class="hidden"]'
      expect(result).to have_xpath '//nav[@data-pagination-window-position-value="1"]'
    end

    context 'on the first page' do
      let(:current_path) { '/links' }

      it 'renders the page links' do
        expect(result).to have_link "1"
        expect(result).to have_link "2"
        expect(result).to have_link "3"
        expect(result).to have_link "4"
        expect(result).to have_css '.ui-pagination__page--current'
        expect(result).to have_css '.ui-pagination__page'

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
