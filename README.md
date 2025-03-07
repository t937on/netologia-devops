# Домашнее задание к занятию «Базовые объекты K8S»
  
***  
### Задание 1. Создать Pod с именем hello-world  
1. Манифест (yaml-конфигурация) Pod [hello-world](hello-world.yml)  
![png](m8_ex1.2_1_1.png)  
  
2. Подключение локально к Pod с помощью `kubectl port-forward`  
![png](m8_ex1.2_1_4.png)  

3. Вывод значения (в браузере, curl)  
![png](m8_ex1.2_1_5.png)  
![png](m8_ex1.2_1_6.png)  

  
### Задание 2. Создать Service и подключить его к Pod    
1. Pod с именем [netology-web](netology-web.yml)  
![png](m8_ex1.2_2_1.png)  
![png](m8_ex1.2_2_2.png)  
  
2. Service с именем [netology-svc](netology-svc.yml)  
![png](m8_ex1.2_2_4.png)  
![png](m8_ex1.2_2_5.png)  
 
3. Подключение локально к Service с помощью `kubectl port-forward`  
![png](m8_ex1.2_2_7.png)  

4. Вывод значения (в браузере, curl)  
![png](m8_ex1.2_2_8.png)  
![png](m8_ex1.2_2_9.png)  
  
***  
Файлы и скриншоты по задаче можно посмотреть [здесь](/)  
  

