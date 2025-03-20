# Домашнее задание к занятию «Конфигурация приложений»  
  
***  
### Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницуs  
1. Манифест [Deployment](nginx-multitool-deploy.yml) приложения из контейнеров `nginx` и `multitool`  
![png](m8_ex2.3_1_1.png)  
![png](m8_ex2.3_1_2.png)  
![png](m8_ex2.3_1_3.png)  
  
2. Манифест [ConfigMap и Deployment](nginx-multitool-deploy-2.yml) приложения   
![png](m8_ex2.3_1_5.png)  
![png](m8_ex2.3_1_6.png)  
  
3. Манифест [ConfigMap, Deployment, Service](nginx-multitool-deploy-3.yml) приложения   
![png](m8_ex2.3_1_8.png)  
![png](m8_ex2.3_1_9.png)  
  
4. Вывод `curl`   
![png](m8_ex2.3_1_10.png)  
  
  
### Задание 2. Создать приложение с вашей веб-страницей, доступной по HTTPS  
1. Манифест [ConfigMap, Deployment, Service](nginx.yml) приложения `nginx`  
![png](m8_ex2.3_2_5.png)  
![png](m8_ex2.3_2_6.png)  
![png](m8_ex2.3_2_7.png)  
  
2. Выпуск самоподписного сертификата SSL  
![png](m8_ex2.3_2_8.png)  
  
3. Манифест [Secret](nginx-secret.yml) сертификата  
![png](m8_ex2.3_2_12.png)  
![png](m8_ex2.3_2_13.png)  
![png](m8_ex2.3_2_14.png)  
  
4. Манифест [Ingress](nginx-ingress.yml)  
![png](m8_ex2.3_2_15.png)  
![png](m8_ex2.3_2_16.png)  
  
5. Доступ к приложению по HTTPS  
![png](m8_ex2.3_2_17.png)  
![png](m8_ex2.3_2_18.png)  
  
***  
Файлы и скриншоты по задаче можно посмотреть [здесь](/)  

