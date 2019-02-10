require 'monster_scraper'

describe 'MonsterScraper' do

  before(:all) do
    mockurl = "file://#{Dir.pwd}/spec/mockHTML.html" # Dir.pwd is the local directory address on the project
    @monster_scraper = MonsterScraper.new(mockurl)
  end

  it 'contains MonsterScraper Class' do
    expect(@monster_scraper).to be_a MonsterScraper
  end

  describe '#return_monsters' do
    it 'returns an array of hashes with monster names' do
      expect(@monster_scraper.return_monsters).to eq([{ name: "Aboleth" }, { name: "Dragon" }, { name: "Zombie" }])
    end
  end

end
