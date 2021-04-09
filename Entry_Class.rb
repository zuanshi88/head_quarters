class Entry

  include Marshal

  attr_accessor :first_name, :last_name, :name, :address,
              :street_address, :city, :state, :zipcode,
              :phone_number, :email, :touch_points, :entry_info



  def initialize(hash)
    @first_name = hash["first name"]
    @last_name = hash["last name"]
    @name = "#{first_name} #{last_name}"
    @address = hash["address"]
    @street_address = @address["street_address"]
    @city = @address["city"]
    @state = @address["state"]
    @zipcode = @address["zipcode"]
    @email = hash["email"]
    @touch_points = hash["touch_points"]
    @entry_info = {"first name" => @first_name, "last name" => @last_name, "address" => @address, "phone number" => @phone_number, "email" => @email, "name" => @name, "touch_points" => @touch_points}
  end

    def first_name=(first_name)
      @first_name = first_name
      @entry_info["first name"] = first_name
      @name = "#{first_name} @last_name"
    end

    def last_name=(last_name)
      @last_name = last_name
      @entry_info["last name"] = last_name
      @name = "@first_name #{last_name}"
    end

    def touch_points=(reset)
      @touch_points = reset
      @entry_info["touch_points"] = reset
    end

end
