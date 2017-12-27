require 'rails_helper'

describe 'navigate' do
    before do
        @admin_user = FactoryBot.create(:admin_user)
        login_as(@admin_user, :scope => :user)
    end

describe 'edit' do
    before do
        @post = FactoryBot.create(:post)
    end

    it 'has a status that can be edited on the form' do
        visit edit_post_path(@post)

        choose('post_status_approved')
        click_on "Save"
        expect(@post.reload.status).to eq('approved')
    end

    it 'cand be edited by an admin' do
    end

    xit 'cannot be edited by a non admin' do
    ## whenever you put an x in front it will put a pending when running rspec    
    end
  end 
end
