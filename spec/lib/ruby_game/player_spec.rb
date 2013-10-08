require "spec_helper"
require_relative '../../../lib/ruby_game/static_object'
require_relative '../../../lib/ruby_game/moving_object'
require_relative '../../../lib/ruby_game/player'

RubyGame::Player.new(590, 420)

describe RubyGame::Player do
  before :each do
    @player = RubyGame::Player.new(100, 100)
  end
  it "is a class" do
    @player.class.should eql RubyGame::Player
  end
end