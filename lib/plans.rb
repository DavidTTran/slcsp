class Plans
  @@plans = []

  attr_reader :metal_level

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
end
