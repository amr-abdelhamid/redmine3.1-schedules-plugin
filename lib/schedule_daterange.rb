
module Schedule

    # class to select a range of date
    class DateRange
      include Redmine::I18n
      attr_reader :startdt, :enddt, :active

      def initialize(date, lang = current_language, period = :month, week_count = 1)
        @date = date
        set_language_if_valid lang
        calendar = Redmine::Helpers::Calendar.new(@date, lang, period)
        @startdt = calendar.startdt
        @enddt = calendar.enddt
        if :week == period
                @enddt += (week_count-1) * 7
        end
        @active=(@startdt..@enddt)
      end

      # TODO
      def set_opendays()
        @active=(@startdt..@enddt-2)
      end
    end
end
