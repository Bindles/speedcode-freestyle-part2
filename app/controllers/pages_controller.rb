class PagesController < ApplicationController
  before_action :setapples, only: [ :apples ]
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

  def apples
    @apcount = session[:apcount]
  end
  def add
    @apcount = session[:apcount] +=1
  end
  def remove
    @apcount = session[:apcount] -=1
  end

  private
  def setapples
    session[:apcount] = 0
  end
end
