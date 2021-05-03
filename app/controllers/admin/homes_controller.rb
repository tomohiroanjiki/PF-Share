class Admin::HomesController < ApplicationController
  def index
    @publics = Public.all
  end
end
