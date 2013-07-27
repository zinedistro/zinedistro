class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = 'The object you tried to access does not exist'
    not_found
  end

  def not_found
    render :file => "#{Rails.root}/public/404", :status => :not_found, :formats => [:html]
  end
end
