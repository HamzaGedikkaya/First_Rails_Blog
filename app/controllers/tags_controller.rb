class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]


  def index
    @tags = Tag.all 
    @articles = Article.all
  end

  def show
    @tag = Tag.find(params[:id])
    @articles = @tag.articles
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_path
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

  def require_admin
    unless current_user.has_role?('admin')
      flash[:alert] = 'Bu işlem için yetkiniz yok.'
      redirect_to tags_path
    end
  end
end
