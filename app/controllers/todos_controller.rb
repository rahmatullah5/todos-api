class TodosController < ApplicationController
  before_action :set_todo, only: %i[show update destroy]

  def index
    render json: Todo.all, status: :ok
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo, status: :created
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @todo, status: :ok
  end

  def update
    if @todo.update(todo_params)
      render json: @todo, status: :ok
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
  end

  private

  def todo_params
    params.permit(:title)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
