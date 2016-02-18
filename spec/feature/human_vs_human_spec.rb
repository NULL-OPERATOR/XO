feature "human vs human game mechanics" do
  before(:each) do
    visit '/'
    find('#select-mode').find("option[value='p,o,p,x']").select_option
    click_button('NEW')
    expect(current_path).to eq('/game')
    find('#square-1').click
  end

  scenario "game play the first move and display it" do
    expect(find('#square-1')).to have_content('o')
  end

  scenario "second player displays the move" do
    find('#square-0').click
    expect(find('#square-0')).to have_content('x')
  end
end
