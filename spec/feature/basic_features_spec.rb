feature "basic setup" do
  before(:each) do
    visit '/'
  end

  scenario "index page" do
    expect(page.status_code).to eq(200)
    expect(page).to have_title "XO"
  end

  scenario "redirects if game hasn't started" do
    visit '/game'
    expect(current_path).to eq('/')
  end

  scenario "can select a mode and start a game" do
    find('#select-mode').find("option[value='p,o,p,x']").select_option
    click_button('NEW')
    expect(current_path).to eq('/game')
  end
end
