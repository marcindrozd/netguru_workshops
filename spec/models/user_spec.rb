require 'spec_helper'

describe User do
  it { should validate_presence_of :firstname }
  it { should validate_presence_of :lastname }

  it "by default isn't admin" do
    expect(User.new).to_not be_admin
  end

  describe "#is_product_owner?" do
    let(:alice) { create(:user) }
    let(:bob) { create(:user) }
    let(:category) { create(:category) }
    let(:product) { create(:product, category_id: category.id, user_id: alice.id) }

    it "returns true if current user is product creator" do
      expect(alice.is_product_owner?(product)).to be_truthy
    end

    it "returns false if current user is not product creator" do
      expect(bob.is_product_owner?(product)).to be_falsey
    end
  end

  describe "#recent_reviews" do
    let(:alice) { create(:user) }

    it "returns empty array if user has no reviews" do
      expect(alice.recent_reviews).to eq([])
    end

    it "returns a review if user has 1 review" do
      review = create(:review, user: alice)
      expect(alice.recent_reviews).to eq([review])
    end

    it "returns all reviews if user has 5 reviews" do
      5.times { create(:review, user: alice) }
      expect(alice.recent_reviews.count).to eq(5)
    end

    it "returns max 5 reviews from newest to oldest if user has more than 5 reviews" do
      review1 = create(:review, user: alice)
      review2 = create(:review, user: alice)
      review3 = create(:review, user: alice)
      review4 = create(:review, user: alice)
      review5 = create(:review, user: alice)
      review6 = create(:review, user: alice, created_at: 2.days.ago)
      expect(alice.recent_reviews).to eq([review5, review4, review3, review2, review1])
    end
  end
end
