class DungeonsController < ApplicationController
  def index

    ua = request.env["HTTP_USER_AGENT"]
    if(ua.include?('Mobile') || ua.include?('Android'))
      render template: "dungeons/index_s"
    else
      render template: "dungeons/index"
    end

  end

  def new

    if params[:d_id]
      enemies = []
      id = params[:d_id].delete('d')
      CSV.foreach("app/assets/csv/#{id}.csv") do |row|
        enemies.push(row)
      end
      render json: enemies
    else
      ua = request.env["HTTP_USER_AGENT"]
      if(ua.include?('Mobile') || ua.include?('Android'))
        render template: "dungeons/new_s"
      else
        render template: "dungeons/new"
      end
    end

  end

  def show

    @d_id = params[:id].to_i
    @p = if params[:p] then params[:p].to_i else 1 end

    if @p == 1
      last = Dungeon.where("d_id = #{@d_id}").last
      if last.nil?
        @no_exist = "攻略PT情報が存在しません"
      elsif params[:search] != nil
        search_monster = params[:search]
        @guide = Dungeon.where([
          "d_id = ? AND id <= ? AND leader LIKE ? OR d_id = ? AND id <= ? AND sub1 LIKE ? OR d_id = ? AND id <= ? AND sub2 LIKE ? OR d_id = ? AND id <= ? AND sub3 LIKE ? OR d_id = ? AND id <= ? AND sub4 LIKE ? OR d_id = ? AND id <= ? AND friend LIKE ?",
          @d_id,last.id,"%#{search_monster}%",@d_id,last.id, "%#{search_monster}%",@d_id,last.id, "%#{search_monster}%",@d_id,last.id, "%#{search_monster}%",@d_id,last.id, "%#{search_monster}%",@d_id,last.id, "%#{search_monster}%"])
          .limit(10)
          .order("id DESC")
      else
        @guide = Dungeon.where("d_id = #{@d_id} AND id <= #{last.id}").limit(10).order("id DESC")
      end
    else
      last = Dungeon.where("d_id = #{@d_id}").last
      guide = Dungeon.where("d_id = #{@d_id} AND id <= #{last.id}").limit(10).order("id DESC")
      last_id = guide.last.id
      @guide = Dungeon.where([
        "d_id = ? AND id <= ? AND leader LIKE ? OR d_id = ? AND id <= ? AND sub1 LIKE ? OR d_id = ? AND id <= ? AND sub2 LIKE ? OR d_id = ? AND id <= ? AND sub3 LIKE ? OR d_id = ? AND id <= ? AND sub4 LIKE ? OR d_id = ? AND id <= ? AND friend LIKE ?",
        @d_id,last.id,"%#{search_monster}%",@d_id,last.id, "%#{search_monster}%",@d_id,last.id, "%#{search_monster}%",@d_id,last.id, "%#{search_monster}%",@d_id,last.id, "%#{search_monster}%",@d_id,last.id, "%#{search_monster}%"])
        .limit(10)
        .order("id DESC")
    end

    all = Dungeon.where("d_id = #{@d_id}")
    @page = if all.count / 10 == 0 then all.count / 10 else all.count / 10  + 1 end

    if (@guide.blank?)
      @guide = []
    end

    ua = request.env["HTTP_USER_AGENT"]
    if(ua.include?('Mobile') || ua.include?('Android'))
      render template: "dungeons/show_s"
    else
      render template: "dungeons/show"
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
