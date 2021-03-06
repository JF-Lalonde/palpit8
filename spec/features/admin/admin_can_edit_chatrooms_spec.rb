require 'rails_helper'

feature "Admin can edit games(chatrooms)" do
  scenario "Admin can edit games(chatrooms)" do
    admin = create(:user)
    admin_role = create(:role, name: "admin")
    admin.roles << admin_role
    game1 = create(:chatroom, topic: "game1")

    allow_any_instance_of(ApplicationController).to receive(:current_user)
    .and_return(admin)

    visit admin_chatrooms_path
    expect(page).to have_content(game1.topic)
    expect(page).to have_css(".chatroom", count: 1)
    click_on("Edit")
    fill_in("chatroom_topic", with: "Candy Crush")
    click_on("Update Chatroom")
    expect(current_path).to eq(admin_chatrooms_path)
    expect(page).to have_content("Candy Crush")
  end
end
