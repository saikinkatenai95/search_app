class ProductsController < ApplicationController

  before_action :search_product, only: [:index, :search]


  def index
    @products = Product.all #全商品の情報を取得
    set_product_column
    set_category_column
  end

  def search
    @results = @p.result.includes(:category) #検索条件にマッチした商品の情報を取得
  end

  private

  def search_product
    @p = Product.ransack(params[:q]) #検索オブジェクトを生成
  end

  def set_product_column
    @product_name = Product.select("name").distinct #重複なくnameカラムデータを取り出す
    @product_size = Product.select("size").distinct
    @product_status = Product.select("status").distinct
  end

  def set_category_column
    @category_name = Category.select("name").distinct
  end

end
