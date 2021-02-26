require 'rails_helper'

describe Ui::Buttons::Base, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        described_class,
        'Hello',
        path: '#',
        data: {
          something: 'test'
        },
        method: :delete
      ).call(:show)
    }

    it 'renders the button' do
      expect(result).to have_xpath '//a'
      expect(result).to have_css '.button'
      expect(result).to have_content 'Hello'
      expect(result).to have_xpath "//a[@data-something='test']"
      expect(result).to have_xpath "//a[@data-method='delete']"
    end
  end

  context '#new' do
    let(:html) {
      cell(
        described_class,
        'Hello',
        path: '#',
        data: {
          something: 'test'
        },
        method: :delete
      ).call(:new)
    }

    it 'renders the button' do
      expect(result).to have_xpath '//a'
      expect(result).to have_css '.button'
      expect(result).to have_content 'Hello'
      expect(result).to have_xpath "//a[@data-something='test']"
      expect(result).to have_xpath "//a[@data-method='delete']"
    end
  end

end
