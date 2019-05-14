class RepositoriesController < ApplicationController

  def index
    @repositories = []
    if params[:search]
      data = Faraday.get("https://api.github.com/search/repositories") do |r|
        r.params['q'] = params[:search]
        r.headers['Accept'] = 'application/vnd.github.v3+json'
      end
      body = JSON.parse(data.body)
      @repositories = body["items"]
    end
  end
end
