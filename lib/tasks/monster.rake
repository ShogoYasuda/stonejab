namespace :monster do

  desc "Insert All Monsters Data"
  task :insert => :environment do

    require 'open-uri'

    for i in 1..1400

      if i > 0 && i < 10
        url = "http://pd.appbank.net/m00#{i}"
      elsif i > 9 && i < 100
        url = "http://pd.appbank.net/m0#{i}"
      elsif i > 99 && i <= 1400
        url = "http://pd.appbank.net/m#{i}"
      end

      doc = Nokogiri::HTML(open(url),nil,"utf-8")

      if doc.css("#entry > p").text == "お探しのページは見つかりませんでした。下記のキングメタルドラゴンをクリックしてトップページへ戻ってください。"
        Monster.new do |column|
          column.name = nil
          column.element = nil
          column.sub_element = nil
          column.rare = nil
          column.cost = nil
          column.type = nil
          column.sub_type = nil
          column.hp = nil
          column.atk = nil
          column.heal = nil
          column.skill = nil
          column.leader_skill = nil
          column.arousal = nil
          column.arousal2 = nil
          column.arousal3 = nil
          column.arousal4 = nil
          column.arousal5 = nil
          column.arousal6 = nil
          column.arousal7 = nil
          column.arousal8 = nil
          column.arousal9 = nil
          column.save
        end
      else
        doc.css("#monster").each do |row|

          Monster.new do |column|

          if i > 0 && i < 10
            column.name = row.css('h3.title-pattern-darkblue').text.slice(5,50)
          elsif i > 9 && i < 100
            column.name = row.css('h3.title-pattern-darkblue').text.slice(6,50)
          elsif i > 99 && i < 1000
            column.name = row.css('h3.title-pattern-darkblue').text.slice(7,50)
          elsif i > 999 && i < 10000
            column.name = row.css('h3.title-pattern-darkblue').text.slice(8,50)
          end

          cost = row.css('p.icon-attr').text.split('/')
          column.element = row.css('p.icon-attr > i').attr('class').text.to_s.gsub(/icon-attr-/, "")
          column.sub_element = row.css('p.icon-attr > i[2]').attr('class').text.to_s.gsub(/icon-attr-/, "") unless row.css('p.icon-attr > i[2]').count == 0
          column.rare = cost[1].delete('★ ')
          column.cost = cost[2].delete('コスト: ')
          column.type = row.css('p.icon-mtype > a:nth-child(2)').text
          column.sub_type = row.css('p.icon-mtype > a:nth-child(4)').text
          column.hp = row.css('tr:nth-child(3) > td:nth-child(2)').text
          column.atk = row.css('tr:nth-child(3) > td:nth-child(3)').text
          column.heal = row.css('tr:nth-child(3) > td:nth-child(4)').text
          column.skill = row.css('tr:nth-child(3) > td:nth-child(5)').text
          column.leader_skill = row.css('div.space[6] > p.skill-name > a[1]').text
          column.arousal = row.css('div.space[8] > p.skill-name > a').text
          column.arousal2 = row.css('div:nth-child(10) > div:nth-child(2) > p.skill-name > a').text unless row.css('div:nth-child(10) > div:nth-child(2) > p.skill-name > a').count == 0
          column.arousal3 = row.css('div:nth-child(10) > div:nth-child(3) > p.skill-name > a').text unless row.css('div:nth-child(10) > div:nth-child(3) > p.skill-name > a').count == 0
          column.arousal4 = row.css('div:nth-child(10) > div:nth-child(4) > p.skill-name > a').text unless row.css('div:nth-child(10) > div:nth-child(4) > p.skill-name > a').count == 0
          column.arousal5 = row.css('div:nth-child(10) > div:nth-child(5) > p.skill-name > a').text unless row.css('div:nth-child(10) > div:nth-child(5) > p.skill-name > a').count == 0
          column.arousal6 = row.css('div:nth-child(10) > div:nth-child(6) > p.skill-name > a').text unless row.css('div:nth-child(10) > div:nth-child(6) > p.skill-name > a').count == 0
          column.arousal7 = row.css('div:nth-child(10) > div:nth-child(7) > p.skill-name > a').text unless row.css('div:nth-child(10) > div:nth-child(7) > p.skill-name > a').count == 0
          column.arousal8 = row.css('div:nth-child(10) > div:nth-child(8) > p.skill-name > a').text unless row.css('div:nth-child(10) > div:nth-child(8) > p.skill-name > a').count == 0
          column.arousal9 = row.css('div:nth-child(10) > div:nth-child(9) > p.skill-name > a').text unless row.css('div:nth-child(10) > div:nth-child(9) > p.skill-name > a').count == 0
          column.save

          end
        end
      end
    end
  end
end
