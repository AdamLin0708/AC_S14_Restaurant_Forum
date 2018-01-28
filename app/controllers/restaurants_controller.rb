class RestaurantsController < ApplicationController
  
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)    
    @categories = Category.all     
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end


  #跟著routes中設定的名稱
  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end
end
