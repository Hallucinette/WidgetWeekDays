import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WidgetShowDaysViewModel()

    var body: some View {
            List {
                ForEach(viewModel.citations, id: \.self) { citation in
                    VStack(alignment: .leading, spacing: 4) {
                    Text(citation.quote)
                    Text(citation.author)
                }
            }
        }
        .padding()
    }
}
