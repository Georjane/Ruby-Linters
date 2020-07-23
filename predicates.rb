require './files.rb'

def get_file(file)
  line_num = 1
  File.readlines(file).each do |line|
    name_check = Naming.new(line, file, line_num)
    line_num += 1
    print name_check.var_name
  end
end

class Naming < Department
  @error_index = 0

  def var_name
    return unless !keywords.include?(line.split.first) && line =~ / = /

    var_line = line[(0..(line =~ / = /) - 1)]
    return if var_line.split.last.match?(good_snake_case)

    error_index_snake_case
    error_message + ": Naming/VariableName: Use snake_case for variable names.\n  " + var_line.split.last + "\n\n"
  end
end

get_file('test.rb')