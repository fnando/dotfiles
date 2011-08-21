ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.instance_eval { alias :[] :find }
end

ActiveSupport.on_load(:after_initialize) do
  env = {"development" => :dev, "production" => :prod}.fetch(Rails.env, Rails.env)
  prompt = "#{env}##{RUBY_VERSION}"

  IRB.conf[:PROMPT][:RAILS] = {
    :PROMPT_I =>"#{prompt} >> ",
    :PROMPT_N =>"#{prompt} >> ",
    :PROMPT_S =>"#{prompt} >> ",
    :PROMPT_C =>"#{prompt} ?> ",
    :RETURN   =>"=> %s\n"
  }

  IRB.conf[:PROMPT_MODE] = :RAILS

  at_exit do
    Dir["log/**/*.log"].each do |file|
      system "> #{file}"
    end
  end
end
