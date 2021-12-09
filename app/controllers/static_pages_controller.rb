class StaticPagesController < ApplicationController
  def home
    @pagy, @products = pagy(Product.all, items: 5)
    @categories = Category.all
    filtering_params(params).each do |key, value|
      if value.present?
        @products = @products.public_send("filter_by_#{key}", value)
      end
    end
  end

  def help; end

  private

  def filtering_params params
    params.slice(:category, :price, :rate, :name)
  end
end
