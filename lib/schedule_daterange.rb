
module Schedule

    # class to select a range of date
    class DateRange
      include Redmine::I18n
      attr_reader :startdt, :enddt

      def initialize(date, lang = current_language, period = :month)
        @date = date
        set_language_if_valid lang
	calendar = Redmine::Helpers::Calendar.new(@date, lang, period)
        @startdt = calendar.startdt
        @enddt = calendar.enddt
      end

      def active
        @startdt..@enddt
      end
    end
end
