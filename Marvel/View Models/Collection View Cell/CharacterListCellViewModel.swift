import Foundation

class CharacterListCellViewModel {
    
    private var character: Character?
    
    func setCharacter(character: Character) {
        self.character = character
    }
    
    func getCharacterName() -> String {
        return self.character?.name ?? ""
    }
    
    func getPicturePortrait() -> String {
        return character?.picture?.urlPortrait ?? ""
    }
    
    
}
