class TodosController < ApplicationController
  def index
    todos = Todo.all
    render json: todos, status: 200
  end

  def show
    todo = Todo.find(params[:id])
    if todo
      render json: todo, status: 200
    else
      render json: {}, staus: 404
    end
  end
end
