require 'rails_helper'

RSpec.describe Seller::ProductsController, type: :controller do
  let(:user) { User.create(email: "test@example.com", password: "password123") }
  let!(:category) { Category.create(name: "Test Category", description: 'Test Description') }
  let!(:product) { Product.create(title: "Test Product", description: "Test description", price: 10, category: category) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create product" do
    context "when creating a new product with valid attributes" do
      it "creates a new product" do
        expect {
          post :create, params: {
            product: {
              title: "New Product",
              description: "New Product Description",
              price: 10,
              category_id: category.id
            }
          }
        }.to change(Product, :count).by(1)
        product = Product.last
        expect(response).to redirect_to(product_url(product))
      end
    end

    context "with invalid attributes" do
      it "does not create a new product" do
        expect {
          post :create, params: {
            product:
              {
                title: nil,
                description: "New Product Description",
                price: nil,
                category_id: category
              }
          }
        }.to_not change(Product, :count)
      end
    end
  end

  describe "DELETE #destroy" do
    it 'deletes the product' do
      expect {
        delete :destroy, params: { id: product.id }
      }.to change(Product, :count).by(-1)

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to(products_url)
      expect(Product.exists?(product.id)).to be_falsey
    end
  end

  describe "PUT #update product" do
    context 'when updating a product' do
      it 'updates the product with the new attributes' do
        new_title = 'New title update'
        new_price = 20
        patch :update, params: {
          id: product.id,
          product: {
            title: new_title,
            price: new_price
          }
        }
        product.reload
        expect(product.title).to eq(new_title)
        expect(product.price).to eq(new_price)
      end

      it 'responds with a success status' do
        patch :update, params: {
          id: product.id,
          product: {
            title: 'New title update',
            price: 20
          }
        }
        expect(response).to have_http_status(:found) # 302
        expect(response).to redirect_to(product_path(product))
      end
    end
  end

end


