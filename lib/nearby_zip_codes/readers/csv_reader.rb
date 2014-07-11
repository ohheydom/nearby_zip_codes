require 'csv'
require_relative '../angular_distance_converter'

module NearbyZipCodes
  class CSVReader
    attr_reader :csv, :distance_converter

    def initialize(csv_file = 'data/zip_codes.csv', distance_converter = NearbyZipCodes::AngularDistanceConverter)
      @csv ||= CSV.read(csv_file, headers: true, header_converters: :symbol)
      @distance_converter = distance_converter
    end

    def method_missing(meth, zip, &block)
      if csv.headers.include?(meth)
        row = csv.select { |result| result[:zip_code] == zip }
        row.empty? ? 'Invalid Zip Code' : row[0][meth]
      else
        'Not a valid header'
      end
    end

    def zip_codes_within_miles_of(zip_code, miles)
      distances = distance_converter.new(longitude: longitude(zip_code), latitude: latitude(zip_code), distance: miles)
      results_within_range_of(distances).map { |result| result[:zip_code] }
    end

    def cities_within_miles_of(zip_code, miles)
      distances = distance_converter.new(longitude: longitude(zip_code), latitude: latitude(zip_code), distance: miles)
      results_within_range_of(distances).map { |result| result[:city] }.uniq
    end

    private

    def results_within_range_of(distances)
      csv.select do |row|
        row[:latitude].to_f.between?(*distances.latitude_range) &&
          row[:longitude].to_f.between?(*distances.longitude_range)
      end
    end
  end
end
