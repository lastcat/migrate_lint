$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "migrate_lint/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "migrate_lint"
  s.version     = MigrateLint::VERSION
  s.authors     = ["yoshitake.nakaji"]
  s.email       = ["kokodoko966@gmail.com"]
  s.homepage    = "https://github.com/lastcat/migrate_lint.git"
  s.summary     = "add rake task for checking Table name and clomun name typo"
  s.description = "add rake task for checking Table name and clomun name typo"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.0"
  s.add_dependency "lemmatizer"
  s.add_development_dependency "sqlite3"
end
