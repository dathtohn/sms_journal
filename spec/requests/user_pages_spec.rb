require 'spec_helper'

describe "User pages" do

  subject { page }

  # signup page tests
  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign-Up') }
    # it { should have_selector('title', text: 'Sign-Up') }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
    	it "should not create a user" do
    		expect { click_button submit }.not_to change(User, :count)
    	end

    	describe "after submission" do
        before { click_button submit }

        # it { should have_selector('title', text: 'Sign-Up') }
        it { should have_content('error') }

        # error messages tests
      end
    end

    # issue with twilio
    describe "with valid information" do
    	before do
    		fill_in "Name",								with: "Example User"
    		fill_in "Email",							with: "user@example.com"
    		fill_in "Phone",							with: "123-456-7890"
    		fill_in "Password",						with: "foobar"
    		fill_in "Re-enter Password",	with: "foobar"
    	end

    	it "should create a user" do
    		expect { click_button submit }.to change(User, :count).by(1)
    	end

    	describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

        # it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Thank you') }
        it { should have_link('Sign out') }
      end
    end
  end

  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }

		it { should have_selector('h1',    text: user.name) }
		# it { should have_selector('title', text: user.name) }
	end
end