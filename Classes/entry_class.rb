class Entry

  attr_accessor :first_name, :last_name, :name, :address,
              :street_address, :city, :state, :zipcode,
              :phone_number, :email, :touch_points



  def initialize(hash)
    @first_name = hash["first name"] || ""
    @last_name = hash["last name"] || ""
    @name = "#{@first_name} #{@last_name}" || ""
    @address = hash["address"] || ""
    @street_address = @address["street_address"] || ""
    @city = @address["city"] || ""
    @state = @address["state"] || ""
    @zipcode = @address["zipcode"] || ""
    @phone_number = hash["phone number"] || ""
    @email = hash["email"] || ""
    @touch_points = []
  end

    def first_name=(first_name)
      @first_name = first_name
      @name = "#{@first_name} #{@last_name}"
    end

    def last_name=(last_name)
      @last_name = last_name
      @name = "#{@first_name} #{@last_name}"
    end

    def touch_points=(reset)
      @touch_points = reset
      @entry_info["touch_points"] = reset
    end

end
