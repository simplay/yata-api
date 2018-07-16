class TodosController < ApplicationController
  def index
    render json: sorted_todos, status: 200
  end

  def incomplete
    render json: sorted_todos.select(&:incomplete?), status: 200
  end

  def completed
    render json: sorted_todos.select(&:done?), status: 200
  end

  def show
    todo = current_user.todos.find(params[:id])
    if todo
      render json: todo, status: 200
    else
      render json: {}, staus: 404
    end
  end

  def create
    if current_user.todos.create!(todo_params)
      render json: filtered_todos, status: 200
    else
      render json: {}, staus: 404
    end
  end

  def destroy
    todo = current_user.todos.find(params[:id])
    if todo.destroy
      render json: sorted_todos, status: 200
    else
      render json: {}, staus: 400
    end
  end

  def update
    todo = current_user.todos.find(params[:id])
    if todo.update(todo_params)

      render json: filtered_todos, status: 200
    else
      render json: {}, staus: 400
    end
  end

  private

  def filtered_todos
    case params[:filter]
    when 'completed'
      sorted_todos.select(&:done?)
    when 'incomplete'
      sorted_todos.select(&:incomplete?)
    else
      sorted_todos
    end
  end

  def sorted_todos
    current_user.todos.sort_by(&:created_at)
  end

  def todo_params
    params.require(:todo).permit(%i(title description status))
  end
end
