require 'spec_helper'

describe "Authentication Pages" do
  
  subject { page }
   
  # sign in page tests
  describe "sign in page" do
  	before { visit signin_path }

  	it { should have_selector('h1', text: 'Sign in') }

  	describe "with invalid information" do
  		before { click_button "Sign in" }

  		it { should have_selector('title', text: 'Sign in') }
  		it { should have_selector('div.alert.alert-error', text: 'Invalid') }

  		describe "after visiting another page" do
  			before { click_link "Home" }
  			it { should_not have_selector('div.alert.alert-error') }
  		end
  	end

  	describe "with valid information" do
  		let(:user) { FactoryGirl.create(:user) }
  		before { sign_in user }
  		
  		it { should have_selector('title', text: user.name) }
      it { should have_link('Profile', href: user_path(user)) }
  		it { should have_link('Settings', href: edit_user_path(user)) }
  		it { should have_link('Sign out', href: signout_path) }
  		it { should_not have_link('Sign in', href: signin_path) }
  		
  		describe "after signing out" do
  			before { click_link "Sign out" }
  			it { should have_link('Sign in') }
        it { should_not have_link('Profile', href: user_path(user)) }
        it { should_not have_link('Settings', href: edit_user_path(user)) }
        it { should_not have_link('Sign out', href: signout_path) }
  		end
  	end
  end

  # authorization tests - admins, signed in, non-signed in
  describe "authorization" do

    describe "for non-signed in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "pages" do

        describe "visiting edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: 'Sign in') }
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
      end
    end

    describe "for wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, name: "Wrong Name", email: "wrong@example.com", phone: "999-999-9999") }
      before { sign_in user }

      describe "visiting edit page" do
        before { visit edit_user_path(wrong_user) }
        # specify { response.should redirect_to(root_path) }
        it { should_not have_selector('title', text: full_title(user.name)) }
      end

      describe "submitting PUT request to update" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end

  end
end
