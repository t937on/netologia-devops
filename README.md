# Домашнее задание к занятию «Как работает сеть в K8s»  
  
***  
### Задание 1. Создать сетевую политику или несколько политик для обеспечения доступа
1. Кластер K8s с установленным сетевым плагином Calico
![png](m8_ex3.3_0_25.png)  

2. Манифест [Deployment, Service](frontend.yml) приложения `frontend`  
![png](m8_ex3.3_1_1.png)  

3. Манифест [Deployment, Service](backend.yml) приложения `backend`  
![png](m8_ex3.3_1_2.png)  

4. Манифест [Deployment, Service](cache.yml) приложения `cache`  
![png](m8_ex3.3_1_3.png)  

5. Манифест [NetworkPolicy](frontend-to-backend-policy.yml) политики `frontend -> backend`  
![png](m8_ex3.3_1_4.png)  

6. Манифест [NetworkPolicy](backend-to-cache-policy.yml) политики `backend -> cache`  
![png](m8_ex3.3_1_5.png)  

7. Манифест [NetworkPolicy](forbid-ingress.yml) политики запрещения других подключений  
![png](m8_ex3.3_1_6.png)  

8. Создать namespace `app`  
![png](m8_ex3.3_1_7.png)  

9. Создать ресурсы кластера  
![png](m8_ex3.3_1_10.png)  
![png](m8_ex3.3_1_11.png)  

10. Проверить ресурсы кластера  
![png](m8_ex3.3_1_12.png)  
![png](m8_ex3.3_1_13.png)  

11. Результат:  

    11.1. Проверить доступ с `frontend` (доступ разрешен только на `backend`)   
      ![png](m8_ex3.3_1_14.png)  

    11.2. Проверить доступ с `backend` (доступ разрешен только на `cache`)   
      ![png](m8_ex3.3_1_15.png)  

    11.3. Проверить доступ с `cache` (доступ запрещён)   
      ![png](m8_ex3.3_1_16.png)  
  
***  
Файлы и скриншоты по задаче можно посмотреть [здесь](/)  

