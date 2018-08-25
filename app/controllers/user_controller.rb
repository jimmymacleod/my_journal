class UserController < ApplicationController

  before_action :authorise_user, :except => [:index]
  
end
