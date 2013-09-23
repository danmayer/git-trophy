class Trophy
  attr_reader :name, :description, :conditions

  # Returns true if given commit meets the
  # conditions of this trophy
  def satisfied?(commit)
    false
  end

  def inherited other
    super if defined? super
  ensure
    ( @subclasses ||= [] ).push(other).uniq!
  end
  
  def subclasses
    @subclasses ||= []
    @subclasses.inject( [] ) do |list, subclass|
      list.push(subclass, *subclass.subclasses)
    end
  end
end
