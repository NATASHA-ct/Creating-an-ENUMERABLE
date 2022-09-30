module MyEnumerable
  def all?
    check = true
    @list.each do |element|
      if (yield element) == false
        check = false
        break
      end
    end
    check
  end

  def any?
    @list.each do |element|
      return true if yield element
    end
    false
  end

  def filter
    new_array = []
    @list.each do |element|
      new_array.push(element) if yield element
    end
    new_array
  end
end
