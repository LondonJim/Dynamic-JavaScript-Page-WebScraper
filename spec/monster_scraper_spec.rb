require 'monster_scraper'

describe 'MonsterScraper' do

  it 'contains MonsterScraper Class' do
    monster_scraper = MonsterScraper.new
    expect(monster_scraper).to be_a MonsterScraper
  end

end
