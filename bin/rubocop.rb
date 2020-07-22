require './lib/department.rb'
require './lib/naming.rb'

def get_file(file)
  line_num = 1
  File.readlines(file).each do |line|
    name_check = Naming.new(line, file, line_num)
    line_num += 1
    name_check.var_name
    name_check.method_name
    name_check.class_name
    name_check.module_name
  end
end

def rubocop
  puts "Inspecting 1 file\n\n\nOffenses:\n\n"
  get_file('test.rb')
  puts '1 file inspected, ' + "offenses".red + ' detected'
end

rubocop
