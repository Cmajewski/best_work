
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "best_work/version"

Gem::Specification.new do |spec|
  spec.name          = "best_work"
  spec.version       = BestWork::VERSION
  spec.authors       = ["'Caitlin Majewski'"]
  spec.email         = ["'cmajewski@wesleyan.edu'"]

  spec.summary       = %q{100 Best startups to work at in NYC}
  spec.description   = %q{Learn more about the 100 best startups to work at in NYC in 2019.}
  spec.homepage      = "https://github.com/Cmajewski/best_work.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/Cmajewski/best_work.git"
    spec.metadata["changelog_uri"] = "https://github.com/Cmajewski/best_work.git"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  #spec.bindir        = "exe"
  spec.executables   = ["best_work"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
