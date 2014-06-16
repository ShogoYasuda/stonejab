class DungeonsController < ApplicationController
  def index
  end

  def new
    @advent = 24
  end

  def show

    @d_id = params[:id].to_i
    @p = if params[:p] then params[:p].to_i else 1 end

    puts "----"
    puts @p

    if @p == 1
      last = Dungeon.where("d_id = #{@d_id}").last
      if last.nil?
        @no_exist = "攻略PT情報が存在しません"
      else
        @guide = Dungeon.where("d_id = #{@d_id} AND id <= #{last.id}").limit(5).order("id DESC")
      end
    else
      last = Dungeon.where("d_id = #{@d_id}").last
      guide = Dungeon.where("d_id = #{@d_id} AND id <= #{last.id}").limit(5).order("id DESC")
      last_id = guide.last.id
      @guide = Dungeon.where("d_id = #{@d_id} AND id <= #{last_id}").limit(5).order("id DESC")
    end

    all = Dungeon.where("d_id = #{@d_id}")
    @page = if all.count / 5 == 0 then all.count / 5 else all.count / 5  + 1 end
    puts @page

    if (@guide.blank?)
      @guide = []
    end

  end

  def create

    Dungeon.new do |c|
      c.d_id = params[:id]
      c.kind = "A"
      c.leader = params[:leader]
      c.friend = params[:friend]
      c.sub1 = params[:sub1]
      c.sub2 = params[:sub2]
      c.sub3 = params[:sub3]
      c.sub4 = params[:sub4]
      c.comment = params[:comment]
      c.user_name = params[:user_name]
      c.like = 0
      c.save
      #@Dungeon = c.errors.messages
      if c.save
        puts '成功'
      else
        puts '失敗'
      end
    end
    #puts @Dungeon

    #render :action => "new", :locals => { :@advent => 23, :@Dungeon => @Dungeon}
    redirect_to "/dungeons/#{params[:id]}"
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
