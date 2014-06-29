class MonstersController < ApplicationController

  def index
  end

  def show
    @monsters = Monster.where("id < 21")
  end

end
