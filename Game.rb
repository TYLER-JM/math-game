require "./Player.rb"

class Game

  # SYMBOLS = ["times", "plus", "minus"]
  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @turn = 0
  end

  def generate_nums
    opperands = [rand(1..20), rand(1..20)]
    opperands
  end

  def whos_turn
    if @turn.even?
      @player1
    else
      @player2
    end
  end

  def start
    puts "====WELCOME TO THE GAME====" 
    puts "#{@player1.name} =======VS======= #{@player2.name}"
    puts "==========================="
    self.new_turn(self.generate_nums, whos_turn)
  end


  def new_turn(nums, player)
    puts "|=====LIVES LEFT=====|"
    puts "   #{@player1.name} : #{@player1.lives}"
    puts "   #{@player2.name} : #{@player2.lives}"
    puts "|====================|"
    puts "#{player.name}'s turn: what is #{nums[0]} plus #{nums[1]}?"
    print "> "

    answer = gets.chomp.to_i

    if (answer == (nums[0] + nums[1]))
      @turn += 1
      self.response(true)
    else
      whos_turn.loose_life
      if (whos_turn.lives <= 0)
        self.end_game
      else
        @turn += 1
        self.response(false)
      end
    end

  end

  def response(bool)
    if (bool)
      puts "YES"
      self.new_turn(self.generate_nums, whos_turn)
    else
      puts "NO, you loose a life"
      self.new_turn(self.generate_nums, whos_turn)
    end

  end

  def end_game
    if @player1.lives == 0
      winner = @player2
    else
      winner = @player1
    end
    puts "WINNER: #{winner.name}, with #{winner.lives} lives left!!!!!"
  end

end