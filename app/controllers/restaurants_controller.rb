class RestaurantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

    def index
        render json: Restaurant.all
    end

    def show
        restaurant = Restaurant.find(params[:id])
        render json: restaurant, serializer: RestaurantShowPizzaSerializer, status: :ok
    end

    def destroy
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        render json: {}, status: 204
    end

    private
    def render_record_not_found
        render json: {error: "Restaurant not found"}, status: 404
    end
end
