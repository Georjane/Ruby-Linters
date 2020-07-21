require 'colorize'

class Naming
  def var_name(line, file, line_num)
    keywords = ["def", 'end', 'puts']
    if !(keywords.include?(line.split.first)) && line =~ (/ = /)
      regex_var = /^[a-z]+_[a-z]+(_[a-z]+)?$/
      if !(line[(0..(line =~ (/ = /)) - 1)].split.last.match?(regex_var))
        puts file.blue + ":" + line_num.to_s + ":" + ((line =~ (/[a-zA-Z0-9]+_[a-zA-Z0-9]+(_[a-zA-Z]+)?/)) + 1).to_s + ":" +  " C".colorize(:yellow) + ": Naming/VariableName: Use snake_case for variable names.\n  " + line[(0..(line =~ (/ = /)) - 1)].split.last
        
      end
    end
  end
end