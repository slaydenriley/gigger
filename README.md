<div align="center">
<h1>🎶 Gigger 🎶</h1>
<p>A gig management system for bands and venues. A way for music lovers to find shows.</p>
<img max-height: 90% width="100%" src="./app/assets/images/gigger.gif" alt="Gigger gif">
<hr/>
<p>
  Discover:
  <a href="https://www.youtube.com/watch?v=VQF_rvDoiSQ&t=17s&ab_channel=RileySlayden">Demo</a> | <a href="https://slayden-gigger.herokuapp.com/">Deployed App</a>
  </p>
</div>

## Description

Gigger is a management system for bands and venues to keep track of upcoming shows. It also allows for concert-goers to view shows and details about bands and venues, as well as connect with other users. There are 3 main account types in Gigger: "Band Member," "Venue Manager," and "Concert-Goer." Each account type has different abilities and features.

## Inspiration

While building this project, I was still a professional touring banjo player. I was inspired to create a system which would help us keep track of our upcoming shows and venues. Of course, the music collapse of 2020 hit (COVID) and we were never actually able to use this application. Regardless, I had fun building something that I could use in real life, and this project helped me build some fundamental Rails knowledge.

## Installation

This app requires Ruby 2.3.1 and Rails 5.1.4.

Once you have Ruby 2.3.1 and Rails 5.1.4 installed,

* ```fork https://github.com/slaydenriley/gigger & clone locally```
* ```cd gigger from your local directory```
* ```bundle install```
* ```rake db:migrate```
* ```rake db:seed```
* ```thin start --ssl``` Thin start is necessary because FB login requires HTTPS
* ```open browser to localhost:3000```
* ```Sign up for an Account or Login/Create an Account using Facebook```

## Contact
👨‍💻 [LinkedIn](https://linkedin.com/in/rileyslayden)
‍💻 [Portfolio](https://www.rileyslayden.com)
📧 Email: slaydenriley@gmail.com

## Contributing

Bug reports and pull requests are welcome on GitHub at  https://github.com/slaydenriley/gigger. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

This Web Application is available as open source under the terms of the MIT License.
