require "./Game.rb"

john = Player.new("john")
bill = Player.new("bill")
game1 = Game.new(john, bill)

game1.start