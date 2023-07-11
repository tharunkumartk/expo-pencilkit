//
//  PencilkitView.swift
//  ExpoPencilkit
//
//  Created by Tharun Kumar Tiruppali Kalidoss on 7/11/23.
//

import Foundation
import PencilKit

class PencilkitView: UIView {
    lazy var canvas: PKCanvasView = {
        let view = PKCanvasView()
        if #available(iOS 14.0, *)  {
            view.drawingPolicy = .anyInput
        }

        view.minimumZoomScale = 1
        view.maximumZoomScale = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var sampleId: String = "test";
    var url: String = "";
    var _id: String = UUID().uuidString;
    var width: Numeric = 100
    var height: Numeric = 100

    override init(frame:CGRect) {
      super.init(frame: frame)
      clipsToBounds = true
      addSubview(canvas)
    }

    required init?(coder:NSCoder) {
        fatalError("Coder init has not been implemented yet")
    }

    override func layoutSubviews() {
        canvas.delegate = self
        canvas.becomeFirstResponder()
        canvas.frame = bounds
    }   
        
    func setSampleId(_ newSample: String) {
        self.sampleId=newSample
    }

    func setURL(_ newURL: String) {
        self.url=newURL
    }

    func setID(_ newID: String) {
        self._id=newID
    }

    func setWidth(_ newWidth: Numeric) {
        self.width=newWidth
    }

    func setHeight(_ newHeight: Numeric) {
        self.height=newHeight
    }
}
extension PencilkitView: PKCanvasViewDelegate{
    func convertPKDrawingToDictionary(drawing: PKDrawing) -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if #available(iOS 14.0, *)  {
            
            
            // Convert strokes to an array of dictionaries
            let strokes = drawing.strokes.map { stroke -> [String: Any] in
                let path = [
                    "points": stroke.path.map { item -> [String: Any] in
                        return ["x" : item.location.x, "y" : item.location.y, "p": item.force, "alt": item.altitude, "azi": item.azimuth, "t": item.timeOffset]
                    }
                ]
                return path
            }
            
            // Add strokes array to the dictionary
            dictionary["strokes"] = strokes
        }
        dictionary["image"] = drawing.image(from: frame, scale: 3).pngData()?.base64EncodedString()
        dictionary["_id"] = self._id
        dictionary["sampleId"] = self.sampleId;
        dictionary["boundingBox"] = ["width": self.width, "height": self.height]
        return dictionary
    }
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
      let url = URL(string: self.url)!
        let params = ["drawing": convertPKDrawingToDictionary(drawing: canvasView.drawing)] as Dictionary<String, Any>
        var request = URLRequest(url:  url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
            } catch {
                print("error")
            }
        })
      task.resume()
    }
}
