
class Touch_Point

  attr_reader :date_obj, :date, :activity, :account, :account_name

    def initialize(entry_id, entry_name, create_date, activity)
          @date_obj = create_date
          @date = create_date.strftime("%m/%d/%Y")
          @activity = activity
          @account = entry_id
          @account_name = entry_name
    end

end
