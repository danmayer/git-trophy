require "./lib/trophy"

class QuadrupleRevert < Trophy

  def initialize
    @name = "Quadruple Revert"
    @description = "cause we need to ease the code in, slowly"
    @conditions = "a commit that contains 4 reverts"
  end 

  def satisfied?(commit)
    commit.message.match(/revert.*revert.*revert.*revert/)
  end
end
