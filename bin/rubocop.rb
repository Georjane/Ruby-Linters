require './lib/department.rb'
require './lib/naming.rb'

def get_file(filename)
  file = filename
  line_num = 0
  File.readlines(file).each do |line|
    name_var = Naming.new(line, file, line_num)
    line_num += 1
    name_var.var_name
  end
end

get_file('test.rb')
