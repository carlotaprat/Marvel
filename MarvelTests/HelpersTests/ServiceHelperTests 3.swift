import XCTest
@testable import Marvel

class ServiceHelperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func getMd5Test() {
        let ts = "abcd"
        let md5 = ServiceHelper.app.getMd5(ts: ts)
        XCTAssertEqual(md5, "1ccc9357ec58a0d7e8d6e73d5c856085")
    }
  
    func paginationParametersTest() {
        let params = ServiceHelper.app.paginationParameters(offset: 0)
        XCTAssert(params.keys.contains("offset"))
        XCTAssert(params.keys.contains("apiKey"))
        XCTAssert(params.keys.contains("ts"))
        XCTAssert(params.keys.contains("hash"))
        XCTAssert(params["offset"] is String)
        XCTAssert(params["apiKey"] is String)
        XCTAssert(params["ts"] is String)
        XCTAssert(params["hash"] is String)
    }
    
    func getUrlsTest() {
        let urlCharacters = ServiceHelper.app.getUrl(url: .characters)
        XCTAssertEqual(urlCharacters, "http://gateway.marvel.com/v1/public/characters")
    }

}


/*
 
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
 
 */
