class Layout < Department
  def empty_lines(arr)
    i = 0
    while i < arr.length
      return file.blue + ':' + arr[i + 1].to_s + ':' + 1.to_s + ':' + ' C'.yellow + ": Layout/EmptyLines: Extra blank line detected.\n\n" if arr[i + 1] == arr[i] + 1

      i += 1
    end
  end
end
