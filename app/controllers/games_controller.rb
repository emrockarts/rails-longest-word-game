require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array('A'...'Z').sample(10)
  end
  def score
    #does the word contain letters that are also in the letters array?
    # @words.each_char.map { |c| @letters.include?(c) }
    #if no return sorry, pick letters that match
    #if yes, check the api to see if word is valid
    @word = params['word']
    @lettersgrid = params['lettersgrid'].chars
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    dictionary = open(url).read
    userword = JSON.parse(dictionary)
    valid = userword['found']
  end
end
