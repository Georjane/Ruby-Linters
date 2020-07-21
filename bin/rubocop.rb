require './lib/department.rb'
require './lib/naming.rb'

def get_file(filename)
  file = filename
  line_num = 0
  File.readlines(file).each do |line|
    name_var = Naming.new(line, file, line_num)
    line_num += 1
    name_var.var_name
    name_var.method_name
  end
end

def output
  puts "Inspecting 1 file\n\n\nOffenses:\n\n"
  get_file('test.rb')
  puts '1 file inspected, ' + "offenses".red + ' detected'
end

output

