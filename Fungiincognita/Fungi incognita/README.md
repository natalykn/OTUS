The application allows you to determine the type of mushroom from а picture selected from your phone’s photo library using on-device machine learning. The model was trained using Create ML application on the data provided by Kaggle and Mushroom World 

https://www.kaggle.com/datasets/anilkrsah/deepmushroom


![main](https://github.com/natalykn/OTUS/blob/main/Fungiincognita/Fungi%20incognita/assets/main.PNG) ![detect](https://github.com/natalykn/OTUS/blob/main/Fungiincognita/Fungi%20incognita/assets/detect.PNG)

![модель](https://github.com/natalykn/OTUS/blob/main/Fungiincognita/Fungi%20incognita/assets/modelInfo.png)

The application uses following Google’s Firebase services:

- Anonymous Authorization  for anonymous authorization
- Firestore Database for storing reference information on identified mushroom species
- Storage for storing pictures

Also the application Implements:

- offline mode of operation that allows you to display help information without connecting to the network
- mushroom images cache
- auto-suggestion help search about mushrooms
- recent search history allowing you to return to the previous search after the application is launched


