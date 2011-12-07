Rho-with-Rails
---

backend: Rails 3.1.3 
storemanager: Rhodes Client
storemanager: Rhoconnect server


Install
===

```
$ cd backend
$ bundle install
$ cd ../storemanger
$ bundle install
$ cd ../storemanager-server
$ bundle install
```

Run
===

Set up the postgresql database by yourself.

Open a tab on terminal:
```
$ cd backend
$ rake db:create
$ rake db:migrate
$ rails s
```
Open another tab on terminal:
```
$ cd storemanager
$ rake redis:start
```

Open another tab on terminal:
```
$ cd storemanager-server
$ rake rhoconnect:start
```
