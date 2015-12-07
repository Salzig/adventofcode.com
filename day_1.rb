input = File.read('day_1.input').strip

normalized_input = input.split('').map do |c|
  case c
  when '('
    +1
  when ')'
    -1
  end
end

puts "Last Floor: ", normalized_input.inject(0, &:+)

floor = 0 # 1783
# count from char one
first_time_in_basement = 1 + normalized_input.each_with_index do |move, index|
  floor += move
  if floor < 0
    break index
  end
end
puts "first time in basement: "
puts first_time_in_basement
