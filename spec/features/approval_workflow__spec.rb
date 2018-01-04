require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryBot.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

describe 'edit' do
  before do
    @post = FactoryBot.create(:post)
    visit edit_post_path(@post)
  end

    it 'has a status that can be edited on the form' do
     choose('post_status_approved')
     click_on "Save"

      expect(@post.reload.status).to eq('approved')
    end

    it 'can be edited by an admin' do
    end

    it 'cannot be edited by a non admin' do
      # whenever you put an x in front it will put a pending when running rspec
      # skips "temporarily skips with xit"
      logout(:user)
      user = FactoryBot.create(:user)
      login_as(@admin_user, :scope => :user)
      #got from capybara documentation

      visit edit_post_path(@post)

      expect(page).to_not have_content('Approved')
    end

    it 'should not be editable by the post creator if status is approved'
      logout(:user)
      user = FactoryBotRails.create(:user)
      login_as(user, :scope => :user)

      @post.update(user_id: user.id, status:'approved')

      expect(current_path). to eq(root_path)

    end

  end 
end
