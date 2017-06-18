# LeagueHelper

This gem is meant to provide League of Legends players with information on climbing the ranking ladder. The gem provides information on your most popular rank champions and rank stats for each in addion to popular item builds for each champ.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'LeagueHelper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install LeagueHelper

## Usage
First run the league_helper in the bin directory. At this time you will be prompted to enter your summoner name. After doing so, if you are ranked you will be provided with the following list of options.
"1.Rank Solo Q       3.Most played Champs"
"2.Champion Build    4.New summoner lookup"
If you are unranked the program will close as it is intended to help rank players improve their game.
To make an option choice simply enter the number of your choice.
The first option will provide you information on your top two most sucessful champions with tips.
The second option will provide you with popular item builds on a champion of your choice from your top seven most used champions in rank.
The third options displays your seven most used champions.
The fourth and last option allows a user to look up a new summoner.
## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'mromarmason-38224'/LeagueHelper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
