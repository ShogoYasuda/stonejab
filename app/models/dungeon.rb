class Dungeon < ActiveRecord::Base

  validates :d_id, :kind, :leader, :friend, :sub1, :sub2, :sub3, :sub4, :user_name, presence: true

  validates :d_id, :like, :numericality => {:only_integer => true}

  validates_length_of :leader, :friend, :sub1, :sub2, :sub3, :sub4, maximum: 64

  validates_length_of :kind, :user_name, maximum: 32


end
