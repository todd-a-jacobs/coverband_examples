require 'rubygems'
require 'bundler/setup'
require 'coverband'
require 'json'
require 'logger'

Coverband.configure

require_relative 'blah'

coverband = Coverband::Base.instance
coverband.start

foo 1
foo 2

coverband.stop
coverband.save
Coverband::Reporter.report