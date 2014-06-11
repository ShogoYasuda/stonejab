class Dungeon < ActiveRecord::Base

  validates :d_id, :kind, :leader, :friend, :sub1, :sub2, :sub3, :sub4, :user_name, presence: { :message => "入力してください" }

  validates :d_id, :like, :numericality => {:only_integer => true, :message => "数字を入力してください"}

  validates_length_of :leader, :friend, :sub1, :sub2, :sub3, :sub4, maximum: 64, :message => "64文字内で入力してください"

  validates_length_of :kind, :user_name, maximum: 32, :message => "32文字内で入力してください"


end
