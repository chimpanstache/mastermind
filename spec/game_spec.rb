require_relative 'spec_helper'
require_relative '../lib/game_logic'
require 'byebug'

RSpec.describe GameLogic do
  describe '#black_count' do
    context 'there is no match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a b c d]
      game.guess = %w[c d e a]
      it 'returns @feedback[:black] equal to 0' do
        expect(game.black_count).to eq(0)
      end
    end

    context 'there is a single match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a b c d]
      game.guess = %w[c d e d]
      it 'returns @feedback[:black] equal to 1' do
        expect(game.black_count).to eq(1)
      end
    end

    context 'there is two match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a d c d]
      game.guess = %w[c d e d]
      it 'returns @feedback[:black] equal to 2' do
        expect(game.black_count).to eq(2)
      end
    end

    context 'there is three match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a b c d]
      game.guess = %w[a e c d]
      it 'returns @feedback[:black] equal to 3' do
        expect(game.black_count).to eq(3)
      end
    end

    context 'there is 4 match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a e c d]
      game.guess = %w[a e c d]
      it 'returns @feedback[:black] equal to 4' do
        expect(game.black_count).to eq(4)
      end
    end
  end

  describe '#white_count' do
    context 'there is no match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[b b c d]
      game.guess = %w[a a e f]
      it 'returns @feedback[:white] equal to 0' do
        expect(game.white_count).to eq(0)
      end
    end

    context 'there is a single match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a a c d]
      game.guess = %w[c e e f]
      it 'returns @feedback[:white] equal to 1' do
        expect(game.white_count).to eq(1)
      end
    end

    context 'there is two match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a d c d]
      game.guess = %w[e c b a]
      it 'returns @feedback[:white] equal to 2' do
        expect(game.white_count).to eq(2)
      end
    end

    context 'there is three match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a b c d]
      game.guess = %w[b a e c]
      it 'returns @feedback[:white] equal to 3' do
        expect(game.white_count).to eq(3)
      end
    end

    context 'there is 4 match between user input and game' do
      game = Game.new
      game.init
      game.game = %w[a e c d]
      game.guess = %w[d c e a]
      it 'returns @feedback[:white] equal to 4' do
        expect(game.white_count).to eq(4)
      end
    end
  end
end
