class EmailsController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @emails = pagy(Email.all, items: 10)
    @count = Email.count
  end
end
