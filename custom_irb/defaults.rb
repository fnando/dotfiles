require "irb/completion"

gems = %w[rubygems ap ruby-debug interactive_editor]
gems.each do |gem_name|
  begin
    require gem_name
  rescue LoadError
    puts "=> Unable to load #{gem_name}"
  end
end

require "active_support/all" unless defined?(ActiveSupport)

IRB::Irb.class_eval do
  def output_value
    ap @context.last_value
  end
end if defined?(AwesomePrint)
