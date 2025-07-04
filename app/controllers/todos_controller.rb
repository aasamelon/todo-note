# app/controllers/todos_controller.rb
class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:update, :destroy]

  def index
    @todos = current_user.todos.order(created_at: :desc)
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path, notice: "更新しました"
    else
      @todos = current_user.todos.order(created_at: :desc)
      flash.now[:alert] = "更新に失敗しました"
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path, notice: "削除しました"
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title)
  end
end
