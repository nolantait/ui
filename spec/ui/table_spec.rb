require 'rails_helper'

describe Ui::Table, type: :cell do
  controller ApplicationController
  let(:result) { html }

  context '#show' do
    let(:html) {
      cell(
        Ui::Table,
        data,
        columns: [
          ["Column 1", ->(data) { data } ],
          ["Column 2", ->(data) { "Column 2 data" } ],
          ["Column 3", ->(data) { "Column 3 data" } ]
        ],
        header: 'My title',
        style: 'my-style',
        orientation: orientation,
        features: {
          selectable: {
            multiple: true
          }
        }
      ).()
    }

    context 'with a custom row and header renderer' do
      let(:orientation) { 'horizontal' }
      let(:data) {
        [
          "Data 1",
          "Data 2",
          "Data 3",
        ]
      }
      let(:html) {
        cell(
          Ui::Table,
          data,
          columns: [
            ["Column 1", ->(data) { data } ],
            ["Column 2", ->(data) { "Column 2 data" } ],
            ["Column 3", ->(data) { "Column 3 data" } ]
          ],
          header: 'My title',
          style: 'my-style',
          orientation: orientation,
          header_renderer: ->(column) {
            cell(
              Ui::Table::Header,
              column,
              style: 'my-custom-header'
            ).()
          },
          row_renderer: ->(row, columns) {
            cell(
              Ui::Table::Row,
              row,
              columns: columns,
              style: 'my-custom-row'
            ).()
          },
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
        expect(result).to have_css ".my-custom-header"
        expect(result).to have_css ".my-custom-row"
      end
    end

    context 'in a horizontal table' do
      let(:orientation) { 'horizontal' }

      context 'with data' do
        let(:data) {
          [
            "Data 1",
            "Data 2",
            "Data 3",
          ]
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

      context 'without data' do
        let(:data) { Array.new }

        it 'renders an empty row' do
          expect(result).to have_content 'No data'
        end
      end
    end

    context 'in a vertical table' do
      let(:orientation) { 'vertical' }

      context 'with data' do
        let(:data) {
          [
            "Data 1",
            "Data 2",
            "Data 3",
          ]
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

      context 'without data' do
        let(:data) { Array.new }

        it 'renders an empty row' do
          expect(result).to have_content 'No data'
        end
      end
    end
  end
end
