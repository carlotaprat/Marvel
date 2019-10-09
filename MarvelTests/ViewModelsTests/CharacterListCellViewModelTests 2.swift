import XCTest
@testable import Marvel

class CharacterListCellViewModelTests: XCTestCase {

    var viewModel: CharacterListCellViewModel!
    
    override func setUp() {
        super.setUp()
        let character = Character(characterId: 123, name: "hulk", description: "hulk is a marvel superhero", picture: ImageMarvel(urlPortrait: "aaa", urlLandscape: "bbb"), series: [], comics: [], events: [], stories: [])
        viewModel = CharacterListCellViewModel()
        viewModel.setCharacter(character: character)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func getNameTest() {
        let name = viewModel.getCharacterName()
        XCTAssertEqual(name, "hulk")
    }
    
    func getPortraitImageTest() {
        let image = viewModel.getPicturePortrait()
        XCTAssertEqual(image, "aaa/portrait_xlarge.bbb")
    }
    
    

}
