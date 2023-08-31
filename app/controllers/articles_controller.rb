class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy, :show]
  before_action :require_author_or_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :inactive, only: [:inactive]


  #! INDEX AND SHOW ARTICLE
  def index
    @articles = Article.where(active: true)
      
    @q = @articles.ransack(params[:q])
    
    if
      params[:q].present? && params[:q][:title_or_content_cont].length > 0 && params[:q][:title_or_content_cont].length < 5
      flash.now[:alert] = "5 karakterden az yazamazsın!"
    elsif
      params[:q].present? && params[:q][:title_or_content_cont].blank?
      flash.now[:alert] = "Hiç karakter girmediniz!"
    else
      @articles = @q.result(distinct: true).order(:title).to_a
    end    
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end



  #! CREATE NEW ARTICLE
  def new
    @article = Article.new
  end

  def create

    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def inactive
    @articles = Article.where(active: false)
    unless current_user&.has_any_role?(:admin, :editor)
      flash[:alert] = 'Bu işlem için yetkiniz yok.'
      redirect_to root_path
    end
  end

  def activate
    @article = Article.find(params[:id])
    @article.update(active: true)
    redirect_to inactive_articles_path, notice: 'Makale başarıyla aktifleştirildi.'
  end
  
  #! EDIT AND UPDATE ARTICLE
  def edit
  end

  def update
    @article.update(article_params)

    redirect_to article_path(@article)
  end



  #! DELETE ARTICLE
  def destroy
    @article.destroy

    redirect_to articles_path
  end

  private


  #! ROL
  private

  def require_author_or_admin
    unless current_user.has_role?('author') || current_user.has_role?('admin')
      flash[:alert] = 'Bu işlem için yetkiniz yok.'
      redirect_to root_path
    end
  end

  
  def article_params
    params.require(:article).permit(:title, :content, :avatar)
  end

  
  def set_article
    @article = Article.find(params[:id])
  end

end