class PagesController < ApplicationController

  def home
    if user_signed_in?
      redirect_to :controller=>'bikes', :action => 'index'
    end
  end

  def privacy_policy
  end

  def about
  end

end
