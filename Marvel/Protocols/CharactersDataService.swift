import Foundation

protocol CharactersDataService {
    func fetchCharacters(offset: Int, search: String?, onSuccess: @escaping (_ response: PaginatedCharacters?) -> Void, onError: @escaping (_ error: MarvelError) -> Void)
}
