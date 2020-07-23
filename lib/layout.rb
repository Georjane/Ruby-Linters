class Layout < Department
  def empty_lines(arr)
    i = 0
    while i < arr.length
      if arr[i + 1] == arr[i] + 1
        return file.blue + ':' + arr[i + 1].to_s + ':' + 1.to_s + ':' + ' C'.yellow + ": Layout/EmptyLines: Extra blank line detected.\n\n"
      end
      i += 1
    end
  end

  def empty_line_between_defs; end
end
