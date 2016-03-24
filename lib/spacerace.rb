class SpaceRace
  require 'fileutils'
  
  VERSION = '0.0.3'
  
  def initialize(options = {})
    @space       = options[:space]       || '\t'
    @replacement = options[:replacement] || "  "
    @reduce      = options[:reduce]      || 1
    @no_backup   = options[:nobackup]    || false
    
    # puts "Space: `#{@space}`", "Replacement: `#{@replacement}`", "Reduce: #{@reduce}"
  end
  
  def respace_line(line)
    regex = /^#{@space}*/
    white_space = line.scan(regex).first
    if (white_space)
      amount = white_space.length
      line.gsub(regex, padd((amount.to_i/@reduce.to_i).to_i, @replacement))
    else
      line
    end
  end

  def respace_file(file)
    original = "#{file}.original"
    FileUtils.copy file, original

    out_file = File.open file, "w"

    File.foreach original do |line|
      out_file.write respace_line(line)
      # puts respace_line(line, @space, @replacement, @reduce)
    end

    out_file.close
    FileUtils.rm(original) if @no_backup
  end
  
  private
  
  def padd(amount, string)
    padded = ""; amount.times { padded << string }; padded
  end
  
end