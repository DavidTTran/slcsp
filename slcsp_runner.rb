require 'CSV'

files = {
  SilverPlans => 'slcsp.csv',
  Plans => 'plans.csv'
  ZipCodes => 'zips.csv'
}

files.each do |object, path|
  CSV.foreach(path, headers: true, header_converters: :symbol) do |row|
    object.new(row)
  end
end
