begin
  require "custom_irb/defaults"
  require "custom_irb/history"
  require "custom_irb/prompt"
  require "custom_irb/rails"
  require "custom_irb/utils"
rescue Exception => e
  puts e.inspect
  puts e.backtrace
end
