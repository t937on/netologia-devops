# Дипломный практикум в Yandex.Cloud  

---  
### 1. Создание облачной инфраструктуры   

1. Подготовить  [Terraform](/terraformSA) для сервисного аккаунта и бакета   
![png](m10_1_1_2.png)  
![png](m10_1_1_3.png)  

2. Проверить сервисный аккаунт в яндекс-облаке  
![png](m10_1_1_4.png)  
![png](m10_1_1_5.png)  
![png](m10_1_1_6.png)  

Получить ключи сервисного аккаунта:  
```
terraform output -json
```
  
3. Проверить бакет в яндекс-облаке  
![png](m10_1_1_8.png)  
![png](m10_1_1_10.png)  

4. В GitLab создать проект для инфраструктуры  
![png](m10_1_2_2.png)  
![png](m10_1_2_3.png)  

5. Подготовить  [Terraform](/terraform) основной инфраструктуры  
![png](m10_1_2_4.png)  
![png](m10_1_2_7.png)  
![png](m10_1_2_8.png)  

6. Отправить в удаленный репозиторий  
![png](m10_1_2_9.png)  
![png](m10_1_2_10.png)  

7. Проверить результат в яндекс-облаке  
![png](m10_1_2_12.png)  
![png](m10_1_2_13.png)  
![png](m10_1_2_14.png)  


---  
### 2. Создание Kubernetes кластера     

1. Подключиться по SSH к удалённому серверу мастер-ноды  
![png](m10_2_1.png)  

