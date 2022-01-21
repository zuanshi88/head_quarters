class WordIndex

        def initialize(accounts)
            @accounts = accounts
        end

        def index
            information = ["name", "last_name", "first_name"]
            index_hash = {}
            @accounts.cycle(1) do |obj|
            index_hash[obj.name.downcase] = [] if index_hash[obj.name.downcase].nil?
            index_hash[obj.name.downcase].push(obj)
            index_hash[obj.last_name.downcase] = [] if index_hash[obj.last_name.downcase].nil?
            index_hash[obj.last_name.downcase].push(obj)
            index_hash[obj.first_name.downcase] = [] if index_hash[obj.first_name.downcase].nil?
            index_hash[obj.first_name.downcase].push(obj)
            index_hash[obj.city.downcase] = [] if index_hash[obj.city.downcase].nil?
            index_hash[obj.city.downcase].push(obj)
            index_hash[obj.state.downcase] = [] if index_hash[obj.state.downcase].nil?
            index_hash[obj.state.downcase].push(obj)
            end
            index_hash
        end
end