class Api::PizzasController < ApplicationController

  def create 
    @pizza = Pizza.create(user_id: current_user.id)
    @pizza.save 
    render 'show.json.jbuilder'
  end 
end
