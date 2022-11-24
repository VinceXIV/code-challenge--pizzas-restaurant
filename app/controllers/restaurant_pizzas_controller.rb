class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_when_creation_unsuccessful

    def create
        restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        pizza = restaurant_pizza.pizza
        render json: pizza, serializer: RestaurantPizzaSerializer, status: 201
    end

    private
    def restaurant_pizza_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end

    def render_when_creation_unsuccessful(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: 422
    end
end
