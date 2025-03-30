# Домашнее задание к занятию «Helm»  
  
***  
### Задание 1. Подготовить Helm-чарт для приложения   
1. Манифест [Deployment](./netology-chart/templates/nginx-deploy.yml) приложения c `nginx`  
![png](m8_ex2.5_1_3.png)  
  
2. Манифест [Deployment](./netology-chart/templates/multitool.yml) приложения c `multitool`  
![png](m8_ex2.5_1_4.png)  
  
3. Манифест [Service](./netology-chart/templates/nginx-multitool-svc.yml) приложения  
![png](m8_ex2.5_1_5.png)  
  
4. Переменные [чарта](./netology-chart/values.yaml)  
![png](m8_ex2.5_1_6.png)  
  
5. Проверка манифестов без развертывания в кластере  
![png](m8_ex2.5_1_7.png)  
![png](m8_ex2.5_1_8.png)  
  
6. Установка helm чарта в кластере  
![png](m8_ex2.5_1_9.png)  
  
7. Список объектов в Kubernetes  
![png](m8_ex2.5_1_10.png)  
  
8. Список релизов helm  
![png](m8_ex2.5_1_11.png)  
  
9. Проверка результата  
![png](m8_ex2.5_1_12.png)  
  
***  
### Задание 2. Запустить две версии в разных неймспейсах  
1. Переменные [чарта](./netology-chart/values-app1.yaml) для namespace=app1  
![png](m8_ex2.5_2_2.png)  
  
2. Проверка манифестов без развертывания в кластере в namespace=app1  
![png](m8_ex2.5_2_3.png)  
![png](m8_ex2.5_2_4.png)  
  
3. Установка helm чарта в кластере в namespace=app1  
![png](m8_ex2.5_2_5.png)  
  
4. Список объектов в Kubernetes в namespace=app1  
![png](m8_ex2.5_2_6.png)  
  
5. Список релизов helm  
![png](m8_ex2.5_2_7.png)  
  
6. Проверка результата в namespace=app1  
![png](m8_ex2.5_2_8.png)  
  
7. Переменные [чарта](./netology-chart/values-app2.yaml) для namespace=app2  
![png](m8_ex2.5_2_9.png)  
  
8. Проверка манифестов без развертывания в кластере в namespace=app2  
![png](m8_ex2.5_2_10.png)  
![png](m8_ex2.5_2_11.png)  
  
9. Установка helm чарта в кластере в namespace=app2  
![png](m8_ex2.5_2_12.png)  
  
10. Список объектов в Kubernetes в namespace=app2  
![png](m8_ex2.5_2_13.png)  
  
11. Список релизов helm  
![png](m8_ex2.5_2_14.png)  
  
12. Проверка результата в namespace=app2  
![png](m8_ex2.5_2_15.png)  
  
13. Список объектов в Kubernetes в всех namespace  
![png](m8_ex2.5_2_16.png)  
![png](m8_ex2.5_2_17.png)  
![png](m8_ex2.5_2_18.png)  
  
  
***  
Файлы и скриншоты по задаче можно посмотреть [здесь](/)  

