#!/usr/bin/env ruby

home = ENV['HOME'].to_s

raise "ENV['HOME'] not found" if home.empty?

puts "Installing into home: #{home}"

$LOAD_PATH.unshift(File.expand_path('lib', __dir__))

require 'leo_env_helper'

LeoEnvHelper::Installer.new(home).run

