class SessionsController < ApplicationController

  def create
    session[:current_user] = { 'info' => auth_hash['info'], 'credentials' => auth_hash['credentials'] }
    redirect_to tweets_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
