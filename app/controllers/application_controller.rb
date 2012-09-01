class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def auth_required
    session[:current_user]
  end

  def twitter_client
    if @twitter_client
      @twitter_client
    else
      @twitter_client = Twitter::Client.new(
        :oauth_token => auth_required['credentials']['token'],
        :oauth_token_secret => auth_required['credentials']['secret']
      )
      Rails.logger.info @twitter_client.inspect
      @twitter_client
    end
  end
end
