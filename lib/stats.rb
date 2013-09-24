require './lib/commit'
require './lib/trophy'
require './lib/long_winded'
require './lib/quadruple_revert'
require './lib/wtf_commit'

class Stats

  def self.generate
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

  def self.commit(sha)
    Commit.parse(`git log -1 --stat --pretty #{sha}`)
  end

end
