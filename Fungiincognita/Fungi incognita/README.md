Приложение позволяет определять по картинке вид гриба

![main](https://github.com/natalykn/OTUS/blob/main/Fungiincognita/Fungi%20incognita/assets/main.PNG)

![detect](https://github.com/natalykn/OTUS/blob/main/Fungiincognita/Fungi%20incognita/assets/detect.PNG)


модель обучалась с использованием Create ML

![модель](https://github.com/natalykn/OTUS/blob/main/Fungiincognita/Fungi%20incognita/assets/modelInfo.png)

Приложение использует Firebase:
- Anonymous - анонимная авторизация 
- Firestore Database для хранения справочной информации по определяемым видам грибов
- Storage для хранения картинок 

Реализованы:
- офлайн режим работы, позволяющий отображать справочную информацию без подключения к сети
- режим кеширования изображения грибов
- автоподсказка при поиске справочной информации о грибе
- сохраняется строка поиска, позволяющая после запуска приложения вернуться к предыдущему поиску


