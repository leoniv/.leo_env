#!/usr/bin/env ruby

home = ENV['HOME'].to_s

raise "ENV['HOME'] not found" if home.empty?

$LOAD_PATH.unshift(File.expand_path('lib', __dir__))

require 'leo_env_helper'

case ARGV[0]
when "all"
  puts "Installing into home: #{home}"
  LeoEnvHelper::Installer.new(home).install if ARGV[0] == "all"
when "files"
  puts "Installing files into home: #{home}"
  LeoEnvHelper::Installer.new(home).setup_files if ARGV[0] == "files"
else
  puts "USAGE: install.rb (all|files)"
end
