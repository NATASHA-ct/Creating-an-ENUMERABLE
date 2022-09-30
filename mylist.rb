require_relative 'myenumerable'

class MyList
  include MyEnumerable
  @list = []

  def initialize(*elements)
    @list = elements
  end

  def each
    return to_enum(:each) unless block_given?

    counter = 0
    while counter < @list.length
      yield(@list[counter])
      counter += 1
    end
    @list
  end
end

list = MyList.new(1, 2, 3, 4) # <MyList: @list=[1, 2, 3, 4]>

puts(list.all? { |e| e < 5 }) # true
puts(list.all? { |e| e > 5 }) # false

puts(list.any? { |e| e == 2 }) # true
puts(list.any? { |e| e == 5 }) # false

puts print list.filter(&:even?) # [2, 4]
print list.filter(&:odd?) # [1, 3]
