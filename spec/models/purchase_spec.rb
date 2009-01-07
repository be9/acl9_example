require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Purchase do
  it "should be valid with sane attributes" do
    Factory.build(:purchase).should be_valid
  end
  
  it "should not be valid without title" do
    Factory.build(:purchase, :product => nil).should_not be_valid
  end
  
  it "should not be valid without price" do
    Factory.build(:purchase, :total_price => nil).should_not be_valid
  end
  
  it "should not be valid without amount" do
    Factory.build(:purchase, :amount => nil).should_not be_valid
  end

  it "should not be valid with negative price" do
    Factory.build(:purchase, :total_price => "-1.99").should_not be_valid
  end
  
  [0,-1].each do |amount|
    it "should not be valid with amount #{amount}" do
      Factory.build(:purchase, :amount => amount).should_not be_valid
    end
  end
end
