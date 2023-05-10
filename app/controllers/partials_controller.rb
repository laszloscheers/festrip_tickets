class PartialsController < ApplicationController
  # Prevents CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  
  def _header
  end

  def _footer
  end
end
