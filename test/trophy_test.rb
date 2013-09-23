require "test/unit"
require "./lib/commit"
require "./lib/long_winded"

class TrophyTest < Test::Unit::TestCase

  def test_long_winded
    message = "".tap do |m|
      1000.times do
        m << "foo "
      end
    end

    assert LongWinded.new.satisfied?(Commit.new(:message => message))
  end
end
