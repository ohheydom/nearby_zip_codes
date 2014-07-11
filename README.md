# NearbyZipCodes


## Installation

Add this line to your application's Gemfile:

    gem 'nearby_zip_codes', git: 'git://github.com/ohheydom/nearby_zip_codes.git'

## Usage

To use, type
```ruby
zip = NearbyZipCodes::ZipCode.new(zip_code)
```

To return nearby zip codes within 5 miles, type

```ruby
zip.nearby_zip_codes
```

To return nearby cities within 5 miles, type

```ruby
zip.nearby_cities
```

You can also pass an argument to both methods. For instance, if you want to return the zip codes within 15 miles, type

```ruby
zip.nearby_zip_codes(15)
```
