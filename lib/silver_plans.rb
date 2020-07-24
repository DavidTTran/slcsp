class SilverPlans
  @@silver_plans = []

  def initialize(info)
    @rate = info[:rate]
    @zip_code = info[:zip_code]
  end

  def self.add(silver_plan)
    @@silver_plans << silver_plan
  end

  def self.all
    @@silver_plans
  end
end
