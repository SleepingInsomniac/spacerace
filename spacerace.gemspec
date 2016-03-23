require_relative 'lib/spacerace'

Gem::Specification.new do |s|
  
  s.name          = 'spacerace'
  s.version       = SpaceRace::VERSION
  s.licenses      = ['MIT']
  s.summary       = "Replace indentation in your source code"
  s.description   = "Replace indentation in your source code. Meant to help deal with differences in coding styles and getting back to consistent use of indentation."
  s.authors       = ["Alex Clink"]
  s.email         = 'code@alexclink.com'
  s.homepage      = 'https://github.com/sleepinginsomniac/spacerace'
  s.files         = [
    "lib/spacerace.rb",
    "bin/spacerace"
  ]
  s.executables   = ["spacerace"]
  s.require_paths = ["lib"]
  # s.add_dependency 'colorize', '~> 0.7'
  
end
