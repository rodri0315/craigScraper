# README

# Craigslist Apartment Scraper

Project will scrape one thousand listings from the Raleigh-Durham apartment listing section of craigslist.

## Getting Started

Copy/download the repo into your local machine

### Prerequisites

What things you need to install, and software used.

```
This project uses:
rails 5.1.2
ruby  2.3.3
```

### Installing

To install your dependencies, create a Database and see the results follow the next steps.

```
run 'bundle install'
    'rails db:migrate'
    'rails server'
go to your browser:
    http://localhost:3000/
```

If you want to make a new request, you need to clear the Database and re create one.

```
run 'rails/rake db:drop db:create db:migrate'
    'rails server'
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

## Authors

* **Jorge Rodriguez** - *Initial work* - [rodri0315](https://github.com/rodri0315)


## License

Open Source

## Notes

* This project was challenging but definitely worth the time. Always fun to learn more about the Ruby language.
* This was my first time building a scraper, and it was a challenging but fun experience.
* Some of the sites I used are:
  * https://github.com/sparklemotion/nokogiri/wiki/Cheat-sheet
  * https://johnnunemaker.com/httparty/
  * http://adrianmcli.com/2015/05/23/rails-scraping-tutorial/ # Get familiar on how Nokogiri works on a real example.
  * https://github.com/sparklemotion/sqlite3-ruby
  * https://ruby-doc.org/core-2.4.0/MatchData.html
