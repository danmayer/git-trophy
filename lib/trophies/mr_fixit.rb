require "./lib/trophy"

class MrFixitCommit < Trophy

  def initialize
    @name = "Mr. Fix It"
    @description = "Something was wrong, this commit fixed it... If you blame the error, I likely caused it too"
    @conditions = "a commit that contains fix or similar terms"
    @emoji = "\u{1F527}"
  end 

  def satisfied?(commit)
    commit.message.match(/(fix |fixed|repair|solved)/)
  end
end
