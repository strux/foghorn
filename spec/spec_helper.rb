ENV["RACK_ENV"] ||= 'test'

require 'rspec'

Dir["./lib/**/*.rb"].sort.each {|f| require f}
Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|
end
