require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Product do
  it "should be valid with sane attributes" do
    Factory.build(:product).should be_valid
  end
  
  it "should not be valid without title" do
    Factory.build(:product, :title => nil).should_not be_valid
  end
  
  it "should not be valid without price" do
    Factory.build(:product, :price => nil).should_not be_valid
  end
  
  it "should not be valid with negative price" do
    Factory.build(:product, :price => "-1.99").should_not be_valid
  end
end
