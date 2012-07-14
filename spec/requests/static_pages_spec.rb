require 'spec_helper'

describe "Static Pages" do
  describe "Home Page" do
    it "should have the content 'Gooner.in'" do
      visit '/'
      page.should have_content('Gooner.in')
    end
  end
end
