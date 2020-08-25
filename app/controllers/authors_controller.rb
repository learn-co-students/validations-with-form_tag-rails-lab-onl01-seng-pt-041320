class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update]
  
  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    if @author.save
    redirect_to author_path(@author)
    else  
    @errors = @author.errors.full_messages
    render "new"
    end
  end

  def update
    if @author.update(author_params)
      redirect_to author_path(@author)
    else  
      @errors = @author.errors.full_messages
      render "edit"
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def set_author
    @author = Author.find(params[:id])
  end
end
