require 'spec_helper'

describe "players/index" do
  before(:each) do
    assign(:players, [
      stub_model(Player,
        :name => "Name",
        :e_name => "E Name",
        :nationality => "Nationality",
        :day_of_birth => "",
        :position => "Position"
      ),
      stub_model(Player,
        :name => "Name",
        :e_name => "E Name",
        :nationality => "Nationality",
        :day_of_birth => "",
        :position => "Position"
      )
    ])
  end

  it "renders a list of players" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "E Name".to_s, :count => 2
    assert_select "tr>td", :text => "Nationality".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Position".to_s, :count => 2
  end
end