2. Склонировать репозиторий для подготовки конфигурации с помощью [Kubespray](https://github.com/kubernetes-sigs/kubespray.git)  
![png](m10_2_3.png)  

3. Установить пакет для создания виртуального окружения  
![png](m10_2_6.png)  

4. Установить виртуальное окружение (venv) для Python-проектов, активировать его  
![png](m10_2_7.png)  

5. Установить зависимости  
![png](m10_2_8.png)  

6. На примере базовой установки, создать `inventory` для собственного кластера  
![png](m10_2_9.png)  
![png](m10_2_10.png)  

7. до `ansible-playbook` требуется сертификат на публичный IP-адрес  
![png](m10_2_11.png)  
![png](m10_2_12.png)  

8. Проверить что публичный IP-адрес мастер-ноды есть в списках сертификатов  
![png](m10_2_13.png)  

9. С `localhost` скопировать приватный SSH-ключ на мастер-ноду  
![png](m10_2_14.png)  

10. Запустить плейбук (при наличии ошибок, выполнить запуск повторно, возможно несколько раз)  
![png](m10_2_15.png)  
![png](m10_2_16.png)  

11. Установить конфигурационный файл в домашний каталог  
![png](m10_2_17.png)  

12. Проверить ноды на готовность  
![png](m10_2_19.png)  

13. Проверить чтобы все поды бежали  
![png](m10_2_20.png)  

14. Скопировать конфигурационный файл с мастер-ноды на `localhost`  
![png](m10_2_21.png)  

15. Подставить публичный IP-адрес мастер-ноды  
![png](m10_2_22.png)  

16. Проверить ноды на `localhost`  
![png](m10_2_23.png)  

17. Проверить поды на `localhost`  
![png](m10_2_24.png)  


---
### 3. Создание тестового приложения

1. В `GitLab` создать проект для тестового приложения  
![png](m10_3_1.png)  

2. Склонировать(инициализировать) проект [app](/app)  
![png](m10_3_2.png)  

3. Подготовить приложение и Dockerfile для создания его образа  
![png](m10_3_4.png)  
![png](m10_3_5.png)  

4. Проверить реестр в яндекс-облаке  
![png](m10_3_6.png)  
![png](m10_3_7.png)  
![png](m10_3_8.png)  

5. Создать образ тестового приложения  
![png](m10_3_10.png)  
![png](m10_3_11.png)  
![png](m10_3_12.png)  

6. Создать IAM-токен  
![png](m10_3_13.png)  
![png](m10_3_14.png)  

7. Подготовить автоматический вход (аутентификацию) в Docker-реестр Yandex Container Registry. Добавить образ в реестр  
![png](m10_3_15.png)  

8. Проверить реестр в яндекс-облаке  
![png](m10_3_18.png)  
![png](m10_3_19.png)  


---
### 4. Подготовка cистемы мониторинга и деплой приложения  

1. Создать пространство имен `lesson10`  
![png](m10_4_1_1.png)  

2. Создать в Kubernetes секрет для аутентификации в Docker-реестре  
![png](m10_4_1_2.png)  

3. Создать [манифест](/k8s)  
![png](m10_4_1_3.png)  

4. Создать ресурсы `Kubernetes`  
![png](m10_4_1_4.png)  

5. Проверить ресурсы `Kubernetes`  
![png](m10_4_1_5.png)  

6. Проверить доступ к странице на нодах  
![png](m10_4_1_6.png)  
![png](m10_4_1_7.png)  
![png](m10_4_1_8.png)  
![png](m10_4_1_9.png)  

7. Получить IP-адрес балансировщика  
![png](m10_4_1_10.png)  
![png](m10_4_1_11.png)  

8. Проверить доступ к странице через балансировщик  
![png](m10_4_1_13.png)  
![png](m10_4_1_14.png)  

9. Проверить версию пакетного менеджера `helm` для кубернетис  
![png](m10_4_1_15.png)  

10. Добавить репозиторий с kube-prometheus-stack  
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```
  
![png](m10_4_1_16.png)  
  
11. Создать и отредактировать конфигурацию настроек [values.yaml](/helm_pgan_e)  
![png](m10_4_1_17.png)  
```
  adminUser: admin
  adminPassword: prom-operator
  
  service:
    portName: http-web
    type: NodePort
    nodePort: 30005
```
  
12. Создать пространство имен `monitoring`  
![png](m10_4_1_18.png)  
![png](m10_4_1_19.png)  

13. Деплой `kube-prometheus-stack` в кластер  
![png](m10_4_1_20.png)  

14. Проверить ресурсы  
![png](m10_4_1_21.png)  
![png](m10_4_1_23.png)  

15. Дашборды в `grafana` отображающие состояние `Kubernetes` кластера  
![png](m10_4_1_25.png)  
![png](m10_4_1_27.png)  
![png](m10_4_1_28.png)  
![png](m10_4_1_29.png)  
![png](m10_4_1_30.png)  
![png](m10_4_1_32.png)  


16. В `GitLab` создать `Access Token`  
![png](m10_4_2_1.png)  
![png](m10_4_2_2.png)  

17. Создать пространство имен `atlantis`  
![png](m10_4_2_3.png)  
![png](m10_4_2_4.png)  
  
18. Добавить репозиторий чартов runatlantis helm в helm  
```
helm repo add runatlantis https://runatlantis.github.io/helm-charts
```
  
19. Создать и отредактировать конфигурацию настроек [values.yaml](/helm_atlantis)  
![png](m10_4_2_5.png)  
```
#
#orgAllowlist: gitlab.com/netology_devops/m10_atlantis/*   - так работать не будет
orgAllowlist: gitlab.com/netology_devops/*

#gitlab: {}
gitlab:
  user: "login_in_gitlab"   # это логин пользователя GitLab
  token: "glpat-..."        # это personal access token пользователя GitLab
  secret: "любая_строка"    # это сроковое значение в Webhook "Secret token"
  hostname: "https://gitlab.com/"

# repoConfig: ""
# Example with default configuration:
repoConfig: |
  ---
  repos:
  - id: /.*/
    apply_requirements: []
    workflow: default
    allowed_overrides: []
    allow_custom_workflows: false
  workflows:
    default:
      plan:
        steps: [init, plan]
      apply:
        steps: [apply]

# statefulSet:
# ... закомментировать весь блок оригинала ...
statefulSet:
  securityContext:
    runAsUser: 0          # Запуск под root для полного доступа к файловой системе
    fsGroup: 1000         # Группа, которой принадлежат файлы в томе, обычно 1000 для Atlantis
    fsGroupChangePolicy: "Always"  # Обеспечивает смену группы при несоответствии

# Закомментировать весь блок:
# volumeClaim:
#   enabled: true
#   # -- Disk space available to check out repositories.
#   dataStorage: 5Gi
#   # -- Storage class name (if possible, use a resizable one).
#   storageClassName: ""
#   accessModes: ["ReadWriteOnce"]


dataStorage: 1Gi

storageClassName: "csi-s3"
```
  
20. Настроить интеграцию с `Object Storage` [s3-csi-integration](/s3-csi-integration)  
см. [Настройка Container Storage Interface](https://yandex.cloud/ru/docs/managed-kubernetes/operations/volumes/s3-csi-integration)  
![png](m10_4_2_6.png)  
![png](m10_4_2_7.png)  

21. Проверить, чтобы все поды бежали  
![png](m10_4_2_8.png)  
![png](m10_4_2_9.png)  

22. Деплой `atlantis` в кластер  
![png](m10_4_2_10.png)  

23. Порт `31692` потребуется для веб-хука  
![png](m10_4_2_11.png)  
![png](m10_4_2_12.png)  

24. В `GitLab` в проекте с основной конфигурацией `Terraform` настроить веб-хук  
![png](m10_4_2_14.png)  
![png](m10_4_2_15.png)  
![png](m10_4_2_16.png)  
![png](m10_4_2_17.png)  
![png](m10_4_2_29.png)  

25. Проверить бакет в яндекс-облаке  
![png](m10_4_2_19.png)  
![png](m10_4_2_20.png)  

26. Внести изменения в конфигурацию Terraform, например `outputs.tf`  
![png](m10_4_2_22.png)  
![png](m10_4_2_23.png)  

27. Выполнить `merge-request`  
![png](m10_4_2_25.png)  
![png](m10_4_2_26.png)  

28. В результате успеха `pipeline` в бакете в `repos` фиксируются изменения  
![png](m10_4_2_30.png)  


---
### 5. Установка и настройка CI/CD

1. Создать `runner` в `GitLab`  
![png](m10_5_1.png)  
![png](m10_5_6.png)  

2. Создать пространство имен `gitlab-runner`  
![png](m10_5_7.png)  

3. Создать в Kubernetes секрет для аутентификации в Runner-GitLab  
![png](m10_5_8.png)  
![png](m10_5_9.png)  

4. Добавить репозиторий GitLab Helm-чартов  
```
helm repo add gitlab https://charts.gitlab.io
```
  
![png](m10_5_10.png)  
![png](m10_5_11.png)  
  
5. Создать и отредактировать конфигурацию настроек [values.yaml](/helm_r_gitlab)  
![png](m10_5_12.png)  
```
gitlabUrl: https://gitlab.com/

runners:
  privileged: true
  config:
    [[runners]]
      [runners.kubernetes]
        image = "ubuntu:24.04"

  executor: kubernetes
  secret: gitlab-runner-secret
```
  
6. Деплой `gitlab` в кластер  
![png](m10_5_13.png)  
![png](m10_5_15.png)  

7. Проверить `Runner` в `GitLab`  
![png](m10_5_14.png)  

8. Зашифровать IAM-токен и конфигурационный файл для переменных `GitLab`  
![png](m10_5_16.png)  
![png](m10_5_17.png)  
![png](m10_5_18.png)  

9. Создать переменные в `GitLab`  
![png](m10_5_19.png)  
```
CI_REGISTRY_USER=iam
CI_REGISTRY_PASSWORD= Зашифрованный IAM-token доступа к рееcтру
CI_REGISTRY=cr.yandex/идентификатор_реестра
KUBE_CONFIG= Зашифрованный конфиг Kubernetes
```
  
  
10. Создать [.gitlab-ci.yml](/app)  
![png](m10_5_20.png)  
![png](m10_5_21.png)  

11. Создать изменения в [index.html](/app) для нетегированной версии  
![png](m10_5_22.png)  
![png](m10_5_23.png)  
![png](m10_5_25.png)  
![png](m10_5_28.png)  

12. Проверить реестр в яндекс-облаке  
![png](m10_5_24.png)  

13. Создать изменения в [index.html](/app) для тегированной версии  
![png](m10_5_29.png)  
![png](m10_5_30.png)  
![png](m10_5_31.png)  
![png](m10_5_40.png)  

14. Проверить реестр в яндекс-облаке  
![png](m10_5_35.png)  

15. Проверить веб-страницу   
![png](m10_5_36.png)  


---  
## 6. Что необходимо для сдачи задания?   

1. Репозиторий с конфигурационными файлами Terraform и готовность продемонстрировать создание всех ресурсов с нуля.  
[terraform SA](/terraformSA)  
https://gitlab.com/netology_devops/m10  

2. Пример pull request с комментариями созданными atlantis'ом или снимки экрана из Terraform Cloud или вашего CI-CD-terraform pipeline.  
https://gitlab.com/netology_devops/m10/-/merge_requests  

3. Репозиторий с конфигурацией ansible, если был выбран способ создания Kubernetes кластера при помощи ansible.  
https://github.com/kubernetes-sigs/kubespray.git  

4. Репозиторий с Dockerfile тестового приложения и ссылка на собранный docker image.  
https://gitlab.com/netology_devops/m10-app  
https://console.yandex.cloud/folders/b1ga0af2l4qemvj4maco/container-registry/crpuf2qht9f50tk4cntc/overview  

5. Репозиторий с конфигурацией Kubernetes кластера.  
[k8s](/k8s)  

6. Ссылка на тестовое приложение и веб интерфейс Grafana с данными доступа.  
http://158.160.186.80/  
http://158.160.184.171:3000  
  adminUser: admin  
  adminPassword: prom-operator  

  
***  
Файлы и скриншоты по задаче можно посмотреть [здесь](/)  

