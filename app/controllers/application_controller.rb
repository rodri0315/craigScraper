class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def scrape_craigslist
    @post = Post.all
    # get count of first batch of listings
    @posts_200 = Post.where("price >= 0 and price <= 200 ").count

    @apt_price_info =[]
    # Get the number of posts and save the count, and price ranges in apt_price_info array, save information in a hash.
    # Could make this implementation much better
    j = 0
    1.upto(9) do |i|
      # get the price ranges to use it in the where method and push the numbers to the apt_price_info hash.
      start = ((j+ 1) * 200) + 1
      up_to = (i+ 1) * 200
      # Get the count and save it to the array
      posts_count = Post.where("price >= #{start} and price <= #{up_to}").count
      listing_info = {
        price_start: start,
        limit_price: up_to,
        count: posts_count
      }
      @apt_price_info << listing_info
      j += 1
    end

    render template: 'scrape_craigslist'
  end
end
