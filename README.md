## Домашнее задание к занятию «Использование Terraform в команде»

***
### Задание 1  
Проверка кода с помощью tflint   
![Yandex Cloud](m3_ex5_1_2_1.png)  

![Yandex Cloud](m3_ex5_1_2_2.png)  

Проверка кода с помощью checkov   
![Yandex Cloud](m3_ex5_1_2_3.png)  

Типы ошибок обнаружены в проекте:  
1. в tflint:  
 - Используется сылка на ветку поумолчанию  
 - Отсутствие атрибута required_version  
 - Неиспользуемые переменные  

2. в Checkov:  
 - Используется ссылка на модуль, не указывает на хеш коммита  
 - Используется ссылка на модуль, не указывает на тег версии  
 
***
### Задание 2  
Скриншоты процесса из лекции: YDB, S3 bucket, yandex service account  
![Yandex Cloud](m3_ex5_2__1.png)  

![Yandex Cloud](m3_ex5_2__2.png)  

![Yandex Cloud](m3_ex5_2__3.png)  

![Yandex Cloud](m3_ex5_2__4.png)  

![Yandex Cloud](m3_ex5_2__5.png)  

![Yandex Cloud](m3_ex5_2__6.png)  

![Yandex Cloud](m3_ex5_2__7.png)  

![Yandex Cloud](m3_ex5_2__8.png)  

![Yandex Cloud](m3_ex5_2__9.png)  

![Yandex Cloud](m3_ex5_2__10.png)  

![Yandex Cloud](m3_ex5_2__11.png)  

![Yandex Cloud](m3_ex5_2__12.png)  

![Yandex Cloud](m3_ex5_2__13.png)  

![Yandex Cloud](m3_ex5_2__14.png)  

terraform apply  в другом окне из этой же директории  
![Yandex Cloud](m3_ex5_2__15.png)  

Разблокировка  
![Yandex Cloud](m3_ex5_2__16.png)  

![Yandex Cloud](m3_ex5_2__17.png)  

![Yandex Cloud](m3_ex5_2__18.png)  


***
### Задание 3  
Проверка кода с помощью tflint и checkov  
![Yandex Cloud](m3_ex5_3__1.png)  

![Yandex Cloud](m3_ex5_3__2.png)  

![Yandex Cloud](m3_ex5_3__3.png)  

ссылка на PR для ревью  
![Yandex Cloud](m3_ex5_3__4.png)  


***
### Задание 4  
Переменные с валидацией  
![Yandex Cloud](m3_ex5_4__1.png)  

![Yandex Cloud](m3_ex5_4__2.png)  

Файл с переменными [The file](m3_ex5_4_variables.tf).  


***
### Задание 5  
Переменные с валидацией  
![Yandex Cloud](m3_ex5_5__1.png)  

![Yandex Cloud](m3_ex5_5__2.png)  

Файл с переменными [The file](m3_ex5_5_variables.tf).  

