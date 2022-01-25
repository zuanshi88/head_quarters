class Entry

  attr_accessor :first_name, :last_name, :name, :address,
              :street_address, :city, :state, :zipcode,
              :phone_number, :email, :touch_points



  def initialize(hash)
    @first_name = hash["first name"] || "filler"
    @last_name = hash["last name"] || "filler"
    @name = "#{@first_name} #{@last_name}" || "filler"
    @address = hash["address"] || "filler"
    @street_address = @address["street_address"] || "filler"
    @city = @address["city"] || "filler"
    @state = @address["state"] || "filler"
    @zipcode = @address["zipcode"] || "filler"
    @phone_number = hash["phone number"] || "filler"
    @email = hash["email"] || "filler"
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
