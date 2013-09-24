class Developer
  attr_reader :name, :email, :trophies

  def initialize(hash)
    @name = hash[:name]
    @email = hash[:email]
    @trophies = []
  end

  # Awards the developer the given trophy
  def award(trophy)
    @trophies << trophy 
  end
end
