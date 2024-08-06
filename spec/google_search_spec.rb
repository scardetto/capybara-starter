feature 'At duckduckgo.com' do
  scenario 'Perform a search' do
    visit 'https://duckduckgo.com'

    fill_in 'searchbox_input', with: "If you see this then it's working"
    sleep 10
  end
end
