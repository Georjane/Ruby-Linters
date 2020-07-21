require 'colorize'

class Department
  attr_reader :file, :line, :line_num, :keywords, :good_var_name, :bad_var_name
  def initialize(line, file, line_num)
    @line = line
    @file = file
    @line_num = line_num
    @keywords = %w[def end puts]
    @good_var_name = /^[a-z]+_[a-z]+(_[a-z]+)?$/
    @bad_var_name = /[a-zA-Z0-9]+_[a-zA-Z0-9]+(_[a-zA-Z]+)?/
  end  
end