# frozen_string_literal: true

class TodoListComponent < ViewComponent::Base
  attr_reader :todos, :id, :title

  def initialize(id:, title:, todos: [])
    @todos = todos
    @id = id
    @title = title
  end
end


