#!/usr/bin/env ruby
# encoding: utf-8

TOOL_NAME = "spacerace"
VERSION = '0.0.1'
HOME_PAGE = ""
USAGE = "Usage: #{TOOL_NAME} (FILES|GLOBS)... [options]"

require 'optparse'

options = Hash.new
OptionParser.new do |opts|
  opts.banner = USAGE

  opts.on "-s COUNT", "--spaces COUNT", "Number of spaces" do |o|
    options[:spaces] = o || 2
  end

  opts.on "--no-backup", "Do not create a backup of the original" do |o|
    options[:nobackup] = o
  end

  opts.on "-r", "--recursive", "Replace all" do |o|
    options[:recursive] = o
  end

  # ==================
  # = Common Options =
  # ==================

  opts.separator ""
  opts.separator "Common options:"

  opts.on "-v", "--version", "Print version" do
    puts "#{TOOL_NAME} - version #{VERSION}", HOME_PAGE
    exit
  end

  opts.on "-h", "--help", "Prints this help" do
    puts opts
    exit
  end

end.parse!

if ARGV.empty?
  puts USAGE
  exit
end

class SpaceRace
  require 'fileutils'
  
  def initialize(options)
    @spaces = options[:spaces] || 2
    @no_backup = options[:nobackup] || false
  end
  
  def spaces_to_tabs(line, spaces = 2)
    amount = line.scan(/^ */).first.length
    line.gsub(/^ {,#{amount}}/, "".ljust((amount/spaces).to_i, "\t"))
  end

  def replace(file)
    original = "#{file}.orginial"
    FileUtils.cp file, original

    out_file = File.open file, "w"

    File.foreach original do |line|
      out_file.write spaces_to_tabs(line, @spaces)
    end

    out_file.close
    FileUtils.rm(original) if @no_backup
  end
end

replacer = SpaceRace.new(options)
ARGV.each { |path| replacer.replace(path) }
