Pry.config.editor = ENV.fetch("EDITOR", "subl -w")

Pry.config.prompt = proc do |obj, level, _|
  prompt = ""
  prompt << "#{Rails.version}@" if defined?(Rails)
  prompt << "#{RUBY_VERSION}"
  "#{prompt} (#{obj})> "
end

Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "\e[31m#{exception.class}: #{exception.message}"
  output.puts "from #{exception.backtrace.first}\e[0m"
end

if defined?(Rails)
  require "rails/console/app"
  require "rails/console/helpers"
  TOPLEVEL_BINDING.eval("self").extend ::Rails::ConsoleMethods
end

begin
  require "awesome_print"

  Pry.config.print = proc do |output, value|
    Pry::Helpers::BaseHelpers
      .stagger_output("=> #{value.ai}", output)
  end
rescue LoadError => error
  warn "=> Unable to load awesome_print"
end

begin
  require "pry-nav"

  Pry.commands.alias_command "c", "continue"
  Pry.commands.alias_command "s", "step"
  Pry.commands.alias_command "n", "next"
rescue LoadError => error
  warn "=> Unable to load pry-nav"
end

begin
  require "pry-stack_explorer"

  Pry.commands.alias_command "u", "up"
  Pry.commands.alias_command "d", "down"
rescue LoadError => error
  warn "=> Unable to load pry-stack_explorer"
end
