class ItemsController < ApplicationController
	before_action :find_todo
  before_action :find_item , only: [:show, :update, :destroy]

	def index
    @items = @todo.items
    json_response(@items)
	end

	def create
    @item = @todo.items.create!(items_params)
    unless @item
      raise ActiveRecord::RecordInvalid
    else
      json_response(@item, :created)
    end
	end

	def show
    json_response(@item)
	end

	def update
    unless @item.update_attributes(items_params)
      raise ActiveRecord::RecordInvalid
    else
      head :no_content
    end
	end

	def destroy
    @item.destroy
    head :no_content
	end

	private

  def items_params
    params.permit(:name, :done)
  end

  def find_todo
    @todo = Todo.find_by!(id: params[:todo_id])
  end

  def find_item
    @item = @todo.items.find_by!(id: params[:id])
  end

end
