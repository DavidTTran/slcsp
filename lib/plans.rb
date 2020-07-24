class Plans
  def initialize(info)
    @plan_id = info[:plan_id]
    @state = info[:state]
    @metal_level = info[:metal_level]
    @rate = info[:rate]
    @rate_area = info[:rate_area]
  end
end
