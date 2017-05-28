class ChildrenController < ApplicationController

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    redirect_to movies_path
  end

  def new
    @child = Child.new
  end

  def sign_in
    Child.all.each do |c|
      c.state = false
    end
    current_user.children.find_by(name: params[:child]).state = true
    @child = current_user.children.find_by(name: params[:child])
    return @child
    
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
