require 'colorize'

class Department
  attr_reader :file, :line, :line_num, :keywords, :good_snake_case, :bad_snake_case, :good_camel_case
  def initialize(line, file, line_num)
    @line = line
    @file = file
    @line_num = line_num
    @keywords = %w[def end puts class module]
    @good_snake_case = /^[a-z]+_[a-z]+(_[a-z]+)?$/
    @bad_snake_case = /[a-zA-Z\d]+_[a-zA-Z\d]+(_[a-zA-Z]+)?/
    @good_camel_case = /^[A-Z][A-Za-z\d]+$/
  end
end
