input = File.read('day_2.input').strip

normalized_input = input.lines.map { |line| line.split('x').map(&:to_i).sort }

# 2x3x4 -> 2*2*3 + 2*3*4 + 2*2*4 = 2*6 + 2*12 + 2*8  +  2*6 = 52 + 6 = 58

square_feet_paper = normalized_input \
  .map { |l,w,h| 2*l*w + 2*w*h + 2*h*l + l*w } \
  .inject(&:+)

puts "Square Feet needed: ", square_feet_paper

feet_ribbon = normalized_input \
  .map { |l,w,h| 2*l + 2*w + l*w*h } \
  .inject(&:+)

puts "Feet of Ribbon: ", feet_ribbon
