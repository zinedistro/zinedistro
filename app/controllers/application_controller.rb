# ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  def not_found
    flash[:notice] = I18n.t('flash.record_not_found')
    render(file: 'application/_missing',
           status: :not_found,
           formats: [:html],
           layout:  true)
  end
end
