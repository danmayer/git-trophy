require "test/unit"
require "./lib/stats"

class StatsTest < Test::Unit::TestCase

  def setup
    @stats = Stats.new
  end
  
  def test_find_developer
    dev = @stats.find_or_create_developer("person", "person@test.com")
    assert_equal dev, @stats.find_or_create_developer("person", "person@test.com")
  end

  def test_create_developer
    dev = @stats.find_or_create_developer("person", "person@test.com")
    assert_equal "person", dev.name
    assert_equal "person@test.com", dev.email
  end
end
