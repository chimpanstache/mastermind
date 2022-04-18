class Mastermind
  @@guess = ""
  @@game = 4.times.map { "123456".chars.sample }.join 
  @@score = ""
end
