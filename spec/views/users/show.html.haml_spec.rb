require 'spec_helper'

describe "users/show.html.haml" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :phone_number => "Phone Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone Number/)
  end
end
