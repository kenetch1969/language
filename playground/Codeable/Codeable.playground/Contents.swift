import UIKit

struct Beer: Codable {
    let meta: Meta
    let breweries: [Breweries]
}

struct Meta: Codable {
    let page: Int
    let pageCount: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case pageCount = "page_count"
    }
}

struct Breweries: Codable {
    let name: String
    let location: String
}

extension Meta {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let page = try container.decode(Int.self, forKey: .page)
        let pageCount = try container.decode(Int.self, forKey: .pageCount)
        self.init(page: page + 50, pageCount: pageCount + 400)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(page * 768, forKey: .page)
        try container.encode(pageCount / 13, forKey: .pageCount)
    }
}

let breweriesJSON = """
{"meta": {"page": 1, "page_count": 100}, "breweries": [{"name": "ddd", "location": "Seattle"}, {"name": "ddwewe", "location": "Washington"}]}
"""

do {
    let decodedBeerObject = try JSONDecoder().decode(Beer.self, from: breweriesJSON.data(using: .utf8)!)
    print(decodedBeerObject)
    if let encodedBeerObject = try? JSONEncoder().encode(decodedBeerObject) {
        print(String(data: encodedBeerObject,encoding: .utf8)!)
    }
} catch let error {
    print(error.localizedDescription)
}


struct User: Codable {
    
    var name: String
    var style: String
    var abv: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case info
    }
    
    enum InfoKey: String, CodingKey {
        case style
        case abv
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        let extraInfo = try values.nestedContainer(keyedBy: InfoKey.self, forKey: .info)
        style = try extraInfo.decode(String.self, forKey: .style)
        abv = try extraInfo.decode(String.self, forKey: .abv)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        var infoValue = container.nestedContainer(keyedBy: InfoKey.self, forKey: .info)
        try infoValue.encode(style, forKey: .style)
        try infoValue.encode(abv, forKey: .abv)
    }
}

let nestedData = """
{"name": "lawnmower", "info": { "style": "kolsch", "abv": "4.9" }}
"""
do {
    let decodedUserObject = try JSONDecoder().decode(User.self, from: nestedData.data(using: .utf8)!)
    print(decodedUserObject)
    if let encodedUserObject = try? JSONEncoder().encode(decodedUserObject) {
        print(String(data: encodedUserObject,encoding: .utf8)!)
    }
} catch let error {
    print(error.localizedDescription)
}

//Parseo a Json
struct Person: Codable {
    let name: String
    let address: String
}

struct Company: Codable {
    let people: [Person]
}

let company = Company(people: [Person(name: "aaa", address: "bbb"), Person(name: "aaa1", address: "bbb1")])
let data2 = try! JSONEncoder().encode(company)
let companyPeopleJSON = try! JSONSerialization.jsonObject(with: data2, options: [])
print(companyPeopleJSON)
let decodedCompany = try! JSONDecoder().decode(Company.self, from: data2)
print(decodedCompany)

