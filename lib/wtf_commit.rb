require "./lib/trophy"

class WtfCommit < Trophy

  def initialize
    @name = "wtf commit"
    @description = "This code is wtf"
    @conditions = "a commit that contains wtf"
  end 

  def satisfied?(commit)
    commit.message.match(/wtf/)
  end
end
