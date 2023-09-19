module Api
  module V1
    module Spreadsheet
      class Stock
        attr_accessor :spreadsheet

        def initialize(document:)
          self.spreadsheet = Roo::Spreadsheet.open(document)
        end

        def amount_stock
          stock_sheet.last_row - 1
        end

        def column(name)
          rows = stock_sheet.column(position(name))
          rows.shift()
          rows
        end

        def heading(name)
          SystemConfiguration.first.settings["spreadsheet"]["stock"][name.to_s]
        end

        def headings
          stock_sheet.row(1)
        end

        def position(head_name)
          heading_position = headings.index(heading(head_name))
          raise Errors::NotFoundColumnError.new(heading(head_name)) if heading_position.nil?
          heading_position + 1
        end

        private

        def stock_sheet
          self.spreadsheet.sheet("Acoes")
        end
      end
    end
  end
end
