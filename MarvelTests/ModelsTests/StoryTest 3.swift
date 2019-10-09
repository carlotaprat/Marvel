import XCTest
@testable import Marvel

class StoryTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testDecodingStory() {
        let json = storyFixture1
        let story = try! JSONDecoder().decode(Story.self, from: json)
        XCTAssertEqual(story.name, "Army Ants")
    }
    
    func testInvalidStoryType() {
        let json = storyFixture2
        let story = try? JSONDecoder().decode(Story.self, from: json)
        XCTAssertNil(story)
    }
    
    func testInvalidStoryKey() {
        let json = storyFixture3
        let story = try? JSONDecoder().decode(Story.self, from: json)
        XCTAssertNil(story)
    }
    
    func testDecodingStoryObject() {
        let json = storyObjectFixture1
        let storyObject = try! JSONDecoder().decode(StoryObject.self, from: json)
        XCTAssertEqual(storyObject.items[0].name, "A Beginning")
        XCTAssertEqual(storyObject.items[1].name, "Utility of Myth")
        XCTAssert(storyObject.items.count == 8)
    }
    
    func testInvalidStoryObjectType() {
        let json = storyObjectFixture2
        let storyObject = try? JSONDecoder().decode(StoryObject.self, from: json)
        XCTAssertNil(storyObject)
    }
    
    func testInvalidStoryObjectKey() {
        let json = storyObjectFixture3
        let storyObject = try? JSONDecoder().decode(StoryObject.self, from: json)
        XCTAssertNil(storyObject)
    }
    
    func testEmptyStoryObject() {
        let json = storyObjectFixture4
        let storyObject = try? JSONDecoder().decode(StoryObject.self, from: json)
        XCTAssert(storyObject?.items.count == 0)
    }

    private var storyFixture1 = """
    {
       "resourceURI": "http://gateway.marvel.com/v1/public/stories/28356",
        "name": "Army Ants",
        "type": "interiorStory"
    }
    """.data(using: .utf8)!
    
    private var storyFixture2 = """
    {
       "resourceURI": "http://gateway.marvel.com/v1/public/stories/28356",
        "name": 1234,
        "type": "interiorStory"
    }
    """.data(using: .utf8)!
    
    private var storyFixture3 = """
       {
          "resourceURI": "http://gateway.marvel.com/v1/public/stories/28356",
           "nome": "Army Ants",
           "type": "interiorStory"
       }
       """.data(using: .utf8)!
    
    private var storyObjectFixture1 = """
    {
        "available": 8,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009149/stories",
        "items": [{
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/26281",
            "name": "A Beginning",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28352",
            "name": "Utility of Myth",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28356",
            "name": "Army Ants",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28358",
            "name": "Ballroom Blitzkrieg",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28360",
            "name": "Staring Contests are for Suckers",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28407",
            "name": "The Draco Part One: Sins of the Father",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28411",
            "name": "The Draco Part Three",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28413",
            "name": "The Draco Part Four",
            "type": "interiorStory"
        }],
        "returned": 8
    }
    """.data(using: .utf8)!
    
    private var storyObjectFixture2 = """
    {
        "available": 8,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009149/stories",
        "items": [{
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/26281",
            "name": 1234,
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28352",
            "name": "Utility of Myth",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28356",
            "name": "Army Ants",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28358",
            "name": "Ballroom Blitzkrieg",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28360",
            "name": "Staring Contests are for Suckers",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28407",
            "name": "The Draco Part One: Sins of the Father",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28411",
            "name": "The Draco Part Three",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28413",
            "name": "The Draco Part Four",
            "type": "interiorStory"
        }],
        "returned": 8
    }
    """.data(using: .utf8)!

    private var storyObjectFixture3 = """
    {
        "available": 8,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009149/stories",
        "itoms": [{
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/26281",
            "name": "A Beginning",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28352",
            "name": "Utility of Myth",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28356",
            "name": "Army Ants",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28358",
            "name": "Ballroom Blitzkrieg",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28360",
            "name": "Staring Contests are for Suckers",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28407",
            "name": "The Draco Part One: Sins of the Father",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28411",
            "name": "The Draco Part Three",
            "type": "interiorStory"
        }, {
            "resourceURI": "http://gateway.marvel.com/v1/public/stories/28413",
            "name": "The Draco Part Four",
            "type": "interiorStory"
        }],
        "returned": 8
    }
    """.data(using: .utf8)!
    
    private var storyObjectFixture4 = """
    {
        "available": 0,
        "collectionURI": "http://gateway.marvel.com/v1/public/characters/1009144/storys",
        "items": [],
        "returned": 0
    }
    """.data(using: .utf8)!

}
