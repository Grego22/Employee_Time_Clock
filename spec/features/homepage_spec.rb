require 'rails_helper'

describe 'Homepage' do
  it "allows the admin to approve posts from the Homepage" do
    post = FactoryBotRails.create(:post)
    admin_user = FactoryBotRails.create(:admin_user)
    login_as(admin_user, :scope => user)

    visit root_path

    click_on("approve#{post.id}")

    expect(post.reload.status).to eq('approved')
    approv

  end

end