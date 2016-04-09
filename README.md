JauNCES
=========

Making it a joy to discover NCES data.

  - Quickly lookup a school NCES ID by searching school name or location
  - Find other available NCES data on schools

The national school identifier knows as *NCES School ID* is becoming more widely used. This API and basic front-end is designed to allow users and application developers to fetch a school's NCES data quickly and easily. This is a project created by [Garren Givens](http://www.garrengivens.com) for his work as a [Presidential Innovation Fellow](http://www.whitehouse.gov/innovationfellows).

> NCES school data is currently posted to Data.gov on an 
> annual basis. Search engines and users alike need the
> ability to find NCES data on schools quickly and easily.

## Getting Started

#### Dependencies
- Ruby 2.0+ (try rbenv or rvm)
- Bundler (`gem install bundler`)
- Vagrant
- Virtualbox or VMware Fusion

#### Vagrant up!
- Copy `application.yml.example` to `application.yml` in the `config` folder. 
- Start the virtual machine with `vagrant up`. Your virtual machine will be downloaded and provisioned automatically. 
- Once the virtual machine is fully provisioned, the script will then import Schools from the sample data set and then index the data for quick searching.
- Look for the `ALL DONE!!!` and visit http://localhost:3000


## The Plan
  - Create automated background tasks for fetching data from ed.gov
  - Find other useful NCES data to include
  - Improve test coverage

## History
This application is loosely based upon the _recipe_ used for [resapi.org](http://resapi.org). This _recipe_ includes a lightweight Rails application which accepts various data types as source for RESTful APIs. These APIs are self-documenting and schema-agnostic. For more information see [resapi.org](http://resapi.org).
  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

MIT

*Free Software, Hell Yeah!*
