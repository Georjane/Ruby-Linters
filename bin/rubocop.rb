require './lib/department.rb'
require './lib/naming.rb'
require './lib/metrics.rb'
require './lib/layout.rb'

def get_file(file)
  line_num = 1
  arr = []
  File.readlines(file).each do |line|
    name_check = Naming.new(line, file, line_num)
    line_num += 1
    if line.split.empty?
      arr << line_num
    end
    name_check.var_name
    name_check.method_name
    name_check.class_name
    name_check.module_name
    # metrics_check = Metrics.new(line, file, line_num)
    # metrics_check.block_length
  end
  layout_check = Layout.new(nil, file, line_num)
  layout_check.empty_lines(arr)
end

# def get_file(file)
#   line_num = 0
#   f = File.open(file, "r")
#   arr = []
#   f.each_line { |line|
#     line_num += 1    
#     if line.split.empty?
#       arr << line_num
#     end    
#   }
#   layout_check = Layout.new(nil, file, line_num)
    
#   layout_check.empty_lines(arr)
#   f.close
# end

def rubocop
  puts "Inspecting 1 file\n\n\nOffenses:\n\n"
  get_file('test.rb')
  puts '1 file inspected, ' + "offenses".red + ' detected'
end

rubocop
