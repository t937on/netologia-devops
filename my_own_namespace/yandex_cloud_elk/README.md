# Ansible Collection - my_own_namespace.yandex_cloud_elk

Documentation for the collection.

Коллекция my_own_namespace.yandex_cloud_elk 
предоставляет модуль и роль для создания текстового файла на хосте с заданным содержимым. 

Чтобы установить коллекцию, используйте следующую команду:
ansible-galaxy collection install my_own_namespace.yandex_cloud_elk


Модуль "my_own_module"

Модуль "my_own_module" создает текстовый файл на хосте.
Параметры
path (строка, обязательный): Путь к файлу, который необходимо создать.
content (строка, обязательный): Содержимое, которое будет записано в файл.
Пример использования модуля:
- my_own_module:
    path: "/tmp/test.txt"
    content: "Hello, World"

Роль: "single_task"
Роль "single_task" использует модуль "my_own_module" для создания файла с параметрами по умолчанию.

Параметры по умолчанию
path: /tmp/myfile.txt
content: "Hello, World"
Пример использования роли:
- hosts: localhost
  gather_facts: no
  roles:
    - single_task


Playbook
Пример playbook, который использует роль:
- hosts: localhost
  gather_facts: no
  roles:
    - single_task
