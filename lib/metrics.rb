class Metrics < Department
  def block_length(def_hash, end_hash)
    @max = 10
    length, final, many_lines = Array.new(3) { [] }
    counter = 0
    r = 0
    end_hash.each do |_x, v|
      end_hash.delete(end_hash.key(v)) unless def_hash.value?(v)
    end
    while counter < def_hash.length
      length << end_hash.keys[counter] - def_hash.keys[counter]
      counter += 1
    end
    length.each do |a|
      final << def_hash.keys[counter] if a > @max
      counter += 1
    end
    length.each { |q| many_lines << q if q > @max }
    while r < final.length
      print file.blue + ':' + final[r].to_s + ':' + 1.to_s + ':' + ' C'.yellow + ': Metrics/MethodLength: Method has too many lines. [' + many_lines[r].to_s + '/' + @max.to_s + "]\n\n"
      r += 1
    end
  end

  def check_length(def_hash, end_hash)
    @max = 10
    length, final, many_lines = Array.new(3) { [] }
    counter = 0
    end_hash.each do |_x, v|
      end_hash.delete(end_hash.key(v)) unless def_hash.value?(v)
    end
    while counter < def_hash.length
      length << end_hash.keys[counter] - def_hash.keys[counter]
      counter += 1
    end
    length.each do |a|
      final << def_hash.keys[counter] if a > @max
      counter += 1
    end
    length.each { |q| many_lines << q if q > @max }
    many_lines.length
  end
end
