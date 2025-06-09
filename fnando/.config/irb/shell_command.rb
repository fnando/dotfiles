require "irb"

class ShellCommand < IRB::Command::Base
  category "Terminal"
  description "Run shell command"
  help_message <<~HELP
    Usage: . <shell> <args>

    Examples:
      . ls
      . open .
  HELP

  def execute(*)
    system(*)
  end
end

IRB::Command.register("shell", ShellCommand)
IRB.conf[:COMMAND_ALIASES][:"."] = :shell
