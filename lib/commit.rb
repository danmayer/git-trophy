require "rubygems"
require 'active_support/core_ext'
require 'active_support/time'

# Contains information about a git commit
class Commit
  attr_reader :sha, :author, :email, :date, :message, :insertions, :deletions

  def self.parse(string)
    lines = string.split("\n")
    begin
      hash = {
        :sha => lines[0].match(/\s(.+$)/)[1],
        :author => parse_author(lines[1]),
        :email => parse_email(lines[1]),
        :date => parse_date(lines[2]),
        :message => parse_message(lines),
        :insertions => parse_insertions(lines.last),
        :deletions => parse_deletions(lines.last)
      }
      self.new(hash)
    rescue => error
      puts "error #{hash} skipping commit #{string}"
      nil
    end
  end

  def initialize(hash)
    @sha = hash[:sha]
    @author = hash[:author]
    @email = hash[:email]
    @date = hash[:date]
    @message = hash[:message]
    @insertions = hash[:insertions]
    @deletions = hash[:deletions]
  end

  def to_s
    [@sha, @author, @email, @date, @message, @insertions, @deletions].join("\n")
  end

  private

  def self.parse_author(line)
    match = line.match(/Author:\s(.+)\s</)
    match ? match[1] : ""
  end

  def self.parse_email(line)
    match = line.match(/<(.+)>/)
    match ? match[1] : ""
  end

  def self.parse_date(line)
    match = line.match(/Date:\s+(.+$)/)
    match ? Time.parse(match[1]) : ""
  end

  # Given an array where each line is a line from
  # the log message for a single commit, will
  # return a string which consists of the lines which
  # correspond to the commit message
  def self.parse_message(log)
    min_empty = log.size - 1
    max_empty = 0

    log.each_with_index do |line, i|
      if line.empty?
        if i < min_empty
          min_empty = i
        end
        if i > max_empty
          max_empty = i
        end
      end
    end
    log[min_empty, max_empty - min_empty].join(" ")
  end

  def self.parse_insertions(line)
    parse_changes(line, "insertion")
  end

  def self.parse_deletions(line)
    parse_changes(line, "deletion")
  end

  def self.parse_changes(line, token)
    match = line.match(/(\d+)\s#{token}[s]?/)
    match ? match[1].to_i : 0
  end
end
