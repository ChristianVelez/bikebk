require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    #@user = User.create!(first_name:"maria", last_name: "rueda", email: "mom@example.com", password: "hello123")
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user, email: "user@example.com")
    @user3 = FactoryGirl.create(:user, email: "user2@example.com")
    @user4 = FactoryGirl.create(:user, email: "user3@example.com")
    @user5 = FactoryGirl.create(:user, email: "user4@example.com")
    #@user2 = FactoryGirl.create(:user)
    #@user3 = FactoryGirl.create(:user)
    #@user4 = FactoryGirl.create(:user)
    #@user5 = FactoryGirl.create(:user)
    #@user2 = User.create!(first_name:"oscar", last_name: "velez", email: "dad@example.com", password: "hello456")
    #@user3 = User.create!(first_name:"karla", last_name: "velez", email: "sister@example.com", password: "hello789")
    #@user4 = User.create!(first_name:"paula", last_name: "carreno", email: "niece@example.com", password: "hello111")
    #@user5 = User.create!(first_name:"alejandra", last_name: "carreno", email: "niece2@example.com", password: "hello222")
  end
  
  describe "GET #show" do
     context "User is logged in" do 

       before do
         sign_in @user
       end

       it "loads the correct user details" do
         get :show, id: @user.id
         expect(response.status).to eq 200
         expect(assigns(:user)).to eq @user
       end

       it "does not load second user details" do
         get :show, id: @user2.id
         expect(response.status).to eq 302
         expect(response).to redirect_to(root_path)
       end

       it "does not load second user details" do
         get :show, id: @user3.id
         expect(response.status).to eq 302
         expect(response).to redirect_to(root_path)
       end

       it "does not load second user details" do
         get :show, id: @user4.id
         expect(response.status).to eq 302
         expect(response).to redirect_to(root_path)
       end

       it "does not load second user details" do
         get :show, id: @user5.id
         expect(response.status).to eq 302
         expect(response).to redirect_to(root_path)
       end
    end

    context 'No user is logged in' do
       it 'redirects to login' do
         get :show, id: @user.id
         expect(response).to redirect_to(new_user_session_path)
       end
    end   
  end

end