class ZipCodes
  def initialize(info)
    @zip_code = info[:zipcode]
    @state = info[:state]
    @county_code = info[:county_code]
    @name = info[:name]
    @rate_area = info[:rate_area]
  end
end
