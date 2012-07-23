require 'spec_helper'

describe "Static Pages" do
  let(:base_title) { "Gooner.in - In Arsenal we trust." }
  subject { page }
  
  describe "Home Page" do
    before { visit root_path }
    
    it {should have_selector('title', text: full_title('')) }
  end
end
