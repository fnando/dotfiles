begin
  require "pry-meta"
  Pry.start
  exit
rescue LoadError => e
  warn "=> Unable to load pry-meta"
end
