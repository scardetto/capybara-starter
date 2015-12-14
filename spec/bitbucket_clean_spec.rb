feature 'logging into bitbucket.org (CLEAN)' do
  scenario 'take me to the dashboard when providing good credentials' do
    log_in_with good_user
    expect(page).to have_content 'Dashboard'
  end

  scenario 'display error when invalid credentials are provided' do
    log_in_with bad_user
    expect(page).to have_error 'Invalid username/email or password.'
  end
end
