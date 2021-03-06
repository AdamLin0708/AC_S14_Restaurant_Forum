class RestaurantsController < ApplicationController
  
  def index
    @restaurants = Restaurant.order(created_at: :asc).page(params[:page]).per(9)    
    @categories = Category.all     
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end


  # 觀看評論網最新訊息
  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  # 觀看餐廳詳細資訊
  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end

  # TOP10餐廳資訊
  def ranking
    @restaurants = Restaurant.order(favorites_count: :desc).limit(10)    
  end

  # favorite 
  def favorite
    @restaurant = Restaurant.find(params[:id])
    @restaurant.favorites.create!(user: current_user)    
    redirect_back(fallback_location: root_path) #回上一頁
  end

  def unfavorite
    @restaurant = Restaurant.find(params[:id])
    favorites = Favorite.where(restaurant: @restaurant, user: current_user)
    favorites.destroy_all    
    redirect_back(fallback_location: root_path)
  end

  # like
  def like
    @restaurant = Restaurant.find(params[:id])
    @restaurant.likes.create!(user: current_user)
    redirect_back(fallback_location: root_path) #回上一頁
  end

  def unlike
    @restaurant = Restaurant.find(params[:id])
    likes = Like.where(restaurant: @restaurant, user: current_user)
    likes.destroy_all
    redirect_back(fallback_location: root_path)
  end
  
end
