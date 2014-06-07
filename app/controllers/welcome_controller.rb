class WelcomeController < ApplicationController
  def index
    session[:dungeon] = nil
    session[:leader] = nil
    session[:sub1]   = nil
    session[:sub2]   = nil
    session[:sub3]   = nil
    session[:sub4]   = nil
    session[:friend] = nil
  end
end
