class PagesController < ApplicationController
  include HTTParty

  def index
    my_urls = [ "collections/pod-vape-systems", "collections/vapes" ]
    url_params = params[:url_params] || my_urls.sample  # Default category if no param is provided
    base_url = "https://www.eightvape.com/#{url_params}/products.json"

    p "PARAMS"
    puts params
    puts params.inspect
    puts params[:url_params] ? params[:url_params] : "no params for [:url_params]"
    response = HTTParty.get(base_url)
    if response.success?
      @products = response.parsed_response["products"]
    else
      @error = "Failed to fetch products: #{response.message}"
    end
  rescue StandardError => e
    @error = "Failed to fetch products: #{e.message}"
  end
end
