class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @todo = Todo.new
    @todos = current_user.todos.order(created_at: :desc)
  end

  def create_todo
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to root_path
    else
      @todos = current_user.todos.order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end
