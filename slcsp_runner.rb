require 'CSV'
require './lib/silver_plans'
require './lib/plans'
require './lib/zip_codes'

files = {
  SilverPlans => 'slcsp.csv',
  Plans => 'plans.csv',
  ZipCodes => 'zips.csv'
}

files.each do |object, path|
  CSV.foreach(path, headers: true, header_converters: :symbol) do |row|
    object.add(object.new(row))
  end
end

silver_plans = Plans.silver_plans
zip_codes = SilverPlans.all.map do |silver_plan|
  ZipCodes.find_by_zip_code(silver_plan.zip_code)
end

y = zip_codes.reduce([]) do |acc, zip_code|
  acc << ZipCodes.check_area(zip_code)
end

x = zip_codes.map do |zip_code|
  Plans.find_by_zip_code(zip_code)
end
require "pry"; binding.pry

# plans_rate = []
# zip_codes.each do |zip_code|
#   zip_code.each do |area|
#     silver_plans.each do |silver_plan|
#       if silver_plan.area_rate == area.area_rate
#         plans_rate << silver_plan.rate.to_f
#       end
#     end
#   end
# end
