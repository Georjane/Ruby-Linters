require './lib/naming.rb'

def get_file(filename)
  file = filename
  name_inst = Naming.new
  line_num = 0
  File.readlines(file).each do |line|
    line_num += 1
    name_inst.var_name(line, file, line_num)
  end
end

get_file('test.rb')
