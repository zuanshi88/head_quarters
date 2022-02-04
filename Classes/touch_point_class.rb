
class Touch_Point

  attr_reader :date_obj, :date, :activity, :account, :account_name

#if I add a class variable using an existing variable, will I crash my program? 
# this has a code smell. Needing to have the entry available 
# at the time of initiliazing. 
# this just should me that I want to seperate getting the info from creating the touch_point. 
    def initialize(entry_id, entry_name, create_date, activity)
          @date_obj = create_date
          @date = create_date.strftime("%m/%d/%Y")
          @activity = activity
          @account = entry_id
          @account_name = entry_name
    end
end
