require 'logger'

require './lib/commit'
require './lib/developer'
require './lib/trophy'
require './lib/trophies/long_winded'
require './lib/trophies/quadruple_revert'
require './lib/trophies/wtf_commit'

class Stats

  def initialize(opts = {})
    @project_directory = opts.fetch(:dir){ `pwd` }.strip
    @logger = opts.fetch(:logger){ Logger.new(STDOUT) }
    @developers = {}
  end

  def generate
    in_directory do
      commits = `git rev-list --all --reverse`.split("\n")
      parsed_commits = commits.map{|c| commit(c)}.compact
      
      trophies = Trophy.subclasses
      awarded_trophies = {}
      @logger.info "calculating trophies #{trophies.length}: #{trophies.inspect}"
      trophies.each do |trophy|
        @logger.debug "checking #{trophy}"
        parsed_commits.each do |commit|
          current_trophy = trophy.new
          @logger.debug "checking #{commit.message}"
          if current_trophy.satisfied?(commit)
            awarded_trophies[trophy] = commit 
            commit.author.award(trophy)
          end
        end
      end
      @logger.info "Trophies awarded (#{awarded_trophies.length}): #{awarded_trophies.inspect}"
      @logger.info "="*20
      @logger.info "developers"
      @developers.values.each do |developer|
        @logger.info "#{developer.name} <#{developer.email}>"
        @logger.info "awards"
        developer.trophies.each do |trophy|
          @logger.info trophy
        end
        @logger.info ""
      end
    end
  end

  def find_or_create_developer(name, email)
    return if name.empty? && email.empty?

    if !@developers.include?(email)
      dev = Developer.new(:name => name, :email => email)
      @developers[email] = dev
    end
    @developers[email]
  end

  private

  def in_directory
    Dir.chdir(@project_directory) do
      yield
    end
  end
  
  def commit(sha)
    # TODO doyle: I always feel strange when passing self
    #  into a method, however, at this moment I don't feel
    #  that I am justified in create a new object just
    #  to own the list of developers
    Commit.parse(`git log -1 --stat --pretty #{sha}`, self)
  end

end
