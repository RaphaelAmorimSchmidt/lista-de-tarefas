class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @list = List.all
  end

  def show

  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    redirect_to list(@list)
  end

  def edit

  end

  def update
    @list.update(list_params)
    redirect_to list(@list)
  end

  def destroy
    @list.destroy
    redirect_to root
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :public)
  end
end
