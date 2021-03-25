class Api::V1::TodosController < ApplicationController

  before_action :find_todo, only: [:show, :update, :destroy]

  def index
    @todos = @current_user.todos.includes(:items)
  end

  def show
    json_response(@todo)
  end

  def create
    @todo = @current_user.todo.create!(todo_params)
    json_response(@todo, :created)
  end

  def update
    @todo.update(todo_params)
    head :no_content
  end


  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def find_todo
    @todo = @current_user.todos.find_by!(id: params[:id])
  end

end
