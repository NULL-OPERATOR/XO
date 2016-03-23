require_relative "feature_helper"

feature "human vs ai game mechanics: " do
  setup_game("[value='computer,x,player,o']")

  scenario "computer begins, click to continue" do
    expect(page).to have_content('Continue')
  end

  scenario "computers first move" do
    expect(page).to have_content("COMPUTER - X - TURN")
    find('#continue-btn').click
    expect(page).not_to have_content('Continue')
    expect(find('#square-0')).to have_content('x')
  end

  scenario "computer can win" do
    [1,4].each do |i|
      find('#continue-btn').click
      find("#square-#{i}").click
    end
    find('#continue-btn').click
    expect(page).to have_content("GAME OVER")
    expect(page).to have_content("X WINS")
  end

  scenario "computer draw" do
    [4,2,3,8].each do |i|
      find('#continue-btn').click
      find("#square-#{i}").click
    end
    find('#continue-btn').click
    expect(page).to have_content("GAME OVER")
    expect(page).to have_content("DRAW")
  end
end
