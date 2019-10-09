import XCTest
@testable import Marvel

class ResponseTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func responseDecodeTest() {
        let json = responseFixture1
        let response = try! JSONDecoder().decode(Response.self, from: json)
        XCTAssertEqual(response.code, 200)
        XCTAssertEqual(response.status, "Ok")
        XCTAssertEqual(response.data?.offset, 1)
        XCTAssertEqual(response.data?.results.count, 1)
    }
    
    func invalidResponseType() {
        let json = responseFixture2
        let response = try? JSONDecoder().decode(Response.self, from: json)
        XCTAssertNil(response)
    }
    
    func invalidResponseKey() {
        let json = responseFixture3
        let response = try? JSONDecoder().decode(Response.self, from: json)
        XCTAssertNil(response)
    }
    
    func invalidResponseType2() {
       let json = responseFixture4
        let response = try? JSONDecoder().decode(Response.self, from: json)
        XCTAssertNil(response)
    }
    
    private let responseFixture1 = """
    {
    "code": 200,
    "status": "Ok",
    "copyright": "© 2019 MARVEL",
    "attributionText": "Data provided by Marvel. © 2019 MARVEL",
    "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2019 MARVEL</a>",
    "etag": "711d19b440f39925b5e2837dd52c3f35336c3c10",
    "data": {
        "offset": 0,
        "limit": 20,
        "total": 1,
        "count": 1,
        "results": [{
            "id": 1011263,
            "name": "Martin Li",
            "description": "",
            "modified": "1969-12-31T19:00:00-0500",
            "thumbnail": {
                "path": "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
                "extension": "jpg"
            },
            "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011263",
            "comics": {
                "available": 0,
                "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011263/comics",
                "items": [],
                "returned": 0
            },
            "series": {
                "available": 0,
                "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011263/series",
                "items": [],
                "returned": 0
            },
            "stories": {
                "available": 0,
                "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011263/stories",
                "items": [],
                "returned": 0
            },
            "events": {
                "available": 0,
                "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011263/events",
                "items": [],
                "returned": 0
            },
            "urls": [{
                "type": "detail",
                "url": "http://marvel.com/characters/2901/martin_li?utm_campaign=apiRef&utm_source=605a6c75914cb1bdbcf4ccd87c23afc9"
            }, {
                "type": "wiki",
                "url": "http://marvel.com/universe/Li,_Martin?utm_campaign=apiRef&utm_source=605a6c75914cb1bdbcf4ccd87c23afc9"
            }, {
                "type": "comiclink",
                "url": "http://marvel.com/comics/characters/1011263/martin_li?utm_campaign=apiRef&utm_source=605a6c75914cb1bdbcf4ccd87c23afc9"
            }]
        }]
    }
    """.data(using: .utf8)!
    
    private let responseFixture2 = """
    {
    "code": "200",
    "status": "Ok",
    "copyright": "© 2019 MARVEL",
    "attributionText": "Data provided by Marvel. © 2019 MARVEL",
    "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2019 MARVEL</a>",
    "etag": "711d19b440f39925b5e2837dd52c3f35336c3c10",
    "data": {
        "offset": 0,
        "limit": 20,
        "total": 1,
        "count": 1,
        "results": []
        }]
    }
    """.data(using: .utf8)!
    
    private let responseFixture3 = """
    {
    "code": 200,
    "stats": "Ok",
    "copyright": "© 2019 MARVEL",
    "attributionText": "Data provided by Marvel. © 2019 MARVEL",
    "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2019 MARVEL</a>",
    "etag": "711d19b440f39925b5e2837dd52c3f35336c3c10",
    "data": {
        "offset": 0,
        "limit": 20,
        "total": 1,
        "count": 1,
        "results": []
        }]
    }
    """.data(using: .utf8)!
    
    private let responseFixture4 = """
    {
    "code": 200,
    "status": "Ok",
    "copyright": "© 2019 MARVEL",
    "attributionText": "Data provided by Marvel. © 2019 MARVEL",
    "attributionHTML": "<a href=\"http://marvel.com\">Data provided by Marvel. © 2019 MARVEL</a>",
    "etag": "711d19b440f39925b5e2837dd52c3f35336c3c10",
    "data": [{
        "offset": 0,
        "limit": 20,
        "total": 1,
        "count": 1,
        "results": []
        }]
    }]
    """.data(using: .utf8)!

}
