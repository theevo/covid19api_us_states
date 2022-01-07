import Foundation
import _Concurrency

func decodeThatJSON(_ fileUrl: URL) async {
    do {
        let (data, _) = try await URLSession.shared.data(from: fileUrl)
        
        do {
            let decodedResponse = try JSONDecoder().decode([Covid19APIByCountryResponse].self, from: data)
            
            let provinces = decodedResponse.map { response in
                response.province
            }.filter { !$0.isEmpty }
            
            let uniqueProvinces = Set(provinces)
            
            let sortedProvinces = Array(uniqueProvinces).sorted()
            
            print(sortedProvinces.count, "States")
            printWithLineBreaks(sortedProvinces)
        } catch let e {
            print(e)
        }
    } catch let e {
        print(e)
    }
}

guard let fileUrl = Bundle.main.url(forResource: "US_sample", withExtension: "json") else { fatalError() }

Task {
    await decodeThatJSON(fileUrl)
}

func printWithLineBreaks(_ arr: [String]) {
    let commaCount = arr.count - 1
    var printThis = "["
    
    var punctuationArr = Array(repeating: ",", count: commaCount)
    punctuationArr.append("]")
    
    for i in 0..<arr.count {
        printThis.append("\"" + arr[i] + "\"" + punctuationArr[i] + "\n")
    }
    
    print(printThis)
}
