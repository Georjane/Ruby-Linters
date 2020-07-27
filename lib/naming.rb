class Naming < Department
  @error_index = 0

  def var_name
    return unless !keywords.include?(line.split.first) && line =~ / = /

    var_line = line[(0..(line =~ / = /) - 1)]
    return if var_line.split.last.match?(good_snake_case)

    error_index_snake_case
    error_message + ": Naming/VariableName: Use snake_case for variable names.\n  " + var_line.split.last + "\n\n"
  end

  def method_name
    return unless line.split.first == keywords.first
    return if line.split.last.match?(good_snake_case)

    error_index_snake_case
    error_message + ": Naming/MethodName: Use snake_case for method names.\n  " + line.split.last + "\n\n"
  end

  def class_name
    return unless line.split.first == keywords[3]

    class_na = line[((line =~ /class/) + 6)..-1]
    return if class_na.match?(good_camel_case)

    @error_index = ((line =~ /class/) + 7)
    error_message + ": Naming/ClassAndModuleCamelCase: Use CamelCase for classes and modules.\n" + line + "\n"
  end

  def module_name
    return unless line.split.first == keywords[4]

    class_na = line[((line =~ /module/) + 7)..-1]
    return if class_na.match?(good_camel_case)

    @error_index = ((line =~ /module/) + 8)
    error_message + ": Naming/ClassAndModuleCamelCase: Use CamelCase for classes and modules.\n" + line + "\n"
  end

  private  

  def error_index_snake_case
    @error_index = ((line =~ bad_snake_case) + 1)
  end

  def error_message
    file.blue + ':' + line_num.to_s + ':' + @error_index.to_s + ':' + ' C'.yellow
  end
end
