class TodosController < ApplicationController
  def index
    @completed_todos = Todo.completed
    @incomplete_todos = Todo.incomplete
  end

  def update
    @todo = Todo.find(params[:id])
    
    respond_to do |format|
      if @todo.update(todo_params)
        format.turbo_stream
      end
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:completed)
  end
end

