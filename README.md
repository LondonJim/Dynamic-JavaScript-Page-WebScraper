# Dynamic JavaScript Scraping - Ruby

The problem I found was that a gem like nokogiri used in conjunction with the httparty gem only parses the html on a given page and can not execute any javascript that may dynamically display information. I created a web scraper using the watir gem to create a headless chrome page that waits for the information to appear before passing it on to nokogiri to parse the html.

In this example I have scraped the names of monsters from a site. Currently it just returns an array of hashes.

### Installation

`git clone git@github.com:LondonJim/Dynamic-JavaScript-Page-WebScraper.git`

`cd Dynamic-JavaScript-Page-WebScraper`

`bundle`

Make sure you have chromedriver installed as watir will be using it, I installed it with homebrew as below.

`brew tap homebrew/cask && brew cask install chromedriver`

### Executing
Using `irb`

```
2.6.0 :001 > require "./lib/monster_scraper"
 => true
2.6.0 :002 > monster_scraper = MonsterScraper.new
 => #<MonsterScraper:0x00007fa23b05e7d8 @url="https://roll20.net/compendium/dnd5e/Monsters%20List#content", @monsters=[]>
2.6.0 :003 > monster_scraper.return_monsters
 => [{:name=>"Aboleth"}, {:name=>"Acolyte"}, {:name=>"Adult Black Dragon"}, {:name=>"Adult Blue Dragon"}, {:name=>"Adult Brass Dragon"}, {:name=>"Adult Bronze Dragon"} etc etc
```


### Tests

Run tests

`rspec`

Tests pass in in a mock html page that contains the same information that the web scraper looks for in the original page.

### Notes

Read the cheatsheets at https://nokogiri.org/ especially for getting the selectors right. When inspecting the page make sure any class names with whitespace eg.
```
<div class="here there everywhere">
  stuff
</div>
```
are entered with a '.' in the space when passing into nokogiri eg.
```
example_page = Nokogiri::HTML.parse(unparsed_example_page.html)
example_page.css('div.here.there.everywhere')
```
