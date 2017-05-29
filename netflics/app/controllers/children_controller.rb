class ChildrenController < ApplicationController

  def index

  end

  def show
    @child = Child.find(params[:id])
  end
  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    redirect_to children_path
  end

  def new
    @child = Child.new
  end

  def edit
    @child = Child.find(params[:id])
    render 'edit'
  end

  def update
    @child = Child.find(params[:id])
    @child.update_attributes(child_params)
    redirect_to movies_path
  end

  def create
    @child = Child.new(child_params)
    @child.user_id = current_user.id
    @child.role = "child"

    @child.state = false


    if @child.save
        redirect_to movies_path

    else
      render 'new'
    end
  end


  private


    def child_params
      params.require(:child).permit(:user_id, :role, :name, :state)
    end
end
