feature 'logging into bitbucket.org' do
  scenario 'take me to the dashboard when providing good credentials' do
    visit 'https://bitbucket.org/account/signin/'

    within('#aid-login-form') do
      fill_in 'Email', with: ENV['USER_NAME']
      fill_in 'Password', with: ENV['PASSWORD']
    end

    click_button 'Log in'
    expect(page).to have_content 'Dashboard'
  end

  scenario 'display error when invalid credentials are provided' do
    visit 'https://bitbucket.org/account/signin/'

    within('#aid-login-form') do
      fill_in 'Email', with: 'unknown'
      fill_in 'Password', with: 'unknown'
    end
    
    click_button 'Log in'
    expect(page).to have_css('div#js-global-login-error-container')
    expect(page).to have_content 'The email address or password you entered is incorrect.'
  end
end
