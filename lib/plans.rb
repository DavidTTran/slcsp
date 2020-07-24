class Plans
  @@plans = []

  attr_reader :metal_level, :rate

  def initialize(info)
    @plan_id = info[:plan_id]
    @state = info[:state]
    @metal_level = info[:metal_level]
    @rate = info[:rate]
    @rate_area = info[:rate_area]
  end

  def self.add(plan)
    @@plans << plan
  end

  def self.all
    @@plans
  end

  def self.silver_plans
    all.find_all do |plan|
      plan.metal_level == 'Silver'
    end
  end

  def area_rate
    @state + @rate_area
  end

  def self.find_by_zip_code(zip_code)
    collection = []
    silver_plans.each do |plan|
      if plan.area_rate == zip_code[0].area_rate
        collection << plan.rate.to_f
      end
    end
    return collection.sort[1].round(2) if collection.length > 1
    nil
  end
end
