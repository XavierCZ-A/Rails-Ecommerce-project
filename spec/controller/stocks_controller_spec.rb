require 'rails_helper'

RSpec.describe Seller::StocksController, type: :controller do
  let(:user) { User.create(email: "test@example.com", password: "password123") }
  let!(:category) { Category.create(name: "Test Category", description: 'Test Description') }
  let!(:product) { Product.create(title: "Test Product", description: "Test description", price: 10, category: category) }
  let!(:stock) { Stock.create(quantity: 5, product: product) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create stock" do
    context "when creating a new stock with valid attributes" do
      it 'should create a new stock' do
        expect {
          post :create, params: {
            stock: {
              quantity: 1,
              product_id: product.id
            }
          }
        }.to change(Stock, :count).by(1)
        stock = Stock.last
        expect(response).to redirect_to(stock_url(stock))
      end
    end

    context "when creating a new stock with invalid attributes" do
      it 'does not create a new stock ' do
        expect {
          post :create, params: {
            stock: {
              quantity: -5,
              product_id: product.id
            }
          }
        }.to_not change(Stock, :count)
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it 'deletes stock' do
      expect {
        delete :destroy, params: { id: stock.id }
      }.to change(Stock, :count).by(-1)

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(stocks_url)
      expect(Stock.exists?(stock.id)).to be_falsey
    end
  end

end