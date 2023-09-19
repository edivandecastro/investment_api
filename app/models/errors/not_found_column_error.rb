module Errors
  class NotFoundColumnError < StandardError
    def initialize(column_name)
      @column_name = column_name
    end

    def message
      I18n.t('comand.errors.spredsheet_column_not_found', name: @column_name)
    end
  end
end
