input = File.read('day_3.input').strip

RIGHT = '>'
DOWN = 'v'
LEFT = '<'
UP = '^'

def move_santa(input)
  x,y = 0,0
  input.inject({}) do |houses, char|
    case char
    when RIGHT
      x += 1
    when LEFT
      x -= 1
    when UP
      y += 1
    when DOWN
      y -= 1
    end
    houses["#{x}_#{y}"] = houses.fetch("#{x}_#{y}", 0) + 1

    houses
  end
end

houses_visited = move_santa(input.chars)

puts houses_visited.keys.length

santas = input.chars.partition.with_index{ |_, i| i.even? }
houses_visited_by_santa = santas.map { |santa| move_santa(santa) }

puts houses_visited_by_santa.first.merge(houses_visited_by_santa.last).keys.length

