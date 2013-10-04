require "./lib/trophy"

class KeepItBrief < Trophy

  def initialize
    @name = "Keeping it Brief"
    @description = "Commit message, we don't need any commit message. See my one word commit and devine the greater meaning"
    @conditions = "a commit that contains a single word commit"
    @emoji = "\u{1F636}"
  end 

  def satisfied?(commit)
    commit.message.split.length > 1
  end
end
