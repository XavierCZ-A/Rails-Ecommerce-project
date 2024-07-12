require 'rails_helper'

RSpec.describe Seller::ProductsController, type: :controller do
  let(:user) { User.create(email: "test@example.com", password: "password123") }
  # category = Category.create(name: "Clothing", description: 'Man and Woman')
  let!(:category) { Category.create(name: "Test Category", description: 'Test Description') }
  let!(:product) { Product.create(title: "Test Product", description: "Test description", price: 10, category_id: category) }

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
    context do
      it "creates a new product" do
        post :create, params: {
          product: {
            title: "New Product",
            description: "New Product Description",
            price: 10,
            category_id: category
          } }
        expect(response).to redirect_to(product_url(Product.last))
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
              } }
        }.to_not change(Product, :count)
      end
    end
  end

  # describe "DELETE #destroy" do
  #   context 'when deleting a product' do
  #     it 'deletes the product' do
  #       expect {
  #         delete :destroy, params: { id: product.id }
  #       }.to change(Product, :count).by(-1)
  #     end
  #   end
  # end
end


