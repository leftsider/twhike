class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def auth_required
    if session[:current_user]
      true
    else
      redirect_to "/auth/twitter"
    end
  end

  def twitter_client
    if @twitter_client
      @twitter_client
    else
      @twitter_client = Twitter::Client.new(
        :oauth_token => session[:current_user]['credentials']['token'],
        :oauth_token_secret => session[:current_user]['credentials']['secret']
      )
      Rails.logger.info @twitter_client.inspect
      @twitter_client
    end
  end
end
