require "spec_helper"
require_relative "../app/models/grid"

describe Grid do
  let(:grid)       { Grid }
  let(:whole_grid) { [1,2,3,4,5,6,7,8,9] }
  let(:corners)    { [1,3,7,9] }
  let(:edges)      { [2,4,6,8] }
  let(:center)     { [5] }

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
