#beastwars

class Bear
    def stats
    [@health = 100,
    @attack = 15,
    @defense = 25,
    @speed = 10]
end
end

class Moves
        def moves
    [@claw = 20,
    @bite = 30,
    @jab = 10]
end
end
    


character = Bear.new(@heatlh,@attack,@defense,@speed)
char_h = character.stats[0]
char_a = character.stats[1]
char_d = character.stats[2]
char_s = character.stats[3]
puts "Health = #{char_h}"
puts "Attack = #{char_a}"
puts "Defense = #{char_d}"
puts "Speed = #{char_s}"

opponent = Bear.new(@heatlh,@attack,@defense,@speed)
opp_h = character.stats[0]
opp_a = character.stats[1]
opp_d = character.stats[2]
opp_s = character.stats[3]

puts "Your health is #{char_h}, your opponents health is #{opp_h}"

loop do
puts "What action would you like to perform? (Claw, Bite, Jab or exit)"
action = gets.chomp.downcase
    if action == "claw"
        opp_h -= (20*char_a/opp_d)
        puts "Your opponenets health is now #{opp_h}"
        opp_d -= 2
        puts "Your opponenets defense is now #{opp_d}"
        elsif action == "bite"
            opp_h -= (30*char_a/opp_d)
            puts "Your opponenets  health is now #{opp_h}"
            elsif action == "Jab"
                opp_h -= (10*char_a/opp_d)
                puts "Your opponenets  health is now #{opp_h}" 
    else break
end
end




    
