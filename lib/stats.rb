require "./lib/commit"

class Stats

  def self.generate
    commits = `git rev-list --all --reverse`.split("\n")
    commits.map{|c| puts c; commit(c)}
  end

  def self.commit(sha)
    Commit.parse(`git log -1 --stat #{sha}`)
  end

end
