# This file is used by Rack-based servers to start the application.

require 'faye'
require ::File.expand_path('../config/environment',  __FILE__)

bayeux = Faye::RackAdapter.new(
  Rails.application,
  :mount => '/faye',
  :timeout => 25,
)

run bayeux
