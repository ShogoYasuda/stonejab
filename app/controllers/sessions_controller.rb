class SessionsController < ApplicationController
  def new
    puts session[:d_id]
    session[:d_id] = params[:d_id] if params[:d_id]
    session[:leader] = params[:name] if params[:role] == "leader"
    session[:sub1] = params[:name] if params[:role] == "sub1"
    session[:sub2] = params[:name] if params[:role] == "sub2"
    session[:sub3] = params[:name] if params[:role] == "sub3"
    session[:sub4] = params[:name] if params[:role] == "sub4"
    session[:friend] = params[:name] if params[:role] == "friend"
    session[:user_name] = params[:user_name] if params[:user_name]
  end

  def clear
    session[:leader] = nil if params[:clear] == "leader-clear"
    session[:friend] = nil if params[:clear] == "friend-clear"
    session[:sub1] = nil if params[:clear] == "sub1-clear"
    session[:sub2] = nil if params[:clear] == "sub2-clear"
    session[:sub3] = nil if params[:clear] == "sub3-clear"
    session[:sub4] = nil if params[:clear] == "sub4-clear"
  end

  def destroy

  end
end
