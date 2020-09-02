class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.valid?
      @author.save

      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
    @author = Author.find_by_id(params[:id])
  end

  def update
    @author = Author.find_by_id(params[:id])

    @author.update(params.require(:author).permit(author_params))
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end