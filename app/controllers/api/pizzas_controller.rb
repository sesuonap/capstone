class Api::PizzasController < ApplicationController

  def index 
    render 'pizza.json.jbuilder'
  end
end
