require_relative '../lib/nearby_zip_codes/readers/database_reader.rb'

describe NearbyZipCodes::DatabaseReader do
  zip_code_db = NearbyZipCodes::DatabaseReader.new
  nearby_zip_codes = %w(07006 07009 07012 07013 07021 07042 07044 07110 07424
                        07470 07501 07502 07503 07504 07505 07506 07508 07512
                        07513 07514 07522 07524)
  nearby_cities = ['Caldwell', 'Cedar Grove', 'Clifton', 'Little Falls', 'Paterson',
                   'Hawthorne', 'Haledon', 'Essex Fells', 'Montclair', 'Verona',
                   'Totowa', 'Wayne', 'Nutley']

  describe '#longitude' do
    it 'returns the longitude' do
      expect(zip_code_db.longitude('07424')).to eq('-74.214388')
    end
  end

  describe '#latitude' do
    it 'returns the latitude' do
      expect(zip_code_db.latitude('07424')).to eq('40.883548')
    end
  end

  describe 'zip_codes_within_miles_of' do
    it 'returns all the zip codes within the given miles' do
      expect(zip_code_db.zip_codes_within_miles_of('07424', 10)).to include(*nearby_zip_codes)
    end
  end

  describe 'cities_within_miles_of' do
    it 'returns all the cities within the given miles' do
      expect(zip_code_db.cities_within_miles_of('07424', 10)).to include(*nearby_cities)
    end
  end
end
