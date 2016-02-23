def setup_game(mode)
  before(:each) do
    visit '/'
    find('#select-mode').find("option#{mode}").select_option
    click_button('NEW')
  end
end
