require 'rails_helper'

RSpec.describe Item, type: :model do
   let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_sentence }
   let(:brand) { RandomData.random_sentence }

   let(:topic) { Topic.create!(name: name) }
   let(:post) { topic.posts.create!(name: title, description: description, brand: brand) }

   it { is_expected.to belong_to(:topic) }

   describe "attributes" do
     it "has a title and body attribute" do
       expect(item).to have_attributes(name: title, description: description, brand: brand)
     end
   end
end
