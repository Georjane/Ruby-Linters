class Metrics < Department
  def block_length
    x = nil
    y = nil
    if line.split.first == keywords.first
      x = line_num       
    end
    if line.split.first == keywords[1] && @index = line =~ /end/
      y = line_num
    end
    while x.nil? == false do
        while y.nil? == false do 
          puts x + y
      
    end
    end
  end
end