require 'rails_helper'
RSpec.describe SecretsController, type: :controller do
  before do
    @user = create_user
  end

  describe "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot like" do
      get :likes
      expect(response).to redirect_to('/sessions/new')
    end
    it "cannot unlike" do
      get :unlike
      expect(response).to redirect_to('/sessions/new')
    end
  end


  describe "when signed in as the wrong user" do
    before do
      @user = create_user
      log_in @user
      @wrong_user = create_user 'julius', 'julius@lakers.com'
      session[:user_id] = @wrong_user
      @secret = @user.secrets.create(content: 'Ooops')
    end

    it "cannot access like" do
      get :likes
      expect(response).to redirect_to('/sessions/new')
    end

    it "cannot access unlike" do
      get :likes
      expect(response).to redirect_to('/sessions/new')
    end

      end
end