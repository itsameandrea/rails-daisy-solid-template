# Rails 🤝 SQlite 🤝 TailwindCSS 🤝 DaisyUI 🤝 SolidQueue 🤝 SolidCache

Simple, barebones template to start a new rails project with

* Rails 7.1.2
* Ruby 3.3.0
* Turbo 8
* Tailwind 3.4.1
* DaisyUI 4.5.0
* ViewComponents (set up as per this gem of a series by [evilmartials](https://evilmartians.com/chronicles/viewcomponent-in-the-wild-building-modern-rails-frontends))

This template is using SolidQueue and SolidCache backed by different sqlite DBs (as per [@fractaledmind]( https://fractaledmind.github.io/2024/01/02/sqlite-quick-tip-multiple-databases))

#### Update 08/08/2024

* Added Devise for authentication
* Added some basic UI components + a form builder strongly inspired by [daisy-on-rails](https://github.com/adrienpoly/daisy-on-rails/)
* Added Kamal + Docker default configuration
* Added some basic config to run R2 with activestorage as per [this guide](https://kirillplatonov.com/posts/activestorage-cloudflare-r2/)
* Added FilePond for file uploads
* Added Toastify for flash notifications
* Switched javascript bundling to vite
* Added `annotate` gem to generate documentation for models
* Replaced `panoptic` with rails' mission control to monitor background jobs
