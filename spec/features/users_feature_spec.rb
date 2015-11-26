require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'password')
      fill_in('Password confirmation', with: 'password')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

  context "editing restaurants" do
    it "is only possible for the author" do
      signup_add_restaurant_and_signout
      signup("test2@example.com")
      visit '/restaurants'
      expect(page).not_to have_link('Edit KFC')
    end
  end

  context "deleting restaurants" do
    it "is only possible for the author" do
      signup_add_restaurant_and_signout
      signup("test2@example.com")
      # visit '/restaurants'
      expect(page).not_to have_link('Delete KFC')
    end
  end

  context "deleting reviews" do
    it "is possible" do
      signup_add_restaurant_and_signout
      signin
      review
      click_link 'Delete KFC review'
      expect(page).not_to have_content 'so so'
    end

    it "is only possible by the author of the review" do
      signup_add_restaurant_and_signout
      signin
      review
      click_link('Sign out')
      signup("test4@example.com")
      expect(page).not_to have_link 'Delete KFC review'
    end
  end
end
