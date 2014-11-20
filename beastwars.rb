class Bear
  def initialize(name)
    @name = name
  end
  def to_s
    @name
  end
  def title
    "bear"
  end
  def stats
    [@health = 100.0,
    @attack = 20.0,
    @defense = 25.0,
    @speed = 15.0]
end
end

class Tiger
  def initialize(name)
    @name = name
  end
  def to_s
    @name
  end
  def title
    "tiger"
  end
  def stats
    [@health = 90.0,
    @attack = 30.0,
    @defense = 20.0,
    @speed = 20.0]
  end
end

class Turtle
  def initialize(name)
    @name = name
  end
  def to_s
    @name
  end
  def title
    "turtle"
  end
  def stats
    [@health = 110.0,
    @attack = 10.0,
    @defense = 35.0,
    @speed = 5.0]
  end
end

class Eagle
  def initialize(name)
    @name = name
  end
  def to_s
    @name
  end
  def title
    "eagle"
  end
  def stats
    [@health = 85.0,
    @attack = 35.0,
    @defense = 15.0,
    @speed = 25.0]
  end
end

#variables setup
char_combo = -1
opp_combo = -1
character = nil
char_select = nil
char_type = ""
turns = 0
a = 1.0
b = 1.0
c = 0.5
x = 1.0
y = 1.0
z = 0.0
char_array = [Bear, Tiger, Turtle, Eagle]
char_select_array = ["bear", "tiger", "turtle", "eagle"]
type_array = ["earth", "water", "air", "fire"]
opp_char = char_array.sample
opp_type = type_array.sample

loop do if char_select_array.include? char_select
break
else
puts "Would you like to be a Bear a Tiger a Turtle or an Eagle?"
char_select = gets.chomp.downcase
end
end

loop do if type_array.include? char_type
break
else
puts "What element would you like your beast to be (earth, fire, water or air)."
char_type = gets.chomp.downcase
end
end

puts "Enter in a name for your character"
name = gets.chomp

if char_select == "bear"
character = Bear.new("#{name}")
elsif char_select == "tiger"
character = Tiger.new("#{name}")
elsif char_select == "turtle"
character = Turtle.new("#{name}")
elsif char_select == "eagle"
character = Eagle.new("#{name}")
else puts "Please enter the correct details"
end


char_h = character.stats[0]
char_a = character.stats[1]
char_d = character.stats[2]
char_s = character.stats[3]
puts "Your characters name is #{character.to_s.capitalize}, type is #{char_type.upcase} and your stats are"
puts "Health = #{char_h.to_i}"
puts "Attack = #{char_a.to_i}"
puts "Defense = #{char_d.to_i}"
puts "Speed = #{char_s.to_i}"

opponent = opp_char.new("Opponent")
opp_h = opponent.stats[0]
opp_a = opponent.stats[1]
opp_d = opponent.stats[2]
opp_s = opponent.stats[3]
puts "The mighty #{opponent.title.capitalize} is your opponent, it is #{opp_type.upcase} type and it's stats are"
puts "Opponents Health = #{opp_h.to_i}"
puts "Opponents Attack = #{opp_a.to_i}"
puts "Opponents Defense = #{opp_d.to_i}"
puts "Opponents Speed = #{opp_s.to_i}"

=begin 
Damage calculation = Attack/Defense
x = action damage multiplier
y = action secondary multiplier
z = action secondary addition
a = player element
b = opponent element
c = constant (0.5 by default to lengthen game)
=end
char_dmg = Proc.new{(((((char_a/opp_d)*x)*y)*b)+z)*c}
  
opp_dmg = Proc.new{(((((opp_a/char_d)*x)*y)*a)+z)*c}

# elements
fire_element = Proc.new {    
  if opp_type == "water"
    b = 0.8
  elsif opp_type == "earth"
    b = 1.2
  else b = 1.0
end
  if char_type == "water"
    a = 0.8
  elsif char_type == "earth"
    a = 1.2
  else a = 1.0
end
}

water_element = Proc.new {
  if opp_type == "fire"
    b = 1.2
  elsif opp_type == "air"
    b = 0.8
  else b = 1.0
end
  if char_type == "fire"
    a = 1.2
  elsif char_type == "air"
    a = 0.8
  else a = 1.0
end
}

earth_element = Proc.new {
  if opp_type == "fire"
    b = 0.8
  elsif opp_type == "air"
    b = 1.2
  else b = 1.0
end
if char_type == "fire"
    a = 0.8
  elsif char_type == "air"
    a = 1.2
  else a = 1.0
end
}
 
