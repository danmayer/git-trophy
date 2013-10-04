require "./lib/trophy"

class LongWinded < Trophy

  def initialize
    @name = "Long Winded"
    @description = "good code requires good explanations"
    @conditions = "write a commit message with more than 500 words"
    @emoji = "\u{1F4D8}"
  end 

  def satisfied?(commit)
    commit.message.split(" ").size > 500
  end
end
