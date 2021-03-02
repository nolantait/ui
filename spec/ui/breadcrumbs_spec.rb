require 'rails_helper'
require 'ui/component'

describe Ui::Breadcrumbs, type: :cell do
  controller ApplicationController
  let(:result) { html }
  let(:breadcrumbs) {
    [
      Ui::Breadcrumbs::Crumb.new(path: '#', name: 'Breadcrumb 1', current: true),
      Ui::Breadcrumbs::Crumb.new(path: '#', name: 'Breadcrumb 2', current: false)
    ]
  }

  class TestRenderer < Ui::Component
    def show
      content_tag(:p, 'test rendered')
    end
  end

  context '#show' do
    context 'with a custom renderer' do
      let(:html) {
        cell(
          described_class,
          breadcrumbs,
          delimiter: '<span>></span>',
          item_renderer: ->(item) {
            TestRenderer.new(item).call(:show)
          }
        ).call(:show)
      }

      it 'renders the button' do
        expect(result).to have_xpath "//p"
        expect(result).to have_css '.ui-breadcrumbs'
        expect(result).to have_content 'test rendered'
        expect(result).to have_xpath '//span'
      end
    end

    context 'with a default renderer' do
      let(:html) {
        cell(
          described_class,
          breadcrumbs,
        ).call(:show)
      }

      it 'renders the button' do
        expect(result).to have_css '.ui-breadcrumbs'
      end
    end
  end
end
