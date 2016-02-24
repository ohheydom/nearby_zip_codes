# NearbyZipCodes

NearbyZipCodes is a ruby gem that will return nearby zip codes and towns/cities given a zip code.

## Installation

Add this line to your application's Gemfile:

    gem 'nearby_zip_codes', git: 'git://github.com/ohheydom/nearby_zip_codes.git'

## Usage

To use, create a zipcode object containing a zip code:

```ruby
zip = NearbyZipCodes::ZipCode.new(zip_code_in_string)
```

Like so:

```ruby
zip = NearbyZipCodes::ZipCode.new('12345')
```

To return nearby zip codes within 5 miles, type:

```ruby
zip.nearby_zip_codes
```

To return nearby cities within 5 miles, type:

```ruby
zip.nearby_cities
```

You can also pass an additional argument to both methods to return nearby cities or zip codes within a certain mileage. For instance, if you want to return the zip codes within 15 miles, type:

```ruby
zip.nearby_zip_codes(15)
```
