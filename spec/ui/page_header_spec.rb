require 'rails_helper'

describe Ui::PageHeader, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    context 'with a custom renderer' do
      let(:html) {
        cell(
          described_class,
          'Title',
          subheading: 'Subheading',
          back: '#',
          breadcrumbs: cell(
            Ui::Breadcrumbs,
            [
              Ui::Breadcrumbs::Crumb.new(name: 'Breadcrumb 1'),
              Ui::Breadcrumbs::Crumb.new(name: 'Breadcrumb 2')
            ]
          ),
        ).call(:show)
      }

      it 'renders the button' do
        expect(result).to have_content "Breadcrumb 1"
        expect(result).to have_content "Breadcrumb 2"

        expect(result).to have_css '.fa-arrow-left'

        expect(result).to have_content 'Title'
        expect(result).to have_content 'Subheading'
      end
    end
  end
end
