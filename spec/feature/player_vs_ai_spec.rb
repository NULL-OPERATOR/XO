require_relative "feature_helper"

feature "human vs ai game mechanics: " do
  setup_game("[value='c,x,p,o']")

  scenario "game play the first move and display it" do
    # expect(find('#square-1')).to have_content('o')
  end

  scenario "computer begins, click to continue" do
    expect(page).to have_content('Continue')
    # expect(find('#square-0')).to have_content('x')
  end

  scenario "computers first move" do
    find('#continue-btn').click
    expect(page).not_to have_content('Continue')
    expect(find('#square-0')).to have_content('x')
  end

  scenario "computer can win" do
    [1,2].each do |i|
      find('#continue-btn').click
      find("#square-#{i}").click
    end
    find('#continue-btn').click
    expect(page).to have_content("GAME OVER")
    # expect(page).to have_content("COMPUTER X WINS")
  end

  scenario "computer draw" do
    # [4,2,6,5].each do |i|
    #   find('#continue-btn').click
    #   find("#square-#{i}").click
    # end
    # find('#continue-btn').click
    # expect(page).to have_content("GAME OVER")
    # expect(page).to have_content("COMPUTER X WINS")
  end
end
