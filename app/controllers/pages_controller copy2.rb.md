class PagesController < ApplicationController
  def index
    url_params = params[:url_params] || "pod-vape-systems"  # Use a default category if no param is provided
    base_url = "https://www.eightvape.com/collections/#{url_params}/products.json"


    url = base_url
    response = Net::HTTP.get(URI(url))
    @products = JSON.parse(response)["products"]
  rescue StandardError => e
    @error = "Failed to fetch products: #{e.message}"
  end
end
