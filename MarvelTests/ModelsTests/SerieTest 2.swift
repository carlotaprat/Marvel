import XCTest
@testable import Marvel

class SerieTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    
    func testDecodingSerie() {
        let json = serieFixture1
        
        let serie = try! JSONDecoder().decode(Serie.self, from: json)
        XCTAssertEqual(serie.name, "Ant-Man & the Wasp (2010 - 2011)")
    }
    
    func testInvalidSerieType() {
        let json = serieFixture2
               
        let serie = try? JSONDecoder().decode(Serie.self, from: json)
        XCTAssertNil(serie)
    }
    
    func testInvalidSerieTypeKey() {
        let json = serieFixture3
               
        let serie = try? JSONDecoder().decode(Serie.self, from: json)
        XCTAssertNil(serie)
    }
    
    func testDecodingSerieObject() {
        let json = serieObjectFixture1
        
        let serieObject = try! JSONDecoder().decode(SerieObject.self, from: json)
        XCTAssertEqual(serieObject.items[0].name, "Avengers: The Initiative (2007 - 2010)")
        XCTAssertEqual(serieObject.items[1].name, "Deadpool (1997 - 2002)")
        XCTAssert(serieObject.items.count == 3)
    }
    
    func testInvalidSerieObjectType() {
        let json = serieObjectFixture2
        let serieObject = try? JSONDecoder().decode(SerieObject.self, from: json)
        XCTAssertNil(serieObject)
    }

    func testInvalidSerieObjectItemKey() {
        let json = serieObjectFixture3
        let serieObject = try? JSONDecoder().decode(SerieObject.self, from: json)
        XCTAssertNil(serieObject)
    }
    
    func testEmptySerieObject() {
        let json = serieObjectFixture4
        let serieObject = try? JSONDecoder().decode(SerieObject.self, from: json)
        XCTAssert(serieObject?.items.count == 0)
    }
    
    private var serieFixture1 = """
    {
        "resourceURI": "http://gateway.marvel.com/v1/public/series/13082",
        "name": "Ant-Man & the Wasp (2010 - 2011)"
    }
    """.data(using: .utf8)!
    
    private var serieFixture2 = """
    {
        "resourceURI": "http://gateway.marvel.com/v1/public/series/13082",
        "name": 1234
    }
    """.data(using: .utf8)!
    
    private var serieFixture3 = """
    {
        "resourceURI": "http://gateway.marvel.com/v1/public/series/13082",
        "nome": 1234
    }
    """.data(using: .utf8)!
    
    private var serieObjectFixture1 = """
    {
        "available": 3,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/series",
        "items": [{
            "resourceURI": "http://gateway.marvel.com/v1/public/series/1945",
            "name": "Avengers: The Initiative (2007 - 2010)"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/series/2005",
            "name": "Deadpool (1997 - 2002)"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/series/2045",
            "name": "Marvel Premiere (1972 - 1981)"
        }],
        "returned": 3
    }
    """.data(using: .utf8)!
    
    private var serieObjectFixture2 = """
    {
        "available": 3,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/series",
        "items": [{
            "resourceURI": "http://gateway.marvel.com/v1/public/series/1945",
            "name": "Avengers: The Initiative (2007 - 2010)"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/series/2005",
            "name": 1234
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/series/2045",
            "name": "Marvel Premiere (1972 - 1981)"
        }],
        "returned": 3
    }
    """.data(using: .utf8)!
    
    private var serieObjectFixture3 = """
    {
        "available": 3,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/series",
        "itoms": [{
            "resourceURI": "http://gateway.marvel.com/v1/public/series/1945",
            "name": "Avengers: The Initiative (2007 - 2010)"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/series/2005",
            "name": 1234
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/series/2045",
            "name": "Marvel Premiere (1972 - 1981)"
        }],
        "returned": 3
    }
    """.data(using: .utf8)!
    
    private var serieObjectFixture4 = """
    {
        "available": 0,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/series",
        "items": [],
        "returned": 0
    }
    """.data(using: .utf8)!

    
}
