require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence) }

   describe "GET index" do
     it "returns http success" do
       get :index
       expect(response).to have_http_status(:success)
     end

     it "assigns my_topic to @topics" do
       get :index
       expect(assigns(:topics)).to eq([my_topic])
     end
   end

   describe "GET show" do
     it "returns http success" do
       get :show, {id: my_topic.id}
       expect(response).to have_http_status(:success)
     end

     it "renders the #show view" do
       get :show, {id: my_topic.id}
       expect(response).to render_template :show
     end

     it "assigns my_topic to @topic" do
       get :show, {id: my_topic.id}
       expect(assigns(:topic)).to eq(my_topic)
     end
   end

   describe "GET new" do
     it "returns http success" do
       get :new
       expect(response).to have_http_status(:success)
     end

     it "renders the #new view" do
       get :new
       expect(response).to render_template :new
     end

     it "initializes @topic" do
       get :new
       expect(assigns(:topic)).not_to be_nil
     end
   end
end
