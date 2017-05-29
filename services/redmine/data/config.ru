# to make redmine run under sub url
require ::File.expand_path('../config/environment', __FILE__)
map "/redmine" do
  run RedmineApp::Application
end