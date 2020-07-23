class Metrics < Department
  private
  def block_length(def_hash, end_hash)
    @max = 10
    length, final, y = Array.new(3) { [] }
    i = 0
    g = 0
    r = 0
    end_hash.each do |_x, v|
      end_hash.delete(end_hash.key(v)) unless def_hash.value?(v)
    end
    while i < def_hash.length
      length << end_hash.keys[i] - def_hash.keys[i]
      i += 1
    end
    length.each do |a|
      final << def_hash.keys[g] if a > @max
      g += 1
    end
    length.each { |q| y << q if q > @max }
    while r < final.length
      print file.blue + ':' + final[r].to_s + ':' + 1.to_s + ':' + ' C'.colorize(:yellow) + ': Metrics/MethodLength: Method has too many lines. [' + y[r].to_s + '/' + @max.to_s + "]\n\n"
      r += 1
    end
  end
end