air_element = Proc.new {
  if opp_type == "water"
    b = 1.2
  elsif opp_type == "earth"
    b = 0.8
  else b = 1.0
end
  if char_type == "water"
    a = 1.2
  elsif char_type == "earth"
    a = 0.8
  else a = 1.0
end
}

#player attacks
claw = Proc.new {
  fire_element.call
   if char_combo == 3
    x = 50
    char_s += 5
    char_combo = -1
  else
  x = 25
  char_s += (char_s*0.1)
  end
  opp_h -= char_dmg.call
    puts "You attack with an elemental multiplier of #{b}."
    puts "Your opponenets health now = #{opp_h.to_i}"
    puts "Your speed now = #{char_s.to_i}"}
        
bite = Proc.new {
  earth_element.call
  x = 20
  opp_h -= char_dmg.call
  puts "You attack with an elemental multiplier of #{b}."
    puts "Your opponenets health now = #{opp_h.to_i}"
  opp_d -= (opp_d*0.2)
    puts "Your opponenets defense now = #{opp_d.to_i}"}
            
jab = Proc.new {
  air_element.call
  x = 10
  z = ((char_s/opp_s)*10)
  opp_h -= char_dmg.call
    puts "You attack with an elemental multiplier of #{b}."
    puts "Your opponenets health now = #{opp_h.to_i}"
  z = 0.0
  unless char_combo == 3
        char_combo += 1
    end}
        
#opponent attacks
claw1 = Proc.new {
  fire_element.call
  if opp_combo == 3
    x = 50
    opp_s += 5
    opp_combo = -1
  else
  x = 25
  opp_s += (opp_s*0.1)
  end
  char_h -= opp_dmg.call
    puts "Your opponent attacks with an elemental multiplier of #{a}."
    puts "Your health now = #{char_h.to_i}"
  
    puts "Your opponents speed now = #{opp_s.to_i}"
    }
        
bite1 = Proc.new {
  earth_element.call
  x = 20
  char_h -= opp_dmg.call
    puts "Your opponent attacks with an elemental multiplier of #{a}."
    puts "Your health now = #{char_h.to_i}"
  char_d -= (char_d*0.2)
    puts "Your defense now = #{char_d.to_i}"}
  
jab1 = Proc.new {
  air_element.call
  x = 10
  z = ((opp_s/char_s)*10)
  char_h -= opp_dmg.call
    puts "Your opponent attacks with an elemental multiplier of #{a}."
    puts "Your health now = #{char_h.to_i}"
  z = 0.0
    unless opp_combo == 3
        opp_combo += 1
    end}
    
#player test attack
slap = Proc.new {
  water_element.call
  x = 50
  char_dmg.call
    puts "Your opponenets health now = #{opp_h.to_i}"}

opp_atk = [claw1,bite1,jab1]       
        
loop do
    turns += 1
    unless char_combo == 3
        char_combo += 1
    end
    unless opp_combo == 3
        opp_combo += 1
    end
    puts "Turn #{turns}"
    puts "You have #{char_combo} combo points and your opponent has #{opp_combo} combo points"
    if char_s >= opp_s
if opp_h <= 0
  puts "Congradulations you have defeated your opponent."
  break
elsif char_h <= 0
  puts "You have been defeated, better luck next time"
  break
end
else 
    if char_h <= 0
  puts "You have been defeated, better luck next time"
    break
elsif  opp_h <= 0
  puts "Congradulations you have defeated your opponent."
  break
end
end
puts "What action would you like to perform? (Claw, Bite, Jab or exit)"
action = gets.chomp.downcase
  if action == "claw"
    if char_s >= opp_s
      claw.call
      puts "You strike first"
      (opp_atk.sample).call
    else char_s < opp_s
      (opp_atk.sample).call
      puts "Your opponent strikes first"
      claw.call  
    end
  elsif action == "bite"
    if char_s >= opp_s
      bite.call
      puts "You strike first"
      (opp_atk.sample).call
    else char_s < opp_s
      (opp_atk.sample).call
      puts "Your opponent strikes first"
      bite.call  
    end
  elsif action == "jab"
    if char_s >= opp_s
      jab.call
      puts "You strike first"
      (opp_atk.sample).call
    else char_s < opp_s
      (opp_atk.sample).call
      puts "Your opponent strikes first"
      jab.call  
    end
    elsif action == "slap"
    slap.call
  elsif action =="exit"
  break
  else 
    puts "Please enter a correct action"
end
end
