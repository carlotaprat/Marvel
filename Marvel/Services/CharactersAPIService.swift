import Foundation
import Alamofire

struct CharactersAPIService: CharactersDatabaseService {

    func fetchCharacters(offset: Int, search: String?, onSuccess: @escaping(_ pagination: PaginatedCharacters?) -> Void, onError: @escaping (_ error: MarvelError) -> Void) {
        
        let url = String(format: ServiceHelper.app.getUrl(url: .characters))
        var params = ServiceHelper.app.paginationParameters(offset: offset) as Parameters
        
        if let searchText = search {
            params["nameStartsWith"] = searchText
        }
        
        AF.request(url, method: .get, parameters: params)
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    
                    guard let data = response.data else {
                        onError(.internalError)
                        return
                    }
                    do {
                        let request = try JSONDecoder().decode(Response.self, from: data)
                        onSuccess(request.data)
                        
                    } catch {
                        onError(.internalError)
                    }
                    
                case .failure:
                    onError(.serviceError)
                }
        }
        
    }
    
    
    

    
    
    
}
