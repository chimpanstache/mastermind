require_relative 'spec_helper'
require_relative '../lib/computer'
require 'byebug'

RSpec.describe Computer do
  describe '#calculate_score' do
    computer = Computer.new
    context 'there is no match between user input and game' do
      answer = "1234"
      guess = "3451"
      it 'score equals WWW' do
        expect(computer.calculate_score(guess, answer)).to eq("WWW")
      end
    end

    context 'there is a single match between user input and game' do
      answer = "1234"
      guess = "3454"
      it 'score equals BW' do
        expect(computer.calculate_score(guess, answer)).to eq("BW")
      end
    end

    context 'there is two match between user input and game' do
      answer = "1434"
      guess = "3454"
      it 'score equals BBW' do
        expect(computer.calculate_score(guess, answer)).to eq("BBW")
      end
    end

    context 'there is three match between user input and game' do
      answer = "1234"
      guess = "1534"
      it 'score equals BBB' do
        expect(computer.calculate_score(guess, answer)).to eq("BBB")
      end
    end

    context 'there is 4 match between user input and game' do
      answer = "1534"
      guess = "1534"
      it 'score equals BBBB' do
        expect(computer.calculate_score(guess, answer)).to eq("BBBB")
      end
    end       

    context 'there is no match between user input and game' do
      answer = "2234"
      guess = "1156"
      it 'score equals nothing' do
        expect(computer.calculate_score(guess, answer)).to eq("")
      end
    end

    context 'there is a single match between user input and game' do
      answer = "1134"
      guess = "3556"
      it 'score equals W' do
        expect(computer.calculate_score(guess, answer)).to eq("W")
      end
    end

    context 'there is two match between user input and game' do
      answer = "1434"
      guess = "5321"
      it 'score equals WW' do
        expect(computer.calculate_score(guess, answer)).to eq("WW")
      end
    end

    context 'there is three match between user input and game' do
      answer = "1234"
      guess = "2153"
      it 'score equals WWW' do
        expect(computer.calculate_score(guess, answer)).to eq("WWW")
      end
    end

    context 'there is 4 match between user input and game' do
      answer = "1534"
      guess = "4351"
      it 'score equals WWWW' do
        expect(computer.calculate_score(guess, answer)).to eq("WWWW")
      end
    end
  end
end
