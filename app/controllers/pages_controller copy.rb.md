class PagesController < ApplicationController
  include HTTParty
  BASE_URL = "https://www.eightvape.com/collections/pod-vape-systems/products.json"
  # BASE_URL = "https://www.eightvape.com/products.json"
  # BASE_URL = "https://www.eightvape.com/vapes/products.json"
  def index
    def fetcher
      response = HTTParty.get(BASE_URL)
      @products = response.parsed_response["products"]
    rescue StandardError => e
      @error = "Failed to fetch products: #{e.message}"
    end
    fetcher
  end
end
