#!/bin/env ruby

home = ENV['HOME'].to_s

fail "ENV['HOME'] not found" if home.empty?

puts "Installing into home: #{home}"

$LOAD_PATH.unshift( File.expand_path('../lib', __FILE__))

require 'leo_env_helper'

LeoEnvHelper::Installer.new(home).run
