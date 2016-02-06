class Recipe < ActiveRecord::Base
  include HTTParty
  

  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || "www.food2fork.com"
  base_uri "http://#{hostport}/api"
  key_value = ENV["FOOD2FORK_KEY"]
  default_params key: key_value, fields: "image_tag, title, social_rank", q: "search"
  format :json

  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end


end




