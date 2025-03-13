# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»  
  
***  
### Задание 1. Создать Deployment приложений backend и frontend    
1. Манифест [Deployment и Service](frontend.yml) приложения frontend  
![png](m8_ex1.5_1_2.png)  

2. Манифест [Deployment и Service](backend.yml) приложения backend  
![png](m8_ex1.5_1_3.png)  

3. Приложения видят друг друга с помощью `Service`  
![png](m8_ex1.5_1_9.png)  
![png](m8_ex1.5_1_10.png)  
  
### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера     
1. Включить Ingress-controller в MicroK8S  
![png](m8_ex1.5_2_1.png)  
  
2. Манифест [Ingress](ingress.yml)   
![png](m8_ex1.5_2_3.png)  
  
3. Доступ с помощью браузера и curl с локального компьютера  
![png](m8_ex1.5_2_5.png)  
![png](m8_ex1.5_2_6.png)  
![png](m8_ex1.5_2_7.png)  
![png](m8_ex1.5_2_8.png)  
  
4. Выпуск самоподписанного SSL сертификата  
![png](m8_ex1.5_2_10.png)  
  
5. Манифест [Ingress](ingress.yml)   
![png](m8_ex1.5_2_14.png)  
  
6. Доступ по `https` с помощью браузера и curl с локального компьютера  
![png](m8_ex1.5_2_16.png)  
![png](m8_ex1.5_2_17.png)  
![png](m8_ex1.5_2_18.png)  
![png](m8_ex1.5_2_19.png)  
  
  
***  
Файлы и скриншоты по задаче можно посмотреть [здесь](/)  

