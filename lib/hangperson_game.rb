class HangpersonGame
attr_accessor :word
attr_accessor :guesses
attr_accessor :wrong_guesses

def initialize(new_word)
    @word = new_word
    @guesses = ''
    @wrong_guesses = ''

end

def guess(letter)
    if letter =~ (/[^A-Za-z]/)
        raise ArgumentError, "Your Input Is Not A Letter"
    end
    if letter.nil? or letter == ""
        raise ArgumentError, "Your Input Is Not A Letter"
    end
    letter.downcase!
    if @guesses.include? letter or @wrong_guesses.include? letter
        false
    elsif @word.include? letter
        @guesses << letter
    else
        @wrong_guesses << letter
    end
end

def word_with_guesses
    @word.gsub(/./) { |letter| @guesses.include?(letter) ? letter : '-' }
end

def check_win_or_lose
    if @wrong_guesses.length > 6
        :lose
    elsif word_with_guesses == @word
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
