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
