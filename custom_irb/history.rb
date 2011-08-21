IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = File.expand_path("~/.irb_history")
IRB.conf[:EVAL_HISTORY] = 100

if File.file?(IRB.conf[:HISTORY_FILE])
  lines = File.readlines(IRB.conf[:HISTORY_FILE]).collect do |line|
    line.gsub(/^p */, "").chomp
  end

  Readline::HISTORY.push(*lines)
end

at_exit do
  lines = Readline::HISTORY.to_a.uniq
  lines = lines.reject {|l| %w[c exit l nil irb].include?(l) }

  count = lines.count
  start = [count - IRB.conf[:SAVE_HISTORY], 0].max
  lines = lines[start, IRB.conf[:SAVE_HISTORY]]

  File.open(IRB.conf[:HISTORY_FILE], "w+") do |file|
    file.flock(File::LOCK_EX)
    file.puts(lines)
    file.flock(File::LOCK_UN)
  end
end
