# frozen_string_literal: true

class TodoComponent < ViewComponent::Base
  attr_reader :todo

  def initialize(todo:)
    @todo = todo
  end

  def div_id
    "#{todo.completed? ? 'completed' : 'incomplete'}_#{dom_id(todo)}"
  end
end


