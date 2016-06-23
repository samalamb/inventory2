require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:name) { RandomData.random_sentence }

   let(:topic) { Topic.create!(name: name) }

   it{ is_expected.to have_many(:items) }
   
   describe "attributes" do
     it "has name, description, and public attributes" do
       expect(topic).to have_attributes(name: name)
     end
   end
end
