
class Touch_Point

  attr_reader :date, :create_date, :activity, :account_name, :account, :date_obj

#if I add a class variable using an existing variable, will I crash my program? 
# this has a code smell. Needing to have the entry available 
# at the time of initiliazing. 
# this just should me that I want to seperate getting the info from creating the touch_point. 
    def initialize(entry, create_date, activity)
          @date_obj = create_date
          @date = create_date.strftime("%m/%d/%Y")
          @activity = activity
          @account = entry
          @account_name = entry.name
    end
end
