class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource


def index
    @users = User.all
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
end

end