require 'rails_helper'

describe "the edit a review process" do
  it "edits a review" do
    product = Product.create(:name => 'Banana', :cost => '3', :country_of_origin => 'USA')
    review = Review.create(:description => 'Tastes like naners', :rating => '3', :product_id => product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Description', :with => 'Wash the dog'
    click_on 'Update Review'
    expect(page).to have_content 'Wash the dog'
  end
end
