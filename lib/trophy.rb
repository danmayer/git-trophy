class Trophy
  attr_reader :name, :description, :conditions

  # Returns true if given commit meets the
  # conditions of this trophy
  def satisfied?(commit)
    false
  end
end
