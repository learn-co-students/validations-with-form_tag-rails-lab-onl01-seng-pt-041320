class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)

    @author.save ? redirect_to(author_path(@author)) : render(:new)
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
