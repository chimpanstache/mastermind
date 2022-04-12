class Mastermind

      COLORS = [ "a",
    "b",
    "c",
    "d",
    "e",
    "f" ] 

    @@guess = ""
    @@game = COLORS.sample(4)
    @@feedback = { "black": 0, "white": 0 }
end
