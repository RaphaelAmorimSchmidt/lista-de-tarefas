class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @lists = current_user.lists | (List.where('visibility = true') - current_user.lists)
    else
      @lists = List.where('visibility = true')
    end
  end

  def show

  end

  def new
    @list = List.new
  end

  def create
    #binding.pry
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list)
    end
  end

  def edit

  end

  def update
    @list.update(list_params)
    redirect_to list(@list)
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
