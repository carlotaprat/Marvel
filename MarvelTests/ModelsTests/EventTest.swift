import XCTest
@testable import Marvel

class EventTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    
    func testDecodingEvent() {
        let json = eventFixture1
        let event = try! JSONDecoder().decode(Event.self, from: json)
        XCTAssertEqual(event.name, "Indestructible Hulk (2012 - 2014)")
    }
    
    func testInvalidEventType() {
        let json = eventFixture2
        let event = try? JSONDecoder().decode(Event.self, from: json)
        XCTAssertNil(event)
    }
    
    func testInvalidEventKey() {
        let json = eventFixture3
        let event = try? JSONDecoder().decode(Event.self, from: json)
        XCTAssertNil(event)
    }
    
    func testDecodingEventObject() {
        let json = eventObjectFixture1
        let eventObject = try! JSONDecoder().decode(EventObject.self, from: json)
        XCTAssertEqual(eventObject.items[0].name, "Civil War")
        XCTAssertEqual(eventObject.items[1].name, "Fear Itself")
        XCTAssert(eventObject.items.count == 4)
    }
    
    func testInvalidEventObjectType() {
        let json = eventObjectFixture2
        let eventObject = try? JSONDecoder().decode(EventObject.self, from: json)
        XCTAssertNil(eventObject)
    }
    
    func testInvalidEventObjectKey() {
        let json = eventObjectFixture3
        let eventObject = try? JSONDecoder().decode(EventObject.self, from: json)
        XCTAssertNil(eventObject)
    }
    
    func testEmptyEventObject() {
        let json = eventObjectFixture4
        let eventObject = try? JSONDecoder().decode(EventObject.self, from: json)
        XCTAssert(eventObject?.items.count == 0)
    }

    private var eventFixture1 = """
    {
        "resourceURI": "http://gateway.marvel.com/v1/public/series/16583",
        "name": "Indestructible Hulk (2012 - 2014)"
    }
    """.data(using: .utf8)!
    
    private var eventFixture2 = """
    {
        "resourceURI": "http://gateway.marvel.com/v1/public/series/16583",
        "name": 1234
    }
    """.data(using: .utf8)!
    
    private var eventFixture3 = """
       {
           "resourceURI": "http://gateway.marvel.com/v1/public/series/16583",
           "nome": "Indestructible Hulk (2012 - 2014)"
       }
       """.data(using: .utf8)!
    
    private var eventObjectFixture1 = """
    {
        "available": 4,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009148/events",
        "items": [{
            "resourceURI": "http://gateway.marvel.com/v1/public/events/238",
            "name": "Civil War"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/events/302",
            "name": "Fear Itself"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/events/270",
            "name": "Secret Wars"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/events/273",
            "name": "Siege"
        }],
        "returned": 4
    }
    """.data(using: .utf8)!
    
    private var eventObjectFixture2 = """
    {
        "available": 4,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009148/events",
        "items": [{
            "resourceURI": "http://gateway.marvel.com/v1/public/events/238",
            "name": 1234
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/events/302",
            "name": "Fear Itself"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/events/270",
            "name": "Secret Wars"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/events/273",
            "name": "Siege"
        }],
        "returned": 4
    }
    """.data(using: .utf8)!

    private var eventObjectFixture3 = """
    {
        "available": 4,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009148/events",
        "itoms": [{
            "resourceURI": "http://gateway.marvel.com/v1/public/events/238",
            "name": "Civil War"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/events/302",
            "name": "Fear Itself"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/events/270",
            "name": "Secret Wars"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/events/273",
            "name": "Siege"
        }],
        "returned": 4
    }
    """.data(using: .utf8)!
    
    private var eventObjectFixture4 = """
    {
        "available": 0,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009144/events",
        "items": [],
        "returned": 0
    }
    """.data(using: .utf8)!

}
