require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "5 player payouts" do
    game = Game.new
    5.times { |i| game.results.new(place: i + 1) }
    
    assert_equal 0, game.third_place_winnings
    assert_equal 0, game.second_place_winnings
    assert_equal 100, game.first_place_winnings
  end

  test "6 player payouts" do
    game = Game.new
    6.times { |i| game.results.new(place: i + 1) }
    
    assert_equal 0, game.third_place_winnings
    assert_equal 20, game.second_place_winnings
    assert_equal 100, game.first_place_winnings
  end

  test "7 player payouts" do
    game = Game.new
    7.times { |i| game.results.new(place: i + 1) }
    
    assert_equal 0, game.third_place_winnings
    assert_equal 40, game.second_place_winnings
    assert_equal 100, game.first_place_winnings
  end

  test "8 player payouts" do
    game = Game.new
    8.times { |i| game.results.new(place: i + 1) }
    
    assert_equal 20, game.third_place_winnings
    assert_equal 40, game.second_place_winnings
    assert_equal 100, game.first_place_winnings
  end

  test "11 player payouts" do
    game = Game.new
    11.times { |i| game.results.new(place: i + 1) }
    
    assert_equal 20, game.third_place_winnings
    assert_equal 40, game.second_place_winnings
    assert_equal 160, game.first_place_winnings
  end

  test "12 player payouts" do
    game = Game.new
    12.times { |i| game.results.new(place: i + 1) }
    
    assert_equal 20, game.third_place_winnings
    assert_equal 60, game.second_place_winnings
    assert_equal 160, game.first_place_winnings
  end

  test "15 player payouts" do
    game = Game.new
    15.times { |i| game.results.new(place: i + 1) }
    
    assert_equal 20, game.third_place_winnings
    assert_equal 60, game.second_place_winnings
    assert_equal 220, game.first_place_winnings
  end

end
