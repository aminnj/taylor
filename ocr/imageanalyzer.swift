// Code credit: ChatGPT

import VisionKit
import AppKit
import CoreGraphics

// Replace with the path to your image file
let imagePath = "./input.png"

// Load the image
guard let image = NSImage(contentsOfFile: imagePath),
      let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
    print("Failed to load image")
    exit(1)
}

// Create a configuration object for the ImageAnalyzer
// Specify the types of analysis you want to perform
let analysisTypes: ImageAnalyzer.AnalysisTypes = [.text]
let configuration = ImageAnalyzer.Configuration(analysisTypes)

// Create an ImageAnalyzer object
let analyzer = ImageAnalyzer()

// Assuming the image orientation is up, but update this based on your image
let orientation = CGImagePropertyOrientation.up

// Analyze the image
Task {
    do {
        let analysis = try await analyzer.analyze(cgImage, orientation: orientation, configuration: configuration)
        // Handle the analysis results
        // print("Analysis successful")
        // Example: Print recognized text
        print(analysis.transcript)
        exit(1)
        // if let recognizedText = analysis.text?.recognizedStrings {
        //     for text in recognizedText {
        //         print("Recognized text:", text)
        //     }
        // }
    } catch {
        // Handle any errors
        print("Analysis failed: \(error.localizedDescription)")
    }
}

// Run the run loop to wait for the analysis to complete
RunLoop.current.run()

