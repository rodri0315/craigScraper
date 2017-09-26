class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def scrape_craigslist
    @post = Post.all

    @listings_count = []

    @posts_200 = Post.where("price >= 0 and price <= 200 ").count
    # Get the number of posts and save the count to listings_count array.
    # Could make this implementation much better
    j = 0
    1.upto(9) do |i|
      # get the start price ranges to use it in the where method
      start = ((j+ 1) * 200) + 1
      up_to = (i+ 1) * 200
      # Get the count and save it to the array
      posts = Post.where("price >= #{start} and price <= #{up_to}").count
      @listings_count << posts
      j += 1
    end

    render template: 'scrape_craigslist'
  end
end
