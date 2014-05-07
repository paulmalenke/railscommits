module RailsCommits
  # This class is used to get the commit history for Rails on GitHub.
  class CommitHistory
    # Initializer
    #
    # == Parameters:
    # token::
    #   GitHub OAUTH Token
    # count::
    #   Number of results to return (default: 10)
    # author::
    #   Retrieve commits by only certain author (default: all)
    #
    def initialize(token, count = 10, author = nil)
      @token = token
      @count = count
      @author = author
    end

    # Gets commit history for Rails on GitHub
    def history
      RailsCommits::Request.new('repos/rails/rails/commits', @token, @count, @author).run
    end
  end
end
