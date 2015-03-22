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
end
