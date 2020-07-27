# A file which has a shebang line as its first line is
# granted execute permission.

# !/usr/bin/env ruby
require './lib/files.rb'

def rubocop(filename)
  num = counts(filename)
  if num.positive?
    puts "Inspecting 1 file\n\n\nOffenses:\n\n"
    get_file(filename)
    puts '1 file inspected, ' + num.to_s.red + ' offenses'.red + ' detected'
  else
    puts "Inspecting 1 file\n" + '.'.green + "\n\n1 file inspected, " + 'no offenses'.green + ' detected'
  end
end

rubocop('bin/bug_file/test.rb')
