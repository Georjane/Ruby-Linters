require_relative 'lib/department.rb'
require_relative 'lib/naming.rb'
require_relative 'lib/metrics.rb'
require_relative 'lib/layout.rb'
require_relative 'lib/colors.rb'

def get_file(file)
  line_num = 1
  arr = []
  File.readlines(file).each do |line|
    name_check = Naming.new(line, file, line_num)
    line_num += 1
    arr << line_num if line.split.empty?
    print name_check.var_name
    print name_check.method_name
    print name_check.class_name
    print name_check.module_name
  end
  layout_check = Layout.new(nil, file, line_num)
  print layout_check.empty_lines(arr)
  get_file_metrics(file)
end

def get_file_metrics(file)
  line_num = 0
  def_hash = {}
  end_hash = {}
  metrics_check = Metrics.new(nil, file, line_num)
  File.readlines(file).each do |line|
    line_num += 1
    def_hash[line_num] = line =~ /def/ if %w[def].include?(line.split.first)
    end_hash[line_num] = line =~ /end/ if %w[end].include?(line.split.first)
  end
  metrics_check.block_length(def_hash, end_hash)
end

def counts(file)
  line_num = 1
  arr = []
  offence_count = []
  def_hash = {}
  end_hash = {}
  File.readlines(file).each do |line|
    name_check = Naming.new(line, file, line_num)
    line_num += 1
    def_hash[line_num] = line =~ /def/ if %w[def].include?(line.split.first)
    end_hash[line_num] = line =~ /end/ if %w[end].include?(line.split.first)
    arr << line_num if line.split.empty?
    offence_count << name_check.var_name unless name_check.var_name.nil?
    offence_count << name_check.method_name unless name_check.method_name.nil?
    offence_count << name_check.class_name unless name_check.class_name.nil?
    offence_count << name_check.module_name unless name_check.module_name.nil?
  end
  metrics_check = Metrics.new(nil, file, line_num)
  layout_check = Layout.new(nil, file, line_num)
  offence_count << layout_check.empty_lines(arr) unless layout_check.empty_lines(arr).nil?
  count = offence_count.length + metrics_check.check_length(def_hash, end_hash)
  count
end
