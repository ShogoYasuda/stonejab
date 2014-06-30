class MonstersController < ApplicationController

  def index
  end

  def show
    @monsters = Monster.where("id > 1390")
    @monster = Monster.last
  end

end
