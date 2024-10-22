class FindProductsSellers
  attr_reader :products, :current_user

  def initialize(current_user, products = nil)
    @current_user = current_user
    @products = products || initial_scope
  end

  def call_params(params = {})
    scope = products
    scope = filter_by_category_id(scope, params[:category_id])
    scope = filter_by_min_price(scope, params[:min_price])
    scope = filter_by_max_price(scope, params[:max_price])
    scope = filter_by_query_text(scope, params[:query_text])
    scope = sort(scope, params[:order_by])
    # scope = filter_by_user_id(scope, params[:user_id])
    # scope = filter_by_favorites(scope, params[:favorites])
  end

  private

  def initial_scope
    current_user.products
  end

  def filter_by_category_id(scope, category_id)
    return scope unless category_id.present?

    scope.where(category_id: category_id)
  end

  def filter_by_min_price(scope, min_price)
    return scope unless min_price.present?

    scope.where("price >= ?", min_price)
  end

  def filter_by_max_price(scope, max_price)
    return scope unless max_price.present?

    scope.where("price <= ?", max_price)
  end

  def filter_by_query_text(scope, query_text)
    return scope unless query_text.present?

    scope.search_full_text(query_text)
  end

  # def filter_by_user_id(scope, user_id)
  #   return scope unless user_id.present?
  #
  #   scope.where(user_id: user_id)
  # end
  #
  # def filter_by_favorites(scope, favorites)
  #   return scope unless favorites.present?
  #
  #   scope.joins(:favorites).where({ favorites: { user_id: Current.user.id } })
  #
  # end

  def sort(scope, order_by)
    order_query = Product::ORDER_BY.fetch(order_by&.to_sym, Product::ORDER_BY[:newest])

    scope.order(order_query)
  end

end
