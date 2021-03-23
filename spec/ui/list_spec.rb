require 'rails_helper'

describe Ui::List, type: :cell do
  controller ApplicationController

  class TestRenderer < Ui::Component
    def show
      content_tag(:p, 'test rendered')
    end
  end

  let(:result) { html }
  let(:list_options) {
    {
      header: 'My header',
      style: 'my-style',
      footer: 'My footer',
      actions: [
        ->(_) {
          '<a href="#">My link</a>'
        }
      ],
      empty: cell(
        Ui::Empty,
        nil,
        caption: 'I am empty'
      ).()
    }
  }

  context '#show' do
    let(:html) {
      cell(
        Ui::List,
        data,
        **list_options
      ).()
    }

    let(:data) {
      [
        'Item 1',
        'Item 2',
        'Item 3'
      ]
    }


    context 'with data' do
      it 'renders the menu items' do
        expect(result).to have_content "My header"
        expect(result).to have_content "Item 1"
        expect(result).to have_content "Item 2"
        expect(result).to have_content "Item 3"
        expect(result).to have_content "My footer"
        expect(result).to have_link "My link"

        expect(result).to have_css ".my-style"
      end
    end

    context 'with no data' do
      let(:data) { Array.new }

      it 'renders an empty item' do
        expect(result).to have_content "I am empty"
      end
    end

    context 'with a custom item renderer' do
      let(:html) {
        cell(
          Ui::List,
          data,
          **list_options.merge({
            item_renderer: ->(item) {
              TestRenderer.new(item).call(:show)
            }
          })
        ).()
      }

      it 'renders with the custom renderer' do
        expect(result).to have_content 'test rendered'
      end
    end
  end
end
