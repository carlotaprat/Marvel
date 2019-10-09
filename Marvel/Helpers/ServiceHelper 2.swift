import Foundation
import Alamofire
import CommonCrypto
import SwiftKeychainWrapper

class ServiceHelper {
    
    static var app: ServiceHelper = {
        return ServiceHelper()
    }()
    
    func getTimestamp() -> String {
        return String(Int(Date().timeIntervalSince1970))
    }
    
    func getMd5(ts: String) -> String {
        
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let privateKey = KeychainWrapper.standard.string(forKey: "privateKey") ?? ""
        let publicKey = KeychainWrapper.standard.string(forKey: "publicKey") ?? ""
        let concatenatedString = ts + privateKey + publicKey
        let messageData = concatenatedString.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        
        let md5Hex =  digestData.map { String(format: "%02hhx", $0) }.joined()
        return String(md5Hex)
    }
    
    func paginationParameters(offset: Int) -> Parameters {
        
        let times = String(getTimestamp())
        let md5hash = getMd5(ts: times)
        let params: Parameters = [
            "apikey": KeychainWrapper.standard.string(forKey: "publicKey") ?? "",
            "ts": times,
            "hash": md5hash,
            "offset": String(offset)
        ]
        return params
    }
    
    func getUrl(url: APIUrls) -> String {
        return url.getUrl
    }
    
}
