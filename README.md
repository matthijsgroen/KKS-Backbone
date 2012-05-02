KKS-Backbone
============

Environment setup for KKS

Clean installation
==================

    # To bypass ruby SSL errors:
    wget https://raw.github.com/gist/2574804/d165373fad72307c50a4fef78c945e56ce2eb653/rails-backbone.rb
    rails new my_backbone_app -T --database=sqlite3 -m rails-backbone.rb

This sets up a blank rails application using Rspec, Konacha, Backbone and HAML-Coffeescript JST templates.


