require_relative 'spec_helper'
require_relative '../lib/game'
require 'byebug'

RSpec.describe Game do
  describe '#same_color_place' do
    context 'there is no match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a b c d]
      game.guess = %w[c d e a]
      it 'returns @feedback[:black] equal to 0' do
        expect(game.same_color_place).to eq(0)
      end
    end

    context 'there is a single match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a b c d]
      game.guess = %w[c d e d]
      it 'returns @feedback[:black] equal to 1' do
        # byebug
        expect(game.same_color_place).to eq(1)
      end
    end

    context 'there is two match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a d c d]
      game.guess = %w[c d e d]
      it 'returns @feedback[:black] equal to 2' do
        # byebug
        expect(game.same_color_place).to eq(2)
      end
    end

    context 'there is three match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a b c d]
      game.guess = %w[a e c d]
      it 'returns @feedback[:black] equal to 3' do
        # byebug
        expect(game.same_color_place).to eq(3)
      end
    end

    context 'there is a single match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a e c d]
      game.guess = %w[a e c d]
      it 'returns @feedback[:black] equal to 4' do
        # byebug
        expect(game.same_color_place).to eq(4)
      end
    end
  end
end
