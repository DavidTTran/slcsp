class Runner

  def self.from_csv(files)
    files.each do |object, path|
      CSV.foreach(path, headers: true, header_converters: :symbol) do |row|
        object.add(object.new(row))
      end
    end
  end

  def self.find_slcsp
    SilverPlans.all.each do |silver_plan|
      zip_codes = ZipCodes.find_by_zip_code(silver_plan.zip_code)
      rate = Plans.find_by_zip_code(zip_codes) unless zip_codes.nil?

      silver_plan.adjust_rate(rate)
    end
  end

  def self.output_slcsp(x)
    CSV.open("new_slcsp.csv", "wb") do |csv|
      csv << SilverPlans.attributes
      SilverPlans.all.each do |plan|
        csv << plan.values
      end
    end
  end
end
