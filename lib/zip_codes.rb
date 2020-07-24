class ZipCodes
  @@zip_codes = []

  attr_reader :zip_code, :state, :rate_area

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

  def area_rate
    @state + @rate_area
  end

  def self.similar_area_rate(zip_codes)
    zip_codes.all? do |zip_code|
      zip_code.area_rate == zip_codes[0].area_rate
    end
  end

  def self.check_area(zip_codes)
    return zip_codes if zip_codes.length < 2
    return zip_codes if similar_area_rate(zip_codes)
    nil
  end
end
