import XCTest
@testable import Marvel

class ComicTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    
    func testDecodingComic() {
        let json = comicFixture1
        let comic = try! JSONDecoder().decode(Comic.self, from: json)
        XCTAssertEqual(comic.name, "Indestructible Hulk (2012 - 2014)")
    }
    
    func testInvalidComicType() {
        let json = comicFixture2
        let comic = try? JSONDecoder().decode(Comic.self, from: json)
        XCTAssertNil(comic)
    }
    
    func testInvalidComicKey() {
        let json = comicFixture3
        let comic = try? JSONDecoder().decode(Comic.self, from: json)
        XCTAssertNil(comic)
    }
    
    func testDecodingComicObject() {
        let json = comicObjectFixture1
        let comicObject = try! JSONDecoder().decode(ComicObject.self, from: json)
        XCTAssertEqual(comicObject.items[0].name, "Avengers: The Initiative (2007) #14")
        XCTAssertEqual(comicObject.items[1].name, "Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)")
        XCTAssert(comicObject.items.count == 12)
    }
    
    func testInvalidComicObjectType() {
        let json = comicObjectFixture2
        let comicObject = try? JSONDecoder().decode(ComicObject.self, from: json)
        XCTAssertNil(comicObject)
    }
    
    func testInvalidComicObjectKey() {
        let json = comicObjectFixture3
        let comicObject = try? JSONDecoder().decode(ComicObject.self, from: json)
        XCTAssertNil(comicObject)
    }
    
    func testEmptyComicObject() {
        let json = comicObjectFixture4
        let comicObject = try? JSONDecoder().decode(ComicObject.self, from: json)
        XCTAssert(comicObject?.items.count == 0)
    }

    private var comicFixture1 = """
    {
        "resourceURI": "http://gateway.marvel.com/v1/public/series/16583",
        "name": "Indestructible Hulk (2012 - 2014)"
    }
    """.data(using: .utf8)!
    
    private var comicFixture2 = """
    {
        "resourceURI": "http://gateway.marvel.com/v1/public/series/16583",
        "name": 1234
    }
    """.data(using: .utf8)!
    
    private var comicFixture3 = """
       {
           "resourceURI": "http://gateway.marvel.com/v1/public/series/16583",
           "nome": "Indestructible Hulk (2012 - 2014)"
       }
       """.data(using: .utf8)!
    
    private var comicObjectFixture1 = """
    {
        "available": 12,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
        "items": [{
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21366",
            "name": "Avengers: The Initiative (2007) #14"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/24571",
            "name": "Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21546",
            "name": "Avengers: The Initiative (2007) #15"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21741",
            "name": "Avengers: The Initiative (2007) #16"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21975",
            "name": "Avengers: The Initiative (2007) #17"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/22299",
            "name": "Avengers: The Initiative (2007) #18"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/22300",
            "name": "Avengers: The Initiative (2007) #18 (ZOMBIE VARIANT)"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/22506",
            "name": "Avengers: The Initiative (2007) #19"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/8500",
            "name": "Deadpool (1997) #44"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/10223",
            "name": "Marvel Premiere (1972) #35"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/10224",
            "name": "Marvel Premiere (1972) #36"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/10225",
            "name": "Marvel Premiere (1972) #37"
        }],
        "returned": 12
    }
    """.data(using: .utf8)!
    
    private var comicObjectFixture2 = """
    {
        "available": 12,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
        "items": [{
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21366",
            "name": 123
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/24571",
            "name": "Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21546",
            "name": "Avengers: The Initiative (2007) #15"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21741",
            "name": "Avengers: The Initiative (2007) #16"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21975",
            "name": "Avengers: The Initiative (2007) #17"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/22299",
            "name": "Avengers: The Initiative (2007) #18"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/22300",
            "name": "Avengers: The Initiative (2007) #18 (ZOMBIE VARIANT)"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/22506",
            "name": "Avengers: The Initiative (2007) #19"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/8500",
            "name": "Deadpool (1997) #44"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/10223",
            "name": "Marvel Premiere (1972) #35"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/10224",
            "name": "Marvel Premiere (1972) #36"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/10225",
            "name": "Marvel Premiere (1972) #37"
        }],
        "returned": 12
    }
    """.data(using: .utf8)!

    private var comicObjectFixture3 = """
    {
        "available": 12,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
        "itoms": [{
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21366",
            "name": "Avengers: The Initiative (2007) #14"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/24571",
            "name": "Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21546",
            "name": "Avengers: The Initiative (2007) #15"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21741",
            "name": "Avengers: The Initiative (2007) #16"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/21975",
            "name": "Avengers: The Initiative (2007) #17"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/22299",
            "name": "Avengers: The Initiative (2007) #18"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/22300",
            "name": "Avengers: The Initiative (2007) #18 (ZOMBIE VARIANT)"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/22506",
            "name": "Avengers: The Initiative (2007) #19"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/8500",
            "name": "Deadpool (1997) #44"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/10223",
            "name": "Marvel Premiere (1972) #35"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/10224",
            "name": "Marvel Premiere (1972) #36"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/comics/10225",
            "name": "Marvel Premiere (1972) #37"
        }],
        "returned": 12
    }
    """.data(using: .utf8)!
    
    private var comicObjectFixture4 = """
    {
        "available": 0,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
        "items": [],
        "returned": 0
    }
    """.data(using: .utf8)!
    
}
