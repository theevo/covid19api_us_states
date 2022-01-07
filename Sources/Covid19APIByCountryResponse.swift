import Foundation

public struct Covid19APIByCountryResponse: Codable {
    var country: String
    var countryCode: String
    public var province: String
    var city: String
    var cityCode: String
    var lat: String
    var lon: String
    var cases: Double
    var status: String
    var dateString: String
    
    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case province = "Province"
        case city = "City"
        case cityCode = "CityCode"
        case lat = "Lat"
        case lon = "Lon"
        case cases = "Cases"
        case status = "Status"
        case dateString = "Date"
    }
}
