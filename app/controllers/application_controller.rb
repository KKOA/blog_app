class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :rescourse_not_found

  protected

  def rescourse_not_found
  end
end
