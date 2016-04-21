module ValidateCitiesHelpers
  def validate_cities cities
    cities.split(',').each do | city |
      if !["A","B","C","D","E"].include? city
        fail! raise ArgumentError.new 'Invalid City: #{city}'
      end
    end
  end
end
World(ValidateCitiesHelpers)
