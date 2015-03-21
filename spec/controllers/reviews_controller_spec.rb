require 'spec_helper'

describe ReviewsController do
  describe "POST create" do
    context "user is signed in" do
      let(:alice) { create(:user) }
      let(:category) { create(:category) }
      let(:product) { create(:product, category: category) }

      before { sign_in alice }

      it "creates a new review" do
        post :create, product_id: product, category_id: category,
                      review: { content: "this is great product!", rating: 2 }
        expect(Review.count).to eq(1)
      end

      it "assigns review to currently signed in user" do
        post :create, product_id: product, category_id: category,
                      review: { content: "this is great product!", rating: 2 }
        expect(Review.first.user).to eq(alice)
      end

      it "redirects to category product url" do
        post :create, product_id: product, category_id: category,
                      review: { content: "this is great product!", rating: 2 }
        expect(response).to redirect_to category_product_url(product.category, product)
      end
    end

    context "user is not signed in" do
      let(:alice) { create(:user) }
      let(:category) { create(:category) }
      let(:product) { create(:product, category: category) }

      it "does not create a new review" do
        post :create, product_id: product, category_id: category,
                      review: { content: "this is great product!", rating: 2 }
        expect(Review.count).to eq(0)
      end
    end
  end

  describe "DELETE destroy" do
    context "review author is signed in" do
      let(:alice) { create(:user) }
      let(:category) { create(:category) }
      let(:product) { create(:product, category: category) }
      let(:review) { create(:review, user: alice, product: product) }

      before { sign_in alice }

      it "deletes review if user is the review owner" do
        delete :destroy, id: review.id, product_id: product.id, category_id: category.id
        expect(Review.count).to eq(0)
      end

      it "redirects to category product url" do
        delete :destroy, id: review.id, product_id: product.id, category_id: category.id
        expect(response).to redirect_to category_product_url(product.category, product)
      end
    end

    context "user is signed in but is not review author" do
      let(:alice) { create(:user) }
      let(:bob) { create(:user) }
      let(:category) { create(:category) }
      let(:product) { create(:product, category: category) }
      let(:review) { create(:review, user: bob, product: product) }

      before { sign_in alice }

      it "does not delete a review" do
        delete :destroy, id: review.id, product_id: product.id, category_id: category.id
        expect(Review.count).to eq(1)
      end

      it "flashes error message" do
        delete :destroy, id: review.id, product_id: product.id, category_id: category.id
        expect(flash[:error]).to be_present
      end
    end

    context "user is not signed in" do
      let(:alice) { create(:user) }
      let(:category) { create(:category) }
      let(:product) { create(:product, category: category) }
      let(:review) { create(:review, user: alice, product: product) }

      it "does not delete the review" do
        delete :destroy, id: review.id, product_id: product.id, category_id: category.id
        expect(Review.count).to eq(1)
      end
    end
  end
end
