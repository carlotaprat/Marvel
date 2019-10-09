import XCTest
@testable import Marvel

class CharactersListViewModelTests: XCTestCase {

    var viewModel: CharactersListViewModel!
    var mockCharactersDatabaseService: MockCharactersDatabaseService!
    
    override func setUp() {
        super.setUp()
        viewModel = CharactersListViewModel()
        mockCharactersDatabaseService = MockCharactersDatabaseService()
    }

    override func tearDown() {
        super.tearDown()
        viewModel = nil
        mockCharactersDatabaseService = nil
    }
    
    func getDataModel() -> [Character] {
        var dataModel = [Character]()
        for character in mockCharactersDatabaseService.paginated.results {
            dataModel.append(character)
        }
        return dataModel
    }
    
    func getDataModelTotal() -> Int {
        let dataModelTotal = mockCharactersDatabaseService.paginated.total
        return dataModelTotal
    }
    
    func getCharacterTest() {
        let dataModel = getDataModel()
        let firstCharacter = dataModel[0]
        let firstCharacterTest: Character = viewModel.getCharacter(index: 0)!
        XCTAssertEqual(firstCharacter.characterId, firstCharacterTest.characterId)
    }
    
    func getCharactersCountTest() {
        let dataModel = getDataModel()
        let count = dataModel.count
        let countTest = viewModel.getCharactersCount()
        XCTAssertEqual(count, countTest)
    }
    
    func getTotalCharactersTest() {
        let dataModel = getDataModel()
        let total = dataModel.count
        let totalTest = viewModel.getTotalCharacters()
        XCTAssertEqual(total, totalTest)
    }
    
}


class MockCharactersDatabaseService: CharactersDatabaseService {
    
    var paginated: PaginatedCharacters!
    
    init() {
        let firstCharacter = Character(characterId: 123, name: "hulk", description: "hulk is a marvel superhero", picture: ImageMarvel(urlPortrait: "aaa", urlLandscape: "bbb"), series: [], comics: [], events: [], stories: [])
        let secondCharacter = Character(characterId: 456, name: "spiderman", description: "spiderman is a marvel superhero", picture: ImageMarvel(urlPortrait: "ccc", urlLandscape: "ddd"), series: [], comics: [], events: [], stories: [])
        var characters = [Character]()
        characters.append(firstCharacter)
        characters.append(secondCharacter)
        let paginated = PaginatedCharacters(results: characters, total: 2, offset: 0, limit: 20, count: 0)
        self.paginated = paginated
    }
    
    func fetchCharacters(offset: Int, search: String?, onSuccess: @escaping(_ pagination: PaginatedCharacters?) -> Void, onError: @escaping (_ error: MarvelError) -> Void) {
        onSuccess(paginated)
    }
    
    
}
