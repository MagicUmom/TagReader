
import Foundation
import CoreNFC

class NFCHelper: NSObject, NFCNDEFReaderSessionDelegate {
    var onNFCResult: ((Bool, String) -> ())?
    
    func restartSession() {
    let session = NFCNDEFReaderSession(delegate: self,
                                       queue: nil,
                                       invalidateAfterFirstRead: true)
    session.begin()

    }
  
  // MARK: NFCNDEFReaderSessionDelegate
  func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
    guard let onNFCResult = onNFCResult else { return }
    onNFCResult(false, error.localizedDescription)
  }
  
  func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
    guard let onNFCResult = onNFCResult else { return }
    for message in messages {
      for record in message.records {
        if let resultString = String(data: record.payload, encoding: .utf8) {
          onNFCResult(true, resultString)
            
            print("identifier : \(record.identifier):\n",String(data: record.identifier, encoding: .utf8)as String!)
            print("payload : \(record.payload):\n",String(data: record.payload, encoding: .utf8)as String!)
            print("payload : \(record.payload):\n", record.payload as NSData)

            print("type : \(record.type):\n",String(data: record.type, encoding: .utf8)as String!)
            print("typeNameFormat : \(record.typeNameFormat):\n",String(data: record.type, encoding: .utf8)as String!)

        }
      }
    }
  }
}
