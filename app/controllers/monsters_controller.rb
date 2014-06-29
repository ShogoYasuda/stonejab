class MonstersController < ApplicationController

  def index
  end

  def show
    @monsters = Monster.where("main_type = 'ドラゴンタイプ'")
  end

end
