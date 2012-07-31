class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_found
    render :file => "#{Rails.root}/public/404", :status => :not_found, :formats => [:html]
  end
end
