class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
end

def new

end

def create

end
