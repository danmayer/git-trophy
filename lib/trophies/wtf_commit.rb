require "./lib/trophy"

class WtfCommit < Trophy

  def initialize
    @name = "WTF Commit"
    @description = "This code is wtf"
    @conditions = "a commit that contains wtf"
    @emoji = "\u{2753}"
  end 

  def satisfied?(commit)
    commit.message.match(/wtf/)
  end
end
