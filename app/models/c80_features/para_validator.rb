module C80Features
  class ParaValidator < ActiveModel::Validator
    def validate(record)
      puts "<ParaValidator.validate> record = #{record}"

      # unless record.title.present?
      #   record.errors[:title] = 'Укажите заголовок'
      # end

      unless record.content.present?
        record.errors[:content] = 'Заполните текст'
      end

    end
  end
end