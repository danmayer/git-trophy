class Developer
  attr_reader :name, :email

  def initialize(hash)
    @name = hash[:name]
    @email = hash[:email]
  end
end
