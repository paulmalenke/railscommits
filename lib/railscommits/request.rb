module RailsCommits
  # This class is used to make requests to the GitHub API
  # Uses path, token, count(default: 10), and author(default: all)
  class Request
    # Initialize Request
    #
    # == Parameters:
    # path::
    #   Path to the API resource for github
    #   (e.g. "repos/rails/rails/commits")
    # token::
    #   GitHub OAUTH Token
    # count::
    #   Number of results to return (default: 10)
    # author::
    #   Retrieve commits by only certain author (default: all)
    #
    def initialize(path, token, count = 10, author = nil)
      @path = path
      @token = token
      @count = check_count(count)
      @author = author
      @conn = Faraday.new(url: 'https://api.github.com/') do |faraday|
        faraday.use Faraday::Response::RaiseError
        faraday.request :url_encoded
        faraday.adapter Faraday.default_adapter
      end
    end

    # Kicks off the request to GitHub
    #
    # == Parameters:
    # none
    #
    # == Returns:
    # The body of a successful faraday request
    #
    def run
      make_request(@path)
    end

    private

    def make_request(path)
      begin
        response = @conn.get(path) do |request|
          request.headers['Authorization'] = "token #{@token}"
          request.params['per_page'] = @count
          request.params['author'] = @author if @author != nil
          request.options.timeout = 5
          request.options.open_timeout = 2
        end
        JSON.parse(response.body)
      rescue Faraday::ClientError => e
        abort "Error: #{e}"
      end
    end

    def check_count(count)
      count = 100 if count != nil && count > 100
      count
    end
  end
end
