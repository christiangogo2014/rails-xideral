require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      name: "Name",
      description: "Description",
      price: 2.5,
      remote_url: "Remote Url",
      stripe_price_id: "Stripe Price"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Remote Url/)
    expect(rendered).to match(/Stripe Price/)
  end
end
