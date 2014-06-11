class DungeonsController < ApplicationController
  def index
  end

  def new
    session[:leader] = "avatar"  unless session[:leader]
    session[:sub1]   = "avatar"  unless session[:sub1]
    session[:sub2]   = "avatar"  unless session[:sub2]
    session[:sub3]   = "avatar"  unless session[:sub3]
    session[:sub4]   = "avatar"  unless session[:sub4]
    session[:friend] = "avatar"  unless session[:friend]
    @advent = 23
  end

  def show

    session[:dungeon] = nil
    session[:leader] = nil
    session[:sub1]   = nil
    session[:sub2]   = nil
    session[:sub3]   = nil
    session[:sub4]   = nil
    session[:friend] = nil

    d_id = params[:id]
    @p = params[:p] || 1

    @guide = Dungeon.where("d_id = #{d_id} and id > #{5*@p-5} and id <= #{5*@p}")
#

    @pages = @guide.all
    @page = @pages.count / 2
    puts @page

    if (@guide.blank?)
      @guide = []
    end

  end

  def create

    Dungeon.new do |c|
      c.d_id = params[:id]
      c.kind = "A"
      c.leader = nil
      c.friend = params[:friend]
      c.sub1 = params[:sub1]
      c.sub2 = params[:sub2]
      c.sub3 = params[:sub3]
      c.sub4 = params[:sub4]
      c.comment = params[:comment]
      c.user_name = params[:user_name]
      c.like = "ge"
      c.save
      @Dungeon = c.errors.messages
    end
    puts @Dungeon

    render :action => "new", :locals => { :@advent => 23, :@Dungeon => @Dungeon}
    #redirect_to "/dungeons/#{params[:id]}"
  end

  def update
    pathname = params[:dungeon]
    dungeon = pathname.delete('/dungeons/')
    if dungeon === "ヘラ降臨"
      id = session[:hera].find do |row|
        row == params[:id]
      end
      if id.nil?
        user = Hera.find(params[:id])
        good = user.like
        puts user.like = good.to_i + 1
        user.save
        session[:hera] = []
        session[:hera] << params[:id]
      end
    end

    render text: "ok"
  end

end
