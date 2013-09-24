require "test/unit"
require "./lib/commit"

class CommitTest < Test::Unit::TestCase

  def test_parse
    log = %Q{commit ed73b2ed231a384fd2d684b82c526e3f62bb3966
              Author: Christian Doyle <christian.l.doyle@gmail.com>
              Date:   Sun Sep 22 14:52:00 2013 -0400

                  Added gemfile.

               Gemfile | 3 +++
               1 file changed, 3 insertions(+)}

    commit = Commit.parse(log, self)

    assert_equal "ed73b2ed231a384fd2d684b82c526e3f62bb3966", commit.sha
    assert_equal "Christian Doyle", commit.author.name
    assert_equal "christian.l.doyle@gmail.com", commit.author.email
    assert_equal Time.parse("Sun Sep 22 14:52:00 2013 -0400"), commit.date
    assert_equal "Added gemfile.", commit.message.strip
    assert_equal 3, commit.insertions
  end

  def test_parse_merge
    log = %Q{commit 67a97386168bf631771a21027b0081bf652029e5
              Merge: 3e213ce 3c2d11a
              Author: Dan Mayer <dan@mayerdan.com>
              Date:   Fri Sep 20 17:07:32 2013 -0700

                  Merge pull request #1 from doyle/master

                  Updated formatting and added several trophies.}
    assert_nothing_raised do 
      Commit.parse(log, self)
    end
  end

  def find_or_create_developer(name, email)
    Developer.new(:name => name, :email => email)
  end
end
