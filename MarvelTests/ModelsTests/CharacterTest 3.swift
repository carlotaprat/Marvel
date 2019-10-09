import XCTest
@testable import Marvel

class CharacterTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDecodingCharacter() {
        let json = characterFixture1
        let character = try! JSONDecoder().decode(Character.self, from: json)
        XCTAssertEqual(character.characterId, 1011334)
        XCTAssertEqual(character.name, "3-D Man")
        XCTAssertEqual(character.description, "")
        XCTAssertEqual(character.picture?.urlLandscape, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784/landscape_xlarge.jpg")
        XCTAssertEqual(character.picture?.urlPortrait, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784/portrait_xlarge.jpg")
        XCTAssertEqual(character.comics.count, 2)
        XCTAssertEqual(character.events.count, 1)
        XCTAssertEqual(character.stories.count, 2)
        XCTAssertEqual(character.series.count, 3)
        XCTAssertEqual(character.comics[0], "Avengers: The Initiative (2007) #14")
        XCTAssertEqual(character.series[0], "Avengers: The Initiative (2007 - 2010)")
        XCTAssertEqual(character.stories[0], "Cover #19947")
        XCTAssertEqual(character.events[0], "Secret Invasion")
    }
    
    func testInvalidIdType() {
        let json = characterFixture2
        let character = try? JSONDecoder().decode(Character.self, from: json)
        XCTAssertNil(character)
    }
    
    func testInvalidNameType() {
        let json = characterFixture3
        let character = try? JSONDecoder().decode(Character.self, from: json)
        XCTAssertNil(character)
    }
    
    func testInvalidStoriesType() {
        let json = characterFixture4
        let character = try? JSONDecoder().decode(Character.self, from: json)
        XCTAssertNil(character)
    }
    
    func testInvalidIdKey() {
        let json = characterFixture5
        let character = try? JSONDecoder().decode(Character.self, from: json)
        XCTAssertNil(character)
    }

    private let characterFixture1 = """
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
        }]
    }
    """.data(using: .utf8)!
    
    private let characterFixture2 = """
    {
        "id": "1011334",
        "name": "3-D Man",
        "description": "",
        "modified": "2014-04-29T14:18:17-0400",
        "thumbnail": {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
            "extension": "jpg"
        },
        "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
        "comics": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
        },
        "series": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
        },
        "stories": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
        },
        "events": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
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
        }]
    }
    """.data(using: .utf8)!
    
    private let characterFixture3 = """
    {
        "id": 1011334,
        "name": 3-D Man,
        "description": "",
        "modified": "2014-04-29T14:18:17-0400",
        "thumbnail": {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
            "extension": "jpg"
        },
        "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
        "comics": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
        },
        "series": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
        },
        "stories": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
        },
        "events": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
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
        }]
    }
    """.data(using: .utf8)!
    
    private let characterFixture4 = """
    {
        "id": "1011334",
        "name": "3-D Man",
        "description": "",
        "modified": "2014-04-29T14:18:17-0400",
        "thumbnail": {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
            "extension": "jpg"
        },
        "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
        "comics": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
        },
        "series": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
        },
        "stories": [{
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
        ]},
        "events": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
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
        }]
    }
    """.data(using: .utf8)!
    
    private let characterFixture5 = """
    {
        "idd": "1011334",
        "name": "3-D Man",
        "description": "",
        "modified": "2014-04-29T14:18:17-0400",
        "thumbnail": {
            "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
            "extension": "jpg"
        },
        "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
        "comics": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
        },
        "series": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
        },
        "stories": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
        },
        "events": {
            "available": ,
            "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            "items": [],
            "returned": 0
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
        }]
    }
    """.data(using: .utf8)!
}
