require 'spec_helper'

describe "players/show" do
  before(:each) do
    @player = assign(:player, stub_model(Player,
      :name => "Name",
      :e_name => "E Name",
      :nationality => "Nationality",
      :day_of_birth => "",
      :position => "Position"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/E Name/)
    rendered.should match(/Nationality/)
    rendered.should match(//)
    rendered.should match(/Position/)
  end
end
