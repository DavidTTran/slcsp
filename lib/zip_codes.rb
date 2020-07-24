class ZipCodes
  @@zip_codes = []

  def initialize(info)
    @zip_code = info[:zipcode]
    @state = info[:state]
    @county_code = info[:county_code]
    @name = info[:name]
    @rate_area = info[:rate_area]
  end

  def self.add(zip_code)
    @@zip_codes << zip_code
  end

  def self.all
    @@zip_codes
  end
end
