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
    arr << line_num if line.split.empty?
    name_check.var_name
    name_check.method_name
    name_check.class_name
    name_check.module_name
  end
  layout_check = Layout.new(nil, file, line_num)
  layout_check.empty_lines(arr)
  metrics_length(file)
end

def metrics_length(file)
  line_num = 0
  f = File.open(file, 'r')
  def_hash = {}
  end_hash = {}
  metrics_check = Metrics.new(nil, file, line_num)
  f.each_line do |line|
    line_num += 1
    def_hash[line_num] = line =~ /def/ if %w[def].include?(line.split.first)
    end_hash[line_num] = line =~ /end/ if %w[end].include?(line.split.first)
  end
  metrics_check.block_length(def_hash, end_hash)
  f.close
end

def rubocop
  puts "Inspecting 1 file\n\n\nOffenses:\n\n"
  get_file('test.rb')
  puts '1 file inspected, ' + 'offenses'.red + ' detected'
end

rubocop
