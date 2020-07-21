class Naming
  def var_name(line, file, line_num)
    keywords = ["def", 'end', 'puts']
    if !(keywords.include?(line.split.first)) && line =~ (/ = /)
      if !(line[(0..(line =~ (/ = /)) - 1)].split.last.match?(/^[a-z]+_[a-z]+(_[a-z]+)?$/))   
        puts file + ":" + line_num.to_s + " use snake case to name variables"
      end
    end
  end
end