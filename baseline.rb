require 'rubygems'
require 'bundler/setup'
require 'coverband'
require 'json'
require 'logger'

Coverband.configure

Coverband::Reporter.baseline {
      require './blah.rb'
}