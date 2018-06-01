Administrador de Instituciones
=======================

El presente sistema propone la administración de instituciones educativas como academias, escuelas e institutos. 

Usuarios con múltiples roles guardados en una columna de la tabla User, sin necesidad de usar un modelo Role.

Main features included by default:

- [Devise](https://github.com/plataformatec/devise) with default modules.
- [AdminLTE](https://almsaeedstudio.com/) (v.2.3.7) theme included for the admin panel.
- [SendGrid](https://github.com/stephenb/sendgrid) gem for mailing.
- Continuous testing with [Guard](https://github.com/guard/guard).
- Puma server.
- PostgreSQL database.
- ERB template engine.

Regular development environment setup
-------------------------------------

To start using this template, you only have to do the typical ***Rails*** things:

* Install ***Ruby*** version 2.4.0 (using [RVM](https://github.com/rvm/rvm) or [RBenv](https://github.com/sstephenson/rbenv) or [asdf](https://github.com/asdf-vm/asdf) or whatever).

* Clone the repo and do the ***bundle install*** thing:

```sh
user@computer:~$ git clone ...
user@computer:~$ cd YOUR_APP_NAME_HERE
user@computer:/YOUR_APP_NAME_HERE$ bundle install
```

Duplicate all the `.example` files on the project (`config/database.yml.example`, `config/secrets.yml.example`, `.env.example`...) removing the `.example` extension, and complete them with the proper information. Then execute this to create the database:

```sh
user@computer:/YOUR_APP_NAME_HERE$ rake db:setup
user@computer:/YOUR_APP_NAME_HERE$ rake db:seed
```

And you're ready to go. Test if all it's ok by starting a server and check it with `rails s`. To enable any AdminLTE plugin, just simply open the `assets/javascripts/application_back.js` and `assets/stylesheets/application_back.scss` manifest files to require the needed asset files.

You can see the complete documentation of the AdminLTE theme [here](https://almsaeedstudio.com/themes/AdminLTE/documentation/index.html) in order to add all the widgets that you need for your application.
