###

```bash
swiftc -o a.out imageanalyzer.swift && ./a.out
```

From other tests, `ImageAnalyzer` seems to be using `Vision.VNRecognizeTextRequest`
under the hood (identified text is the same with the same mistakes).
