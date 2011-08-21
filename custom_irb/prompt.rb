prompt = "#{RUBY_VERSION}"

IRB.conf[:PROMPT][:CUSTOM] = {
  :PROMPT_I =>"#{prompt} >> ",
  :PROMPT_N =>"#{prompt} >> ",
  :PROMPT_S =>"#{prompt} >> ",
  :PROMPT_C =>"#{prompt} ?> ",
  :RETURN   =>"=> %s\n"
}

IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT_MODE] = :CUSTOM
