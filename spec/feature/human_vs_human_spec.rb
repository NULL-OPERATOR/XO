require_relative "feature_helper"

feature "human vs human game mechanics: " do
  setup_game("[value='p,o,p,x']")

  scenario "new button redirects to game" do
    expect(current_path).to eq('/game')
  end

  scenario "game play the first move and display it" do
    find('#square-1').click
    expect(find('#square-1')).to have_content('o')
  end

  scenario "second player displays the move" do
    find('#square-1').click
    find('#square-0').click
    expect(find('#square-0')).to have_content('x')
  end

  scenario "winning" do
    win = [1,0,4,3,7]
    win.each{ |i| find("#square-#{i}").click }
    expect(page).to have_content("GAME OVER")
    expect(page).to have_content("O WINS")
  end

  scenario "draw" do
    draw = [0,1,2,4,3,5,7,6,8]
    draw.each{ |i| find("#square-#{i}").click }
    expect(page).to have_content("DRAW")
  end

end
