require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        name: "Name",
        description: "Description",
        price: 2.5,
        remote_url: "Remote Url",
        stripe_price_id: "Stripe Price"
      ),
      Product.create!(
        name: "Name",
        description: "Description",
        price: 2.5,
        remote_url: "Remote Url",
        stripe_price_id: "Stripe Price"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: "Remote Url".to_s, count: 2
    assert_select "tr>td", text: "Stripe Price".to_s, count: 2
  end
end
