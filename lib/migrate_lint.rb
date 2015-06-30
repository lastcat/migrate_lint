require "migrate_lint/version"
require "migrate_lint/lemmatizer_patch"

module MigrateLint
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load "tasks/migrate_lint.rake"
    end
  end
end
