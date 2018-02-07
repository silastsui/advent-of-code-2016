data = File.read('1.txt').strip().split(', ')
data = data.map{|n| [n[0], n[1..-1]]}

def get_next_dir(dir, turn)
  l_dir = {'u' => 'l', 'l' => 'd', 'd' => 'r', 'r' => 'u'}
  r_dir = {'u' => 'r', 'r' => 'd', 'd' => 'l', 'l' => 'u'}

  if turn == 'L'
    dir = l_dir[dir]
  else
    dir = r_dir[dir]
  end

  return dir
end


dir = 'u'
x, y = 0, 0

for instr in data do
  dir = get_next_dir(dir, instr[0])
  steps = instr[1].to_i

  if dir == 'u'
    y += steps
  elsif dir == 'd'
    y -= steps
  elsif dir == 'l'
    x -= steps
  else
    x += steps
  end
end

puts x.abs + y.abs
