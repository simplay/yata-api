class TodosController < ApplicationController
  def index
    render json: sorted_todos, status: 200
  end

  def show
    todo = Todo.find(params[:id])
    if todo
      render json: todo, status: 200
    else
      render json: {}, staus: 404
    end
  end

  def create
    todo_params = params[:todo]
    todo = Todo.new(title: todo_params["title"])
    if todo.save!
      render json: sorted_todos, status: 200
    else
      render json: {}, staus: 404
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    if todo.destroy
      render json: sorted_todos, status: 200
    else
      render json: {}, staus: 400
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: sorted_todos, status: 200
    else
      render json: {}, staus: 400
    end
  end

  private

  def sorted_todos
    Todo.all.sort_by(&:created_at)
  end

  def todo_params
    params.require(:todo).permit(%i(title description))
  end
end
