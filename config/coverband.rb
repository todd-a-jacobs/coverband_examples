require 'rubygems'
require 'bundler/setup'
require 'coverband'
require 'json'
require 'logger'

baseline = Coverband.parse_baseline

Coverband.configure do |config|
  config.root              = Dir.pwd
  
  if defined? Redis
    config.redis           = Redis.new(:host => ENV['TEST_REDIS_HOST'], :port => ENV['TEST_REDIS_PORT'], :password => ENV['TEST_REDIS_PASS'])
  end
  
  config.coverage_baseline = baseline
  config.root_paths        = [] # /app/ is needed for heroku deployments
  config.ignore            = ['vendor']
  config.percentage        = 100.0

  config.logger            = Logger.new($stdout)
  
  #config.reporter          = 'txt'
  
  # config options false, true, or 'debug'. Always use false in production
  # true and debug can give helpful and interesting code usage information
  # they both increase the performance overhead of the gem a little.
  # they can also help with initially debugging the installation.
  config.verbose           = 'debug'
end