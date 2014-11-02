#beastwars

#currently not working
class Moves
        def moves
    [@claw = 20,
    @bite = 30,
    @jab = 10]
end
end

#working

class Bear
    def stats
    [@health = 100.0,
    @attack = 15.0,
    @defense = 25.0,
    @speed = 10.0]
end
end

class Tiger
    def stats
    [@health = 90.0,
    @attack = 25.0,
    @defense = 15.0,
    @speed = 20.0]
end
end

puts "Would you like to be a Bear or a Tiger?"
char_select = gets.chomp.downcase

if char_select == "bear"
    
character = Bear.new
char_h = character.stats[0]
char_a = character.stats[1]
char_d = character.stats[2]
char_s = character.stats[3]
puts "Health = #{char_h.to_i}"
puts "Attack = #{char_a.to_i}"
puts "Defense = #{char_d.to_i}"
puts "Speed = #{char_s.to_i}"
opponent = Tiger.new
opp_h = opponent.stats[0]
opp_a = opponent.stats[1]
opp_d = opponent.stats[2]
opp_s = opponent.stats[3]
puts "Opponents Health = #{opp_h.to_i}"
puts "Opponents Attack = #{opp_a.to_i}"
puts "Opponents Defense = #{opp_d.to_i}"
puts "Opponents Speed = #{opp_s.to_i}"

elsif char_select == "tiger"

character = Tiger.new
char_h = character.stats[0]
char_a = character.stats[1]
char_d = character.stats[2]
char_s = character.stats[3]
puts "Health = #{char_h.to_i}"
puts "Attack = #{char_a.to_i}"
puts "Defense = #{char_d.to_i}"
puts "Speed = #{char_s.to_i}"
opponent = Bear.new
opp_h = opponent.stats[0]
opp_a = opponent.stats[1]
opp_d = opponent.stats[2]
opp_s = opponent.stats[3]
puts "Opponents Health = #{opp_h.to_i}"
puts "Opponents Attack = #{opp_a.to_i}"
puts "Opponents Defense = #{opp_d.to_i}"
puts "Opponents Speed = #{opp_s.to_i}"
end

#player attacks
claw = Proc.new {
    opp_h -= (30*char_a/opp_d)
        puts "Your opponenets health is now #{opp_h.to_i}"
    char_s += (char_s*0.1)
        puts "Your speed is now #{char_s.to_i}"}
        
bite = Proc.new {
    opp_h -= (20*char_a/opp_d)
        puts "Your opponenets  health is now #{opp_h.to_i}"
    opp_d -= (opp_d*0.2)
        puts "Your opponenets defense is now #{opp_d.to_i}"}
            
jab = Proc.new {
    opp_h -= ((10*(char_a/opp_d)) + (10*(char_s/opp_s)))
        puts "Your opponenets  health is now #{opp_h.to_i}"}
        
#opponent attacks
claw1 = Proc.new {
    char_h -= (30*opp_a/char_d)
        puts "Your health is now #{char_h.to_i}"
    opp_s += (opp_s*0.1)
        puts "Your opponents speed is now #{opp_s.to_i}"}
        
bite1 = Proc.new {
    opp_h -= (20*char_a/opp_d)
        puts "Your opponenets  health is now #{opp_h.to_i}"
    opp_d -= (opp_d*0.2)
        puts "Your opponenets defense is now #{opp_d.to_i}"}
            
jab1 = Proc.new {
    opp_h -= ((10*(char_a/opp_d)) + (10*(char_s/opp_s)))
        puts "Your opponenets  health is now #{opp_h.to_i}"}
        
loop do

if opp_h <= 0
    puts "Congradulations you have defeated your opponent."
    break
        elsif char_h <= 0
        puts "You have been defeated, better luck next time"
        break
    end
    
    puts "What action would you like to perform? (Claw, Bite, Jab or exit)"
action = gets.chomp.downcase
    if action == "claw"
        claw.call
        claw1.call
        elsif action == "bite"
            bite.call
            claw1.call
            elsif action == "jab"
                jab.call
                claw1.call
    else break
end
end
