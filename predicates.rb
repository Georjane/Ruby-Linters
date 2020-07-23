file1 = 'example.rb'
        arr = []
        File.readlines(file1).each do |line|
          arr << line.chomp!
        end
        array = []
        arr.each_with_index { |x, index| array << index if x }
        puts arr