namespace :book do

  desc "Say Hello"
  task :hello => :environment do
    Dungeon.new do |c|
      c.d_id = 1
      c.kind = "A"
      c.leader = "A"
      c.friend = "A"
      c.sub1 = "A"
      c.sub2 = "A"
      c.sub3 = "A"
      c.sub4 = "A"
      c.comment = "A"
      c.user_name = "A"
      c.like = 0
      c.save
      #@Dungeon = c.errors.messages
      if c.save
        puts '成功'
      else
        puts '失敗'
      end
    end
  end

end
