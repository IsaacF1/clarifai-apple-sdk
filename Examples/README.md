<img src="https://clarifai.com/static/images/logo.png" width="256">

# Clarifai Apple SDK Examples

Hello and welcome! Here you will find iOS examples for the Clarifai-Apple-SDK.

# Getting Started

If you don't have a developer account yet, sign up for one at our [Developer Site](https://developer.clarifai.com/) (It is free.)

The Clarifai-Apple-SDK examples require that you have an active API key. In your developer dashboard you will find a section called API Keys. Here you can generate a new api key. Make sure it has **all scopes**.

## API Key

Enter your API Key in the AppDelegate:

```swift
Clarifai.sharedInstance().start(apiKey: "<API Key goes here>")
```

# Dexter

Dexter can help you understand how to use Clarifai's AI in your app by showing how to use prediction and custom training features.

## Prediction

Once the main prediction view has been loaded you will see there is a main image you will use for predictions.
The main image is a pre selected on-device image.

> In the PredictController.swift file there is an example of how prediction can occur from on-devices images.
<br>
When you click predict, you will be presented with a list of the predictions the AI predicts your image to be and the confidence score. The list is ordered descending order, starting with the most likely prediction.

### Important Methods

The prediction happens in the **predict** method of the [PredictController.swift](https://github.com/Clarifai/private-clarifai-apple-sdk/blob/examples/Examples/Dexter/Dexter/controllers/PredictController.swift#L46-L75) file.<br>

The predict method is an example of how to create a Clarifai Image, Data Asset, and Input.
The model takes in inputs and computes predictions.

The sample code predicts with one input, but the model can give predictions on multiple inputs in one call.

```swift
self.model.predict(inputs, completionHandler: {....})
```

## Training

Now that we have explored predictions we can take a look at training our own custom model.
You can click the Train tab to switch gears to custom training.

In the Training tab there are 3 pre selected images hosted remotely and being accessed via their URLs.

> In the TrainingController.swift file there is an example of creating a Clarifai Image from an image url.
<br>

Give the model a name and click to train your custom model.

### Important Methods

The custom training happens in the **trainModel** method of the [TrainingController.swift](https://github.com/Clarifai/private-clarifai-apple-sdk/blob/examples/Examples/Dexter/Dexter/controllers/TrainingController.swift#L31-L84) file.<br>

The **trainModel** method is an example of how to create a Clarifai Image, Concept, Data Asset, Input, and Custom Model.

## Custom Model Prediction

Custom Model Trained and ready to be predicted on.
You will know your model is trained by the appearance of the new predict screen.
In this screen you will see there is a segment control at the top used to toggle between predicting with the custom trained model or the general model.
