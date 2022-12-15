require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate presence of name" do
    cat = Cat.create 
    expect(cat.errors[:name]).to_not be_empty
  end
  it "should validate presence of age" do
    cat = Cat.create 
    expect(cat.errors[:age]).to_not be_empty
  end
  it "should validate presence of enjoys" do
    cat = Cat.create 
    expect(cat.errors[:enjoys]).to_not be_empty
  end
  it "should validate presence of image" do
    cat = Cat.create 
    expect(cat.errors[:image]).to_not be_empty
  end
  it "should validate minimum length of enjoys" do
    cat = Cat.create name: "spot", age: 12, enjoys: "not h", image:"random" 
    expect(cat.errors[:enjoys]).to include "is too short (minimum is 10 characters)"
    expect(cat.errors[:enjoys]).to_not be_empty
    

  end
end
