require 'watir'
require 'nokogiri'

class MonsterScraper

  attr_reader :monsters, :url

  def initialize(url = "https://roll20.net/compendium/dnd5e/Monsters%20List#content")
    @url = url
    @monsters = []
  end

  def return_monsters
    get_page_info.each do |el|
      single_monster = {
        name: el.css('a').text
      }
      @monsters << single_monster
    end
    @monsters
  end

  private
  
  def get_page_info
    unparsed_page = Watir::Browser.new(:chrome, headless: true)
    unparsed_page.goto @url
    Watir::Wait.until(timeout: 10) { unparsed_page.div(:class => ["listResult",
      "booktemplate", "closed", "list"]).exists? }
    parse_page = Nokogiri::HTML.parse(unparsed_page.html)
    parse_page.css('div.listResult.booktemplate.closed.list')
  end

end
