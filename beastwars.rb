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
    [@health = 100,
    @attack = 15,
    @defense = 25,
    @speed = 10]
end
end

class Tiger
    def stats
    [@health = 90,
    @attack = 25,
    @defense = 15,
    @speed = 20]
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
puts "Health = #{char_h}"
puts "Attack = #{char_a}"
puts "Defense = #{char_d}"
puts "Speed = #{char_s}"
opponent = Tiger.new
opp_h = opponent.stats[0]
opp_a = opponent.stats[1]
opp_d = opponent.stats[2]
opp_s = opponent.stats[3]

elsif char_select == "tiger"

character = Tiger.new
char_h = character.stats[0]
char_a = character.stats[1]
char_d = character.stats[2]
char_s = character.stats[3]
puts "Health = #{char_h}"
puts "Attack = #{char_a}"
puts "Defense = #{char_d}"
puts "Speed = #{char_s}"
opponent = Bear.new
opp_h = opponent.stats[0]
opp_a = opponent.stats[1]
opp_d = opponent.stats[2]
opp_s = opponent.stats[3]
end

claw = Proc.new {
    opp_h -= (30*char_a/opp_d)
        puts "Your opponenets health is now #{opp_h}"}
    char_s += (char_s*1.1)
        
bite = Proc.new {
    opp_h -= (20*char_a/opp_d)
        puts "Your opponenets  health is now #{opp_h}"
    opp_d -= (opp_d*0.2).floor
        puts "Your opponenets defense is now #{opp_d}"}
            
jab = Proc.new {
    opp_h -= ((10*char_a/opp_d) + (10*char_s/opp_s))
        puts "Your opponenets  health is now #{opp_h}"}
        
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
        elsif action == "bite"
            bite.call
            elsif action == "jab"
                jab.call 
    else break
end
end
