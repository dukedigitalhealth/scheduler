module Scheduler
  module Util
    class Time
      def self.current_time_in_time_zone(time_zone: 'Eastern Time (US & Canada)')
        ActiveSupport::TimeZone
          .new(time_zone)
          .now
      end

      def self.natural_language_time_in_time_zone(natural_language_time)
        Chronic
          .parse(natural_language_time)
          .utc
      end

      def self.natural_language_time_to_utc(natural_language_time, time_zone: 'Eastern Time (US & Canada)')
        preserved_time_class = Chronic.time_class
        Chronic.time_class = ActiveSupport::WithTimeZone.new(time_zone)
        time = Chronic.parse(natural_language_time)
        Chronic.time_class = preserved_time_class
        time
      end

      def self.time_string_to_utc(time_as_string, time_zone: 'Eastern Time (US & Canada)')
        ActiveSupport::TimeZone
          .new(time_zone)
          .parse(time_as_string)
          .utc
      end

      def self.utc_to_local_time_zone(time_zone: 'Eastern Time (US & Canada)')
        ::Time
          .now
          .utc
          .in_time_zone(time_zone)
      end
    end
  end
end
