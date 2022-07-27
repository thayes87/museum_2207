require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
  it 'exists' do
    dmns = Museum.new("Denver Museum of Nature and Science")

    expect(dmns).to be_instance_of(Museum)
    expect(dmns.name).to eq("Denver Museum of Nature and Science") 
  end

  xit 'can add exhibits to the museum exhibit list'
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})

    expect(dmns.exhibits).to eq([])

    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    
    expect(dmns.exhibits).to be_a(Array)
    expect(dmns.exhibits.count).to eq(3)
    expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
  end

  xit 'can recommend exhibits based on patron interests'
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})

    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")

    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interest("IMAX")

    dmns.recommend_exhibits(patron_1)
    dmns.recommend_exhibits(patron_2)

    expect(dmns.recommend_exhibits(patron_1)).to be_a(Array)
    expect(dmns.recommend_exhibits(patron_1).count).to eq(2)
    expect(dmns.recommend_exhibits(patron_1)).to eq(["Dead Sea Scrolls", "Gems and Minerals" ])

    expect(dmns.recommend_exhibits(patron_2)).to be_a(Array)
    expect(dmns.recommend_exhibits(patron_2).count).to eq(1)
    expect(dmns.recommend_exhibits(patron_2)).to eq(["IMAX"])
end