# Dynamic JavaScript Scraping

The problem I found was that a gem like nokogiri used in conjunction with the httparty gem only parses the html on a given page and can not run and javascript that may dynamically display information. I created a web scraper using the watir gem to create a headless chrome page that waits for the information to appear before passing it on to nokogiri to parse the html.

In this example I have scraped the names of monsters from a site. Currently it just returns an array of hashes.

### Installation

`git clone git@github.com:LondonJim/Dynamic-JavaScript-Page-WebScraper.git`

`cd Dynamic-JavaScript-Page-WebScraper`

`bundle`

Make sure you have chromedriver installed as watir will be using it, I installed it with homebrew as below.

`brew tap homebrew/cask && brew cask install chromedriver`

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
