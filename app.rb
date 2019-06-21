require_relative 'app/file_command_executor'

#  Now application used hardcoded input and output files path,
#  but in future can add reading path from command line with ARGV

FileCommandExecutor.new('input.txt', 'output.txt').perform
