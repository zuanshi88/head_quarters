


class Touch_Point

  attr_reader :date, :create_date, :activity, :person, :entry_info

  attr_accessor :save_info

  POINTS = []

    def initialize(name, activity, create_date = Time.now)

          if create_date.class == String
            create_date = Time.new(create_date)
          end

          @create_date = create_date
          @date = @create_date.strftime("%m/%d/%Y")
          @activity = activity
          @person = name
          @entry_info = {"person" => @person, "activity" => @activity, "create_date" => @create_date}
    end

    def add_point
      POINTS << self
    end


end
