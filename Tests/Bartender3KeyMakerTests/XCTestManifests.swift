import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Bartender3KeyMakerTests.allTests),
    ]
}
#endif
