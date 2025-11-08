import Foundation
import SwiftUI

struct StructFunc: View {
    // インスタンス化
    let increment: StructFuncSample = StructFuncSample(value: "struct")
    @State private var value: String = ""

    let staticCount: () = StaticCounter.count = 10

    var body: some View {
        Button {
            // 複数のメソッドで同じvalueを使い回せる
            value = increment.incrementedValue()
        } label: {
            Text("struct")
        }
        .padding()
        Button {
            // 毎回引数で値を渡す必要がある
            // 名前空間の汚染
            value = decrementedValue(value: "func")
        } label: {
            Text("func")
        }
        .padding()
        Text("値: \(value)")

        Text("------static var------")
            .padding()

        let person1: StructPerson = StructPerson(name: "Alice")
        let person2: StructPerson = StructPerson(name: "Bob")
        Text("Person 1: \(person1.name)")
        Text("Person 2: \(person2.name)")
            .padding()

        // インスタンス化しなくてもアクセス可能 :8で値をsetしている(しなかったら初期値の0)
        Text("Static Count: \(StaticCounter.count)")
    }
}

struct StructFuncSample {
    let value: String

    // 機能(メソッド)
    func incrementedValue() -> String {
        return self.value
    }
}

func decrementedValue(value: String) -> String {
    return value
}

// Mark: static var
struct StructPerson {
    let name: String
}

struct StaticCounter {
    static var count: Int = 0
}

#Preview {
    StructFunc()
}
