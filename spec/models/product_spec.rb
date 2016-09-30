require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = Product.create!(name: "race bike")
      @user = User.create!(email: "carl@me.com", password: "hello123")
      @product.comments.create!(rating:1, user: @user, body: "Terrible bike!")
      @product.comments.create!(rating:3, user: @user, body: "Not bad, I guess")
      @product.comments.create!(rating:5, user: @user, body: "Awesome bike!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end
  
  end

  context "product has no name" do
    before do
      @product = Product.new(description:"Nice bike")
    end

    it "is invalid" do
      expect(@product).not_to be_valid
    end
  end

  context "product has no price" do
    before do
      @product = Product.new(description:"New bike")
    end

    it "is invalid" do
      expect(@product).not_to be_valid
    end
  end

  context "product has no color" do
    before do
      @product = Product.new(price:299)
    end

    it "is invalid" do
      expect(@product).not_to be_valid
    end
  end
end