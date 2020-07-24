class ZipCodes
  @@zip_codes = []

  attr_reader :zip_code

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

  def self.find_by_zip_code(zip_code)
    all.find_all { |object| object.zip_code == zip_code }
  end
end
