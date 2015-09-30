class HangpersonGame
attr_accessor :word
attr_accessor :guesses
attr_accessor :wrong_guesses
attr_accessor :wordGuesses

def initialize(new_word)
    @word = new_word
    @guesses = ''
    @wrong_guesses = ''
    @wordGuesses = ''
    for x in 0...new_word.length
        @wordGuesses += '-'
    end
end

def guess(letter)
    if not letter =~ (/[^A-Za-z]/)
        raise ArgumentError, "Your Input Is Not A Letter"
    elsif self.guesses.include? letter or self.wrong_guesses.include? letter
        false
    elsif self.word.include? letter
        add_correct(letter)
        true
    else
        self.wrong_guesses = self.wrong_guesses + letter
    end
end

def add_correct(letter)
    indices = (0 ... self.word.length).find_all { |i| self.world[x,1] == letter }
    indices.each do |x|
        self.wordGuesses[x] = letter
    end
end

def check_win_or_lose
    if self.wrong_guesses.length > 6
        :lose
    elsif !self.wordGuesses.include? '-'
        :win
    else
        :play
    end
end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
