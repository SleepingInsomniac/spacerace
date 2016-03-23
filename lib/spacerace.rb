class SpaceRace
  require 'fileutils'
  
  VERSION = '0.0.1'
  
  def initialize(options = {})
    @space       = options[:space]       || '\t'
    @replacement = options[:replacement] || "  "
    @reduce      = options[:reduce]      || 1
    @no_backup   = options[:nobackup]    || false
    
    # puts "Space: `#{@space}`", "Replacement: `#{@replacement}`", "Reduce: #{@reduce}"
  end
  
  def respace_line(line)
    regex = /^#{@space}*/
    amount = line.scan(regex).first.length
    line.gsub(regex, padd((amount/@reduce).to_i, @replacement))
  end

  def respace_file(file)
    original = "#{file}.original"
    FileUtils.copy file, original

    out_file = File.open file, "w"

    File.foreach original do |line|
      out_file.write respace_line(line, @space, @replacement, @reduce)
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