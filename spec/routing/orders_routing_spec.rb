require "rails_helper"

RSpec.describe Seller::OrdersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/sellers/orders").to route_to("sellers/orders#index")
    end

    it "routes to #new" do
      expect(get: "/sellers/orders/new").to route_to("sellers/orders#new")
    end

    it "routes to #show" do
      expect(get: "/sellers/orders/1").to route_to("sellers/orders#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/sellers/orders/1/edit").to route_to("sellers/orders#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/sellers/orders").to route_to("sellers/orders#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/sellers/orders/1").to route_to("sellers/orders#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/sellers/orders/1").to route_to("sellers/orders#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/sellers/orders/1").to route_to("sellers/orders#destroy", id: "1")
    end
  end
end
