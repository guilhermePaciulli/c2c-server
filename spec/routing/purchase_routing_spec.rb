require "rails_helper"

RSpec.describe PurchaseController, type: :routing do
  describe "routing" do

    it "routes to #buy" do
      expect(:post => "/buy/1").to route_to("purchase#buy", :id => '1')
    end

    it "routes to #index" do
      expect(:get => "/purchases").to route_to("purchase#index")
    end

    it "routes to #show" do
      expect(:get => "/purchases/1").to route_to("purchase#show", :id => '1')
    end

    it "routes to #index_sells" do
      expect(:get => "/sells").to route_to("purchase#index_sells")
    end

  end
end
