require_relative '../lib/nearby_zip_codes'

describe NearbyZipCodes::ZipCode do
  describe '#new' do
    it 'sets the instance variable #zip_code' do
      expect(NearbyZipCodes::ZipCode.new('07424').instance_variables).to include(:@zip_code)
    end
  end

  describe '#longitude' do
    it 'returns the longitude value of the zip code' do
      long_lat_reader = double('LongLatReader', longitude: '-74.214388')
      zip = NearbyZipCodes::ZipCode.new('07424', long_lat_reader)
      expect(zip.longitude).to match(/-74.21.*/)
    end
  end

  describe '#latitude' do
    it 'returns the latitude value of the zip code' do
      long_lat_reader = double('LongLatReader', latitude: '40.883548')
      zip = NearbyZipCodes::ZipCode.new('07424', long_lat_reader)
      expect(zip.latitude).to match(/40.88.*/)
    end
  end

  describe '#nearby_zip_codes' do
    nearby_zip_codes = %w(07006 07009 07012 07013 07021 07042 07044 07110 07424
                          07470 07501 07502 07503 07504 07505 07506 07508 07512
                          07513 07514 07522 07524)
    it 'returns the nearby zipcodes within the given miles' do
      long_lat_reader = double('LongLatReader', zip_codes_within_miles_of: nearby_zip_codes)
      zip = NearbyZipCodes::ZipCode.new('07424', long_lat_reader)
      expect(zip.nearby_zip_codes(5)).to eq(nearby_zip_codes)
    end
  end
end
