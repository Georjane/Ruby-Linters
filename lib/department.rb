require 'colorize'

class Department
  attr_accessor :file, :line, :line_num, :keywords
  def initialize(line, file, line_num)
    @line = line
    @file = file
    @line_num = line_num
    @keywords = %w[def end puts]
  end  
end