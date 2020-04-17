require "rails_helper"

RSpec.describe PurchaseController, type: :routing do
  describe "routing" do

    it "routes to #buy" do
      expect(:post => "/buy/1").to route_to("purchase#buy", :id => '1')
    end

  end
end
