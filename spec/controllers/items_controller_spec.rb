require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:my_topic){ Topic.create!(name: "Name") }
  let(:my_item){ my_topic.items.create!(name: RandomData.random_sentence, description: RandomData.random_sentence, brand: RandomData.random_sentence) }

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_item.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_item.id
      expect(response).to render_template :show
    end

    it "assigns my_item to @item" do
      get :show, topic_id: my_topic.id, id: my_item.id
      expect(assigns(:item)).to eq(my_item)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "instantiates @item" do
      get :new, topic_id: my_topic.id
      expect(assigns(:item)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of items by 1" do
      expect{post :create, topic_id: my_topic.id, item: {name: RandomData.random_sentence, description: RandomData.random_sentence, brand: RandomData.random_sentence}}.to change(Item,:count).by(1)
    end

    it "assigns the new item by @item" do
      post :create, topic_id: my_topic.id, item: {name: RandomData.random_sentence, description: RandomData.random_sentence, brand: RandomData.random_sentence}
      expect(assigns(:item)).to eq(Item.last)
    end

    it "redirects to the new item" do
      post :create, topic_id: my_topic.id, item: {name: RandomData.random_sentence, description: RandomData.random_sentence, brand: RandomData.random_sentence}
      expect(response).to redirect_to(Item.last)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_item.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, topic_id: my_topic.id, id: my_item.id
      expect(response).to render_template(:edit)
    end

    it "assigns item to be updated to @item" do
      get :edit, topic_id: my_topic.id, id: my_item.id

      item_instance = assigns(:item)

      expect(item_instance.id).to eq(my_item.id)
      expect(item_instance.name).to eq(my_item.name)
      expect(item_instance.description).to eq(my_item.description)
      expect(item_instance.brand).to eq(my_item.brand)
    end
  end

  describe "POST update" do
    it "updates the item with expected attributes" do
      new_name = "Name"
      new_description = "Description"
      new_brand = "Brand"

      put :update, id: my_item.id, item: {name: new_name, description: new_description, brand: new_brand}

      updated_item = assigns(:item)
      expect(updated_item.id).to eq(my_item.id)
      expect(updated_item.name).to eq(new_name)
      expect(updated_item.description).to eq(new_description)
      expect(updated_item.brand).to eq(new_brand)
    end

    it "redirects the page to @item" do
      put :update, id: my_item.id, item: {name: "Name", description: "Description", brand: "Brand"}
      expect(response).to redirect_to(my_item)
    end
  end

  describe "DELETE destroy" do
     it "deletes the post" do
       delete :destroy, topic_id: my_topic.id, id: my_item.id
 # #6
       count = Item.where({id: my_item.id}).size
       expect(count).to eq 0
     end

     it "redirects to posts index" do
       delete :destroy, topic_id: my_topic.id, id: my_item.id
       expect(response).to redirect_to my_topic
     end
   end
end
