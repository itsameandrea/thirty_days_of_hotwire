class CommandsController < ApplicationController
  def index
    @commands = Command.search(params)
  end
end
