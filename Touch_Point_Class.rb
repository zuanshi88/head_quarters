


class Touch_Point

  attr_reader :date, :create_date, :activity, :account_name, :account, :date_obj


    def initialize(entry, create_date)
          @date_obj = create_date
          @date = create_date.strftime("%m/%d/%Y")
          puts "Activity: "
          @activity = gets.chomp
          @account = entry
          @account_name = @account.name
    end
end
