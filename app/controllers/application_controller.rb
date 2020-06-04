# Application-Controller- any method written in this
# controller is avaliable to all the controllers.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include DefaultPageContent

  before_action :authenticate_user!
end
