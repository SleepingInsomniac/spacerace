require_relative "../lib/spacerace.rb"

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
  
end