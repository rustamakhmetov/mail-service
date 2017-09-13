# Пример сервиса по созданию шаблонов писем и их отправке на Ruby on Rails

  - Реализован слой моделей: Account, Message.
  - В качестве шаблонизатора для писем использован 'slim'

### Установка

  - пример конфигурации бд (config/database.yml.sample)

```sh
$ bundle install
$ rake db:create
$ rake db:migrate
```

  - Создание по одному экземпляру Message и Account

```sh
$ rake db:seed
```

### Запуск тестов

```sh
$ rspec spec/
```

### Отправка тестового письма
```sh
$ rake send_email
```
