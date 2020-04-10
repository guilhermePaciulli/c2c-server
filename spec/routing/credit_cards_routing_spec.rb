require "rails_helper"

RSpec.describe CreditCardsController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/credit_card").to route_to("credit_cards#show")
    end

    it "routes to #create" do
      expect(:post => "/credit_card").to route_to("credit_cards#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/credit_card").to route_to("credit_cards#update")
    end

  end
end
