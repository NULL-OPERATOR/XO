require "grid_setup"

describe GridSetup do
  let(:setup) { GridSetup }

  it("should return a list of corners") do
    expect(setup.corners).to eq([1,3,7,9])
  end

  it("should return a list of edges") do
    expect(setup.edges).to eq([2,4,6,8])
  end

  it("should return a list of corners") do
    expect(setup.center).to eq([5])
  end
