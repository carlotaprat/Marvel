import XCTest
@testable import Marvel

class PaginatedCharactersTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func paginatedCharactersDecodeTest() {
        let json = paginatedCharactersFixture1
        let paginatedCharacter = try! JSONDecoder().decode(PaginatedCharacters.self, from: json)
        XCTAssertEqual(paginatedCharacter.offset, 0)
        XCTAssertEqual(paginatedCharacter.limit, 20)
        XCTAssertEqual(paginatedCharacter.total, 1492)
        XCTAssertEqual(paginatedCharacter.count, 20)
        XCTAssertEqual(paginatedCharacter.results.count, 1)
    }
    
    func invalidPaginatedCharactersKey() {
        let json = paginatedCharactersFixture2
        let paginatedCharacter = try? JSONDecoder().decode(PaginatedCharacters.self, from: json)
        XCTAssertNil(paginatedCharacter)
    }
    
    func invalidPaginatedCharactersType() {
        let json = paginatedCharactersFixture3
        let paginatedCharacter = try? JSONDecoder().decode(PaginatedCharacters.self, from: json)
        XCTAssertNil(paginatedCharacter)
    }
    
    func invalidPaginatedCharactersType2() {
        let json = paginatedCharactersFixture4
        let paginatedCharacter = try? JSONDecoder().decode(PaginatedCharacters.self, from: json)
        XCTAssertNil(paginatedCharacter)
    }
    
    private var paginatedCharactersFixture1 = """
    {
        "offset": 0,
        "limit": 20,
        "total": 1492,
        "count": 20,
        "results": [
        {
            "id": 1011334,
            "name": "3-D Man",
            "description": "",
            "modified": "2014-04-29T14:18:17-0400",
            "thumbnail": {
                "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                "extension": "jpg"
            },
            "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
            "comics": {
                "available": 2,
                "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                "items": [{
                    "resourceURI": "http://gateway.marvel.com/v1/public/comics/21366",
                    "name": "Avengers: The Initiative (2007) #14"
                }, {
                    "resourceURI": "http://gateway.marvel.com/v1/public/comics/24571",
                    "name": "Avengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)"
                }],
                "returned": 2
            },
            "series": {
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
            },
            "stories": {
                "available": 2,
                "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/stories",
                "items": [{
                    "resourceURI": "http://gateway.marvel.com/v1/public/stories/19947",
                    "name": "Cover #19947",
                    "type": "cover"
                }, {
                    "resourceURI": "http://gateway.marvel.com/v1/public/stories/19948",
                    "name": "The 3-D Man!",
                    "type": "interiorStory"
                }],
                "returned": 2
            },
            "events": {
                "available": 1,
                "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/events",
                "items": [{
                    "resourceURI": "http://gateway.marvel.com/v1/public/events/269",
                    "name": "Secret Invasion"
                }],
                "returned": 1
            },
            "urls": [{
                "type": "detail",
                "url": "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=605a6c75914cb1bdbcf4ccd87c23afc9"
            }, {
                "type": "wiki",
                "url": "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=605a6c75914cb1bdbcf4ccd87c23afc9"
            }, {
                "type": "comiclink",
                "url": "http://marvel.com/comics/characters/1011334/3-d_man?utm_campaign=apiRef&utm_source=605a6c75914cb1bdbcf4ccd87c23afc9"
            }
        ]
    }
    """.data(using: .utf8)!
    
    private var paginatedCharactersFixture2 = """
    {
        "ofset": 0,
        "limit": 20,
        "total": 1492,
        "count": 20,
        "results": []
    }
    """.data(using: .utf8)!
    
    private var paginatedCharactersFixture3 = """
    {
        "offset": "asdf",
        "limit": 20,
        "total": 1492,
        "count": 20,
        "results": []
    }
    """.data(using: .utf8)!
    
    
    private var paginatedCharactersFixture4 = """
    {
        "offset": 0,
        "limit": 20,
        "total": 1492,
        "count": 20,
        "results": {}
    }
    """.data(using: .utf8)!



}
