# ApplicationController
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::UnknownFormat, with: :unknown_format

  def not_found
    flash[:notice] = I18n.t('flash.record_not_found')
    render(file: 'application/_missing',
           status: :not_found,
           formats: [:html],
           layout: true)
  end

  def unknown_format
    format = params[:format]
    error_output = "There was a problem with the given format: #{format}"
    render(json: { error: error_output }.to_json, status: 400)
  end
end
