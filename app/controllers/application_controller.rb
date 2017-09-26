class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def scrape_craigslist
    @post = Post.all
    @listings_count = []
    @posts_200 = Post.where("price >= 0 and price <= 200 ").count
    # @listings_count << @posts_200
    @posts_400 = Post.where("price >= 201 and price <= 400").count
    @listings_count << @posts_400
    @posts_600 = Post.where("price >= 401 and price <= 600").count
    @listings_count << @posts_600
    @posts_800 = Post.where("price >= 601 and price <= 800").count
    @listings_count << @posts_800
    @posts_1000 = Post.where("price >= 801 and price <= 1000").count
    @listings_count << @posts_1000
    @posts_1200 = Post.where("price >= 1001 and price <= 1200").count
    @listings_count << @posts_1200
    @posts_1400 = Post.where("price >= 1201 and price <= 1400").count
    @listings_count << @posts_1400
    @posts_1600 = Post.where("price >= 1401 and price <= 1600").count
    @listings_count << @posts_1600
    @posts_1800 = Post.where("price >= 1601 and price <= 1800").count
    @listings_count << @posts_1800
    @posts_2000 = Post.where("price >= 1801 and price <= 2000").count
    @listings_count << @posts_2000


    render template: 'scrape_craigslist'
  end
end
