require_relative 'runner_helper'

files = {
  SilverPlans => 'slcsp.csv',
  Plans => 'plans.csv',
  ZipCodes => 'zips.csv'
}

Runner.from_csv(files)
Runner.output_slcsp(Runner.find_slcsp)
