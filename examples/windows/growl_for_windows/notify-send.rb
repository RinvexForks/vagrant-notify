#!/usr/bin/env ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Example MS-Windows notify-send wrapper script. Assumes growlnotify.exe is in your 'path'.

require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: notify-send [options]"

  opts.on('-u', '--urgency LEVEL')           { |v| options[:u] = v } # TO DO: Set to /p:priority
  opts.on('-t', '--expire-time TIME')        { |v| options[:t] = v } # Option gets removed 
  opts.on('-a', '--app-name APP_NAME')       { |v| options[:a] = v } # TO DO: Set to /a:application
  opts.on('-i', '--icon ICON[,ICON...]')     { |v| options[:i] = v } # TO DO: Set to /i:icon (url only) 
  opts.on('-c', '--category TYPE[,TYPE...]') { |v| options[:c] = v } # Option gets removed 
  opts.on('-h', '--hint TYPE:NAME:VALUE')    { |v| options[:h] = v } # Option gets removed
  opts.on('-v', '--version')                 { |v| options[:v] = v } # Option gets removed
end.parse!



if ARGV.length == 0
  puts "No summary specified"
elsif ARGV.length == 1
  message = "'#{ARGV[0]}'"
elsif ARGV.length == 2
  title = "/t:'#{ARGV[0]}'"
  message = "'#{ARGV[1]}'"
else
  puts "Invalid number of options."
  exit 1
end

system("growlnotify.exe \"#{message}\"")
