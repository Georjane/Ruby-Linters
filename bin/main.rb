# A file which has a shebang line as its first line is
# granted execute permission.

# !/usr/bin/env ruby
require './lib/files.rb'

def rubocop
  num = counts('bin/bug_file/test.rb')
  if num.positive?
    puts "Inspecting 1 file\n\n\nOffenses:\n\n"
    get_file('bin/bug_file/test.rb')
    puts '1 file inspected, ' + num.to_s.red + ' offenses'.red + ' detected'
  else
    puts "Inspecting 1 file\n" + '.'.green + "\n\n1 file inspected, " + 'no offenses'.green + ' detected'
  end
end

 rubocop
