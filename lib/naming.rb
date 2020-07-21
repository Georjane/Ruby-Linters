class Naming < Department
  def var_name
    return unless !keywords.include?(line.split.first) && line =~ / = /

    var_line = line[(0..(line =~ / = /) - 1)]    
    return if var_line.split.last.match?(good_var_name)

    error_message
    print ": Naming/VariableName: Use snake_case for variable names.\n  " + var_line.split.last + "\n\n"
  end

  def method_name
    return unless line.split.first == keywords.first
      return if line.split.last.match?(good_var_name)

      error_message
      print ": Naming/MethodName: Use snake_case for method names.\n  " + line.split.last + "\n\n"     
  end

  def error_message
    bad_var_index = ((line =~ bad_var_name) + 1)
    print file.blue + ':' + line_num.to_s + ':' + bad_var_index.to_s
    print ':' + ' C'.colorize(:yellow)
  end
end
