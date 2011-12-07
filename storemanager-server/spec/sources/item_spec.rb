require File.join(File.dirname(__FILE__),'..','spec_helper')

describe "Item" do
  it_should_behave_like "SpecHelper" do
    before(:each) do
      setup_test_for Item,'testuser'
    end

    it "should process Item query" do
      pending
    end

    it "should process Item create" do
      pending
    end

    it "should process Item update" do
      pending
    end

    it "should process Item delete" do
      pending
    end
  end  
end