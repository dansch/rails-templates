# file modification
run "rm public/index.html"
run "rm public/images/rails.png"
run "cp config/database.yml config/database.yml.example"
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"

# Ignore auto-generated files
file ".gitignore", <<-END
.DS_Store
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END


# gems
gem 'authlogic'
gem 'compass-960-plugin', :lib => 'ninesixty'
gem 'compass', :lib => 'compass'
gem 'formtastic'
gem 'haml', :lib => 'haml', :version => '>=2.2.0'
gem 'will_paginate'
gem 'inherited_resources'

# gems for testing
gem "rspec", :lib => false, :version => ">=1.2.9"
gem "rspec-rails", :lib => false, :version => ">=1.2.9"
gem "webrat", :lib => false, :version => ">=0.5.3"
gem "cucumber", :lib => false, :version => ">=0.4.4"
gem "machinist", :lib => false, :version => ">=1.0.5"
gem "remarkable_rails", :lib => false
gem "faker", :lib => false

# scripts
generate "rspec"
generate "cucumber"

# authlogic authentication
if yes?("Do you want to use authlogic?")
  authlogic_model = ask("What do you want the authlogic_model to be called?")
  generate "session", "#{authlogic_model}_session"
  generate "rspec_scaffold", "#{authlogic_model}"
end

# Finally, git it!
git :init
git :add => "."
git :commit => "-a -m 'Initial commit'"