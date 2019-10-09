import XCTest
@testable import Marvel

class CharacterDetailViewModelTests: XCTestCase {

    var viewModel: CharacterDetailViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CharacterDetailViewModel()
        let character = Character(characterId: 123, name: "hulk", description: "hulk is a marvel superhero", picture: ImageMarvel(urlPortrait: "aaa", urlLandscape: "bbb"), series: ["serie1", "serie2"], comics: ["comic1", "comic2"], events: ["event1", "event2"], stories: ["story1", "story2"])
        viewModel.setCharacter(character: character)
    }

    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func getNameTest() {
        let name = viewModel.getName()
        XCTAssertEqual("hulk", name)
    }
    
    func getDescriptionTest() {
        let description = viewModel.getDescription()
        XCTAssertEqual("hulk is a marvel superhero", description)
    }
    
    func getImageTest() {
        let image = viewModel.getImage()
        XCTAssertEqual(image, "aaa/landscape_xlarge.bbb")
    }
    
    func getFormattedArrayComicTest() {
        let comics = viewModel.getFormattedArray(feature: .comic)
        XCTAssertEqual(comics, "comic1, comic2.")
    }
    
    func getFormattedArrayEventTest() {
        let events = viewModel.getFormattedArray(feature: .event)
        XCTAssertEqual(events, "event1, event2.")
    }
    
    func getFormattedArrayStoryTest() {
        let stories = viewModel.getFormattedArray(feature: .story)
        XCTAssertEqual(stories, "story1, story2.")
    }
    
    func getFormattedArraySerieTest() {
        let series = viewModel.getFormattedArray(feature: .serie)
        XCTAssertEqual(series, "serie1, serie2.")
    }
}
