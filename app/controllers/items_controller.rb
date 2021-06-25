class ItemsController < ApplicationController
  before_action :set_todo
  before_action :set_item, only: %i[show update destroy]

  def index
    render json: @todo.items, status: :ok
  end

  def create
    item = @todo.items.new(item_params)
    if item.save
      render json: item, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @item, status: :ok
  end

  def update
    if @item.update(item_params)
      render json: @item, status: :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
  end

  private

  def item_params
    params.permit(:name, :done)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_item
    @item = @todo.items.find(params[:id])
  end
end
