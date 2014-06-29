class MonstersController < ApplicationController

  def index
  end

  def show
    @monsters = Monster.where("id > 0 AND id < 13")
    @count = Monster.count
  end

end
