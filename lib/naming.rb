class Naming < Department
  def var_name
    return unless !keywords.include?(line.split.first) && line =~ / = /

    var_line = line[(0..(line =~ / = /) - 1)]
    good_var_name = /^[a-z]+_[a-z]+(_[a-z]+)?$/
    return if var_line.split.last.match?(good_var_name)

    bad_var_index = ((line =~ /[a-zA-Z0-9]+_[a-zA-Z0-9]+(_[a-zA-Z]+)?/) + 1)
    print file.blue + ':' + line_num.to_s + ':' + bad_var_index.to_s
    print ':' + ' C'.colorize(:yellow)
    print ": Naming/VariableName: Use snake_case for variable names.\n  " + var_line.split.last
  end
end
