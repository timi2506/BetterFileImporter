//
//  BetterFileImporter.swift
//  BetterFileImporter
//
//  Created by timi2506 on 13.05.2025.
//

public struct BetterFileImporter: ViewModifier {
    @Binding var isPresented: Bool
    @State var allowedContentTypes: [UTType]
    @State var allowsMultipleSelection: Bool?
    @State var presentationType: BetterFileImporterPresentationType?
    @State var onDocumentsPicked: ([URL]) -> Void
    public func body(content: Content) -> some View {
        switch presentationType {
        case .sheet:
            content
                .sheet(isPresented: $isPresented) {
                    FileImporterRepresentableView(allowedContentTypes: allowedContentTypes, allowsMultipleSelection: allowsMultipleSelection ?? false, onDocumentsPicked: onDocumentsPicked)
                }
        case .fullscreen:
            content
                .fullScreenCover(isPresented: $isPresented) {
                    FileImporterRepresentableView(allowedContentTypes: allowedContentTypes, allowsMultipleSelection: allowsMultipleSelection ?? false, onDocumentsPicked: onDocumentsPicked)
                }
        case nil:
            content
                .sheet(isPresented: $isPresented) {
                    FileImporterRepresentableView(allowedContentTypes: allowedContentTypes, allowsMultipleSelection: allowsMultipleSelection ?? false, onDocumentsPicked: onDocumentsPicked)
                }
        }
        
    }
}
extension View {
    public func betterFileImporter(isPresented: Binding<Bool>, allowedContentTypes: [UTType], allowsMultipleSelection: Bool? = nil, presentationType: BetterFileImporterPresentationType? = nil, onDocumentsPicked: @escaping ([URL]) -> Void) -> some View {
        modifier(BetterFileImporter(isPresented: isPresented, allowedContentTypes: [.data], presentationType: presentationType, onDocumentsPicked: onDocumentsPicked))
    }
}

public enum BetterFileImporterPresentationType {
    case sheet
    case fullscreen
}

//
//  Originally: UIKitFileImporter.swift
//  Feather (https://github.com/khcrysalis/Feather)
//
//  Created by samara on 23.04.2025.
//

import SwiftUI
import UniformTypeIdentifiers

public struct FileImporterRepresentableView: UIViewControllerRepresentable {
	public var allowedContentTypes: [UTType]
	public var allowsMultipleSelection: Bool = false
	public var onDocumentsPicked: ([URL]) -> Void
	
	public init(
		allowedContentTypes: [UTType],
		allowsMultipleSelection: Bool = false,
		onDocumentsPicked: @escaping ([URL]) -> Void
	) {
		self.allowedContentTypes = allowedContentTypes
		self.allowsMultipleSelection = allowsMultipleSelection
		self.onDocumentsPicked = onDocumentsPicked
	}
	
	public func makeCoordinator() -> Coordinator {
		Coordinator(onDocumentsPicked: onDocumentsPicked)
	}
	
	public func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
		let picker = UIDocumentPickerViewController(forOpeningContentTypes: allowedContentTypes, asCopy: true)
		picker.delegate = context.coordinator
		picker.allowsMultipleSelection = allowsMultipleSelection
		return picker
	}
	
	public func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {}
	
	public class Coordinator: NSObject, UIDocumentPickerDelegate {
		var onDocumentsPicked: ([URL]) -> Void
		
		init(onDocumentsPicked: @escaping ([URL]) -> Void) {
			self.onDocumentsPicked = onDocumentsPicked
		}
		
		public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
			onDocumentsPicked(urls)
		}
		
		public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
			onDocumentsPicked([])
		}
	}
}
