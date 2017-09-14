//
//  TrainingController.swift
//  Dexter
//
//  Copyright © 2017 Clarifai. All rights reserved.
//

import Clarifai_Apple_SDK
import UIKit

class TrainingController: UIViewController, UICollectionViewDataSource ,UICollectionViewDelegate {
    @IBOutlet weak var modelNameTextField: UITextField!
    @IBOutlet weak var previewImageCollectionView: UICollectionView!
    @IBOutlet weak var previewImageLoadingLabel: UILabel!
    @IBOutlet weak var trainModelButton: UIButton!

    var images = [UIImage]()
    let imageUrls = ["https://s3.amazonaws.com/clarifai-api/img2/prod/small/f5ba4c99905d45c1a84f73e857bf93ea/adc25a7632b545c1bb9bb54a7615ad56", "https://s3.amazonaws.com/clarifai-api/img2/prod/small/f5ba4c99905d45c1a84f73e857bf93ea/c3b612684c0d414f9dd14829565b4683", "https://s3.amazonaws.com/clarifai-api/img2/prod/small/f5ba4c99905d45c1a84f73e857bf93ea/dd0b4a8d5a31448fa0141f05c1e75c62"]

    override func viewDidLoad() {
        super.viewDidLoad()
        populateImages()

        modelNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        modelNameTextField.layer.borderWidth = 0.5

        let tap = UITapGestureRecognizer(target: self, action: #selector(TrainingController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    @IBAction func trainModel(_ sender: Any) {
        // Creating Concept(s) with scores. 1 for IS-THING, 0 for NOT-THING
        // A concept is a descriptive attribute regarding a data asset. If used
        // for training you may want to provide a score.
        let concept = Concept.init(id: self.modelNameTextField.text!, name: self.modelNameTextField.text!, score: 1.0)

        // Create Training Concepts Array [Concept]
        let trainingConcepts = [concept]

        // Initialize training inputs
        var trainingInputs = [Input]()

        for index in 0..<images.count {
            // Initialize Image object using URL
            let image = Image(url: URL(string: imageUrls[index]))

            // Create Data Assets and Tag them with Concept(s)
            // A Data Asset is a container for the asset in question, plus metadata
            // related to it
            let dataAsset = DataAsset.init(image: image)
            dataAsset.add(concepts: trainingConcepts)

            // Create Input(s) and Input(s) Array
            // An input object contains the data asset, temporal information, and
            // is a fundamental component to be used by models to train on or predict.
            let input = Input.init(dataAsset:dataAsset)
            trainingInputs.append(input)
        }

        // Create custom trained model on device
        let customModel = Model.init(id: self.modelNameTextField.text!, name: self.modelNameTextField.text!)

        // Train the custom model
        customModel.train(inputs: trainingInputs, completionHandler: {(error: Error?) -> Void in
            if (error != nil) {
                NSLog("Custom model training failed with error \(String(describing: error))")
                return
            }

            // The model is ready to be used to make predictions
            NSLog("Custom model is now trained.")

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "main") as! MainController

            let predictController = storyboard.instantiateViewController(withIdentifier: "predict") as! PredictController
            predictController.customModel = customModel
            let trainController = storyboard.instantiateViewController(withIdentifier: "train")

            controller.setViewControllers([predictController, trainController], animated: true)

            self.present(controller, animated: true, completion: nil)
        })
    }

    // MARK: internal collection view methods
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }

    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = previewImageCollectionView.dequeueReusableCell(withReuseIdentifier: "displayImg", for: indexPath) as! TrainCell
        cell.displayImg.image = images[indexPath.item]

        self.previewImageLoadingLabel.isHidden = true
        self.previewImageCollectionView.isHidden = false
        return cell
    }

    // MARK: general internal methods
    internal func dismissKeyboard() {
        self.view.endEditing(true)
    }

    internal func populateImages() {
        DispatchQueue.main.async(execute: {
            for imageString in self.imageUrls {
                let imageUrl = URL(string: imageString)

                let sessionTask = URLSession.shared
                let request = URLRequest(url: imageUrl!)
                let task = sessionTask.dataTask(with: request, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
                    if (error == nil) {
                        let image: UIImage = UIImage(data: data!)!
                        self.images.append(image)
                        self.previewImageCollectionView.reloadData()
                    }
                })
                task.resume()
            }
        })
    }
}
