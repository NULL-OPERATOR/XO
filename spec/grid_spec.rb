require "spec_helper"
require_relative "../app/models/grid"

describe Grid do
  let(:grid)       { Grid }
  let(:whole_grid) { [0,1,2,3,4,5,6,7,8] }
  let(:corners)    { [0,2,6,8] }
  let(:edges)      { [1,3,5,7] }
  let(:center)     { 4 }

  it("should return the whole grid") do
    expect(grid.whole_grid).to eq(whole_grid)
  end

  it("should return a list of corners") do
    expect(grid.corners).to eq(corners)
  end

  it("should return a list of edges") do
    expect(grid.edges).to eq(edges)
  end

  it("should return a list of corners") do
    expect(grid.center).to eq(center)
  end
end
