require './lib/commit'
require './lib/developer'
require './lib/trophy'
require './lib/long_winded'
require './lib/quadruple_revert'
require './lib/wtf_commit'

class Stats

  def initialize
    @developers = {}
  end

  def generate
    commits = `git rev-list --all --reverse`.split("\n")
    parsed_commits = commits.map{|c| commit(c)}.compact
    
    trophies = Trophy.subclasses
    awarded_trophies = {}
    puts "calculating trophies #{trophies.length}: #{trophies.inspect}"
    trophies.each do |trophy|
      puts "checking #{trophy}"
      parsed_commits.each do |commit|
        current_trophy = trophy.new
        puts "checking #{commit.message}"
        awarded_trophies[trophy] = commit if current_trophy.satisfied?(commit)
      end
    end
    puts "awards #{awarded_trophies.inspect}"
  end

  def find_or_create_developer(name, email)
    if !@developers.include?(email)
      dev = Developer.new(:name => name, :email => email)
      @developers[email] = dev
    end
    @developers[email]
  end

  private
  def commit(sha)
    # TODO doyle: I always feel strange when passing self
    #  into a method, however, at this moment I don't feel
    #  that I am justified in create a new object just
    #  to own the list of developers
    Commit.parse(`git log -1 --stat --pretty #{sha}`, self)
  end

end
