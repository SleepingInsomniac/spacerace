require_relative "../lib/spacerace.rb"
require 'fileutils'

describe "SpaceRace" do
  
  describe "replace_line" do
    
    it "replaces 1 tab with 2 spaces" do
      r = SpaceRace.new(space: "\t", replacement: "  ")
      line = r.respace_line("\tcode")
      expect(line).to eq("  code")
    end
    
    it "replaces 1 tabs with 4 spaces" do
      r = SpaceRace.new(space: "\t", replacement: "    ")
      line = r.respace_line("\tcode")
      expect(line).to eq("    code")
    end
    
    it "replaces 2 tabs with 4 spaces" do
      r = SpaceRace.new(space: "\t", replacement: "  ")
      line = r.respace_line("\t\tcode")
      expect(line).to eq("    code")
    end
    
    it "replaces 2 tabs with 8 spaces" do
      r = SpaceRace.new(space: "\t", replacement: "    ")
      line = r.respace_line("\t\tcode")
      expect(line).to eq("        code")
    end
    
    ###
    
    it "replaces 2 spaces with 1 tab" do
      r = SpaceRace.new(space: "  ", replacement: "\t", reduce: 2)
      line = r.respace_line("  code")
      expect(line).to eq("\tcode")
    end
    
    it "replaces 4 spaces with 2 tabs" do
      r = SpaceRace.new(space: "  ", replacement: "\t", reduce: 2)
      line = r.respace_line("    code")
      expect(line).to eq("\t\tcode")
    end
    
    it "replaces 4 spaces with 1 tab" do
      r = SpaceRace.new(space: "    ", replacement: "\t", reduce: 4)
      line = r.respace_line("    code")
      expect(line).to eq("\tcode")
    end
    
    it "replaces 8 spaces with 2 tabs" do
      r = SpaceRace.new(space: "    ", replacement: "\t", reduce: 4)
      line = r.respace_line("        code")
      expect(line).to eq("\t\tcode")
    end
    
  end
  
  describe "respace_file" do
    
    it "replaces 4 spaces with 1 tab in file" do
      file = File.join(File.dirname(__FILE__), 'test')
      r = SpaceRace.new(space: "    ", replacement: "\t", reduce: 4)
      r.respace_file("#{file}.4spaces")
      expect(File.exists? "#{file}.4spaces.original").to be true
      expect(File.read("#{file}.4spaces")).to eq File.read("#{file}.1tabs")
      FileUtils.rm "#{file}.4spaces"
      FileUtils.mv "#{file}.4spaces.original", "#{file}.4spaces"
    end
    
  end
  
end