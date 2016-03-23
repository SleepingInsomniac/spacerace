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
    
  end
  
end