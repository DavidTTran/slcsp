class SilverPlans
  @@silver_plans = []

  attr_reader :zip_code

  def initialize(info)
    @rate = info[:rate]
    @zip_code = info[:zipcode]
  end

  def self.add(silver_plan)
    @@silver_plans << silver_plan
  end

  def self.all
    @@silver_plans
  end

  def self.adjust_rate()
  end
end
