require_relative "../model/trains"
require_relative "../model/module/graph/helper.rb"
require_relative "../model/module/graph/edges.rb"
require_relative "../model/module/graph/routes.rb"
require_relative "../model/module/graph/paths.rb"
require_relative "../model/module/graph/distances.rb"

RSpec.configure do |config|
  config.color     = true
  config.tty       = true
  config.formatter = :documentation
end
