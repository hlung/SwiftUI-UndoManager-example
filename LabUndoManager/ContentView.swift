//
//  ContentView.swift
//  LabUndoManager
//
//  Created by Hlung on 29/3/25.
//

import SwiftUI

class ViewModel: ObservableObject {
  @Published var array: [Int] = [0, 1, 2]
}

struct ContentView: View {

  @Environment(\.undoManager) var undoManager
  @StateObject private var viewModel = ViewModel()

  var body: some View {
    VStack {
      HStack {
        Button("Add") {
          add()
        }
        Button("Remove") {
          remove()
        }
      }
      HStack {
        Button("Undo") {
          undoManager?.undo()
        }
        .disabled(!(undoManager?.canUndo ?? false))
        Button("Redo") {
          undoManager?.redo()
        }
        .disabled(!(undoManager?.canRedo ?? false))
      }

      ForEach(viewModel.array.indices, id: \.self) { index in
        Text("\(viewModel.array[index])")
      }
      Spacer()
    }
    .padding()
  }

  func add() {
    viewModel.array.append(viewModel.array.count)
    undoManager?.registerUndo(withTarget: viewModel, handler: { viewModel in
      remove()
    })
  }

  func remove() {
    viewModel.array.removeLast()
    undoManager?.registerUndo(withTarget: viewModel, handler: { viewModel in
      add()
    })
  }

}

#Preview {
  ContentView()
}
