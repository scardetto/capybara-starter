feature 'logging into bitbucket.org', :type => :feature do
  scenario 'take me to the dashboard when providing good credentials' do
    visit 'https://bitbucket.org/account/signin/'

    within('#log-in-container') do
      fill_in 'Username or email', with: ENV['USER_NAME']
      fill_in 'Password', with: ENV['PASSWORD']
    end

    click_button 'Log in'
    expect(page).to have_content 'Dashboard'
  end

  scenario 'display error when invalid credentials are provided' do
    visit 'https://bitbucket.org/account/signin/'

    within('#log-in-container') do
      fill_in 'Username or email', with: 'unknown'
      fill_in 'Password', with: 'unknown'
    end

    click_button 'Log in'
    expect(page).to have_css('div.error')
    expect(page).to have_content 'Invalid username/email or password.'
  end
end
