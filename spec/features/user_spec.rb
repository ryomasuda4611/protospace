require 'rails_helper'
feature 'user', type: :feature do
  given(:prototype){ build(:prototype) }
  given(:user){ build(:user) }
  given(:logined_user){ create(:user) }

 def sign_up
    visit root_path
    click_on 'Get Started'
    click_on 'Sign up now'
    fill_in 'Username', with: user.username
    fill_in 'E-Mail', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Save'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  def sign_in
    visit root_path
    click_on 'Get Started'
    fill_in 'Email address', with: logined_user.email
    fill_in 'Password', with: logined_user.password
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
    end

  def post_prototype
    visit root_path
    click_on 'Get Started'
    fill_in 'Email address', with: logined_user.email
    fill_in 'Password', with: logined_user.password
    click_on 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
    click_on 'New Proto'
    fill_in 'Title', with: prototype.title
    5.times do |i|
      attach_file "prototype[prototype_images_attributes][#{i}][image]", "#{Rails.root}/spec/fixtures/image/test.jpg", visible: false
      # "prototype[prototype_images_attributes][#{i}][image]"はブラウザ上でuserの視覚的には確認できないelementなのでCapybaraも認識できなかった！　解決方法visible: falseを適用する。  本当に大切なものは目にみえない。
    end
    fill_in 'Catch Copy', with: prototype.catch_copy
    fill_in 'Concept', with: prototype.concept
    click_on 'Post!'
    expect(page).to have_content 'Prototype was successfully created'
  end

  scenario 'sign_up' do
    sign_up
  end

  scenario 'sign_in' do
    sign_in
  end

  scenario 'post_prototype' do
    post_prototype
  end
end
