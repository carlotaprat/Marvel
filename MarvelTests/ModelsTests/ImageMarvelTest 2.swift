import XCTest
@testable import Marvel
class ImageMarvelTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testDecodingImageMarvel() {
        let json = imageFixture1
        let imageMarvel = try! JSONDecoder().decode(ImageMarvel.self, from: json)
        
        let variantPortrait = "portrait_xlarge"
        let variantLandscape = "landscape_xlarge"
        let urlPortrait = "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784" + "/" + variantPortrait + "." + "jpg"
        let urlLandscape = "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784" + "/" + variantLandscape + "." + "jpg"
        
        XCTAssertEqual(imageMarvel.urlPortrait, urlPortrait)
        XCTAssertEqual(imageMarvel.urlLandscape, urlLandscape)
    }
    
    func testInvalidImagePathType() {
        let json = imageFixture4
        let imageMarvel = try? JSONDecoder().decode(ImageMarvel.self, from: json)
        XCTAssertNil(imageMarvel)
    }
    
    func testInvalidImageExtensionType() {
        let json = imageFixture5
        let imageMarvel = try? JSONDecoder().decode(ImageMarvel.self, from: json)
        XCTAssertNil(imageMarvel)
    }
    
    func testGeneratePath() {
        let imageMarvel = ImageMarvel(urlPortrait: "http://asdf.asf", urlLandscape: "http://qwerq.asr")
                
        XCTAssertEqual(imageMarvel.urlPortrait, "http://asdf.asf")
        
        XCTAssertEqual(imageMarvel.urlLandscape, "http://qwerq.asr")
    }
    
    func createImageMarvelTest() {
        let image = ImageMarvel(urlPortrait: "http://asdf.asf", urlLandscape: "http://qwerq.asr")
        XCTAssertEqual(image.urlLandscape, "http://qwerq.asr")
        XCTAssertEqual(image.urlPortrait, "http://asdf.asf")
        
    }
    
    private var imageFixture1 = """
    {
        "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
        "extension": "jpg"
    }
    """.data(using: .utf8)!
    
    
    private var imageFixture4 = """
    {
        "path": 1234,
        "extension": "jpg"
    }
    """.data(using: .utf8)!
    
    private var imageFixture5 = """
    {
        "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
        "extension": 1234
    }
    """.data(using: .utf8)!
}
