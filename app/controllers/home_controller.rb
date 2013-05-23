# encoding: UTF-8
class HomeController < ApplicationController
  def index
    @speakers = [
      [ id: "1",
        name: "Tommy Rochette",
        twitter: "trochette",
        bio: "Sr. Consultant at Universal Mind, focused on building rich Internet applications with HTML5 and Javascript. ",
        image: "new/speakers/tommy.svg"
      ],
      [ id: "2",
        name: "Johnny Winn",
        twitter: "johnny_rugger",
        bio: "Hashrocket Rocketeer, Ruby developer with a passion for software craftmanship.",
        image: "new/speakers/johnn.svg"
      ],
      [ id: "3",
        name: "konstantin gredeskoul",
        twitter: "kig",
        bio: "Narrow specialist in wide generality, who works at wanelo.com and has worked on too many Ruby Applications.",
        image: "new/speakers/gredeskoul.svg"
      ],
      [ id: "4",
        name: "Ron Evans",
        twitter: "deadprogram",
        bio: "Software developer and OSS contributor, author and speaker; principal at The Hybrid Group in LA. Habla español!",
        image: "new/speakers/ron.svg"
      ],
      [ id:"5",
        name: "Nick sutterer",
        twitter: "apotonick",
        bio: "Ruby OSS contributor and speaker. His projects Cells and Apotomo brings view modularity and event-driven programming to Rails.",
        image: "new/speakers/nick.svg"
      ],
      [ id: "6",
        name: "javier cervantes",
        twitter: "solojavier",
        bio: "Apprentice of artesanal software development, who works at Hybrid Group and runs the Ruby GDL user group.",
        image: "new/speakers/javier.svg"
      ],
      [ id: "7",
        name: "iván acosta rubio",
        twitter: "ivanacostarubio",
        bio: "Venezuelan in Mexico, co-founder of SoftwareCriollo.com, building Meals.mx",
        image: "new/speakers/ivan.svg"
      ],
      [ id: "8",
        name: "mario a chávez",
        twitter: "Mario_Chavez",
        bio: "A software developer who woke up to Ruby after a few boring years in .NET",
        image: "new/speakers/mario.svg"
      ],
      [ id: "9",
        name: "francisco viramontes",
        twitter: "kidpollo",
        bio: "Mac lover and Rubyst, experienced on building fast, secure and reliable Ruby on Rails enterprise applications.",
        image: "new/speakers/paco.svg"
      ],
      [ id: "10",
        name: 'norberto hernández',
        twitter: "norbertohdez",
        bio: "Web designer and front-end developer, passionate about HTML5 and CSS3, proud vegetarian.",
        image: "new/speakers/norberto.svg"
      ],
      [ id: "11",
        name: "edwin cruz",
        twitter: "softr8",
        bio: "Crazy dude obsessed with high performance web applications, specialized in Ruby on Rails, scalable solutions and team work.",
        image: "new/speakers/edwin.svg"
      ],
      [ id: "12",
        name: "Herman Moreno",
        twitter: "supherman",
        bio: "Software engineer, passionate programmer, Rubyst and DIY guy, also a best code practices enthusiast.",
        image: "new/speakers/herman.svg"
      ],
      [ id: "13",
        name: "jon dean",
        twitter: "jonathanedean",
        bio: "Web sites builder, in love with OSS, focused on Ruby on Rails, Javascript and CSS. Working at Stitch Fix.",
        image: "new/speakers/dean.svg"
      ],
      [ id: "14",
        name: "eric saxby",
        twitter: "ecdysone",
        bio: "Software engineer at Wanelo.com, uses Chef to manage their growing infraestructure. Worked on a circus once.",
        image: "new/speakers/eric.svg"
      ],
      [ id: "15",
        name: "manuel vidaurre",
        twitter: "mvidaurre",
        bio: "Mexican developer, writer and salesman; self taught, eager for knowledge.",
        image: "new/speakers/manuel.svg"
      ],
      [ id: "16",
        name: "blake mizerany",
        twitter: "bmizerany",
        bio: "Sinatra's creator who currently builds systems in Go language for Heroku.",
        image: "new/speakers/blake.svg"
      ],
      [ id: "17",
        name: "Konstantin Haase",
        twitter: "konstantinhaase",
        bio: "A german working at TravisCI, who works in so many OSS projects, like: Sinatra, Puma, Rubinius.",
        image: "new/speakers/haase.svg"
      ],
      [ id: "18",
        name: "Sonya Green",
        twitter: "sundaykofax",
        bio: "Sonya has been dubbed the Chief Empathy Officer of GitHub. She works with the supportocats to answer the ever-increasing volume of support requests from developers.",
        image: "new/speakers/sonya.svg"
      ]

    ]
    response.headers['Cache-Control'] = 'public, max-age=3000'

    @wednesday = [
      [hour: "10:00",
       name: "Gregg Pollack",
       img_key: "new/schedule/icon_keynote.svg",
       name_presentation: "Keynote",
       img: "new/schedule/icon_english.svg"
      ],
      [hour: "11:00",
       name: "Mario A. Chávez",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Ruby Internals",
       img: "new/schedule/spacer.png"
      ],
      [hour: "11:40",
       name: "break",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [hour: "12:00",
       name: "Eric Saxby",
       img_key: "new/schedule/spacer.png",
       name_presentation: "When Rails hits the fan",
       img: "new/schedule/icon_english.svg"
      ],
      [hour: "12:40",
       name: "Javier Cervantes",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Creando API's con Hypermedia",
       img: "new/schedule/spacer.png"
      ],
      [hour: "13:20",
       name: "announcements",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [hour: "13:30",
       name: "lunch",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [hour: "15:00",
       name: "Norberto Hernández",
       img_key: "new/schedule/spacer.png",
       name_presentation: "UI & UX eficiente en apps móviles",
       img: "new/schedule/spacer.png"
      ],
      [hour: "15:40",
       name: "lightning talks",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [hour: "16:00",
       name: "break",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [hour: "16:20",
       name: "Manuel E. Vidaurre",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Irracionalidad Predecible",
       img: "new/schedule/spacer.png"
      ],
      [hour: "17:00",
       name: "Blake Mizerany",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Go - The why",
       img: "new/schedule/icon_english.svg"
      ],
      [hour: "17:40",
       name: "last words of the day",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ]
    ]

    @thursday = [
      [name: "Santiago Pastorino",
       img_key: "new/schedule/icon_keynote.svg",
       name_presentation: "Keynote",
       img: "new/schedule/spacer.png"
      ],
      [name: "Edwin Cruz",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Aplicaciones web 2.0, API's con RoR y frontend con EmberJS",
       img: "new/schedule/spacer.png"
      ],
      [name: "break",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [name: "Tommy Rochette",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Angular JS: Advance Design Patterns and Best Practices",
       img: "new/schedule/icon_english.svg"
      ],
      [name: "Iván Acosta Rubio",
       img_key: "new/schedule/spacer.png",
       name_presentation: "RubyMotion",
       img: "new/schedule/spacer.png"
      ],
      [name: "announcements",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [name: "lunch",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [name: "Herman Moreno",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Object Oriented Design, The Arduino Way",
       img: "new/schedule/spacer.png"
      ],
      [name: "lightning talks",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [name: "break",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [name: "Jon Dean",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Inter-application comunication using secure API's",
       img: "new/schedule/icon_english.svg"
      ],
      [name: "Konstantin Haase",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Sinatra in 6 lines, or How to do crazy stuff with Ruby",
       img: "new/schedule/icon_english.svg"
      ],
      [name: "last words of the day",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ]
    ]

    @friday = [
      [name: "Bryan Liles",
       img_key: "new/schedule/icon_keynote.svg",
       name_presentation: "Keynote",
       img: "new/schedule/icon_english.svg"
      ],
      [name: "Francisco Viramontes",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Chronicle of a SOA Foretold",
       img: "new/schedule/spacer.png"
      ],
      [name: "break",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [name: "Sonya Green",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Supporting continuous deployment with aplomb",
       img: "new/schedule/icon_english.svg"
      ],
      [name: "Johnny Winn",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Building an Organic API: Experiment in Meta Programming",
       img: "new/schedule/icon_english.svg"
      ],
      [name: "announcements",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [name: "lunch",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [name: "Konstantin Gredeskoul",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Acelerating Wanelo.com from 5k to 200k RMP in months flat",
       img: "new/schedule/icon_english.svg"
      ],
      [name: "lightning talks",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [name: "break",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ],
      [name: "Nick Sutterer",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Off the tracks - Challenging the Rails Mindset",
       img: "new/schedule/icon_english.svg"
      ],
      [name: "Ron Evans",
       img_key: "new/schedule/spacer.png",
       name_presentation: "Ruby and robots. Lots of robots",
       img: "new/schedule/icon_english.svg"
      ],
      [name: "goodbyes!",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
      ]
    ]


    ############ Sponsors #############
    @sponsor = [
      link: "http://magmaconf.s3.amazonaws.com/sponsorship/prospectus-magmaconf.pdf",
      image: "mobile/mobile-sponsorship-01.svg"
    ]

    @sponsors_gold = [
      [ link: "http://www.crowdint.com/",
        image: "new/sponsors/crowd-gold-01.svg"
      ],
      [ link: "http://github.com/",
        image: "new/sponsors/github-gold-01.svg"
      ],
      [ link: "http://conecti.ca/",
        image: "new/sponsors/gold-conectica.svg"
      ],
      [ link: "http://rubycentral.org/",
        image: "new/sponsors/gold-rubycentral.svg"
      ],
      [ link: "http://www.modcloth.com/",
        image: "new/sponsors/gold-Modcloth.svg"
      ],
      [ link: "https://www.billfloat.com/",
        image: "new/sponsors/gold-Billfloat.svg"
      ],
      [ link: "http://www.thoughtbot.com/",
        image: "new/sponsors/gold-thoughtbot.svg"
      ]
    ]

    @sponsors_midium = [
      [ link: "https://www.engineyard.com/",
        image: "new/sponsors/Engineyard.svg"
      ],
      [ link: "http://www.tangosource.com/",
        image: "new/sponsors/Tangosource.svg"
      ],
      [ link: "http://sg.com.mx/",
        image: "new/sponsors/SG.svg"
      ]
    ]

    @sponsors_silver = [
      [ link: "http://heroku.com/",
        image: "new/sponsors/heroku-silver-01.svg"
      ],
      [ link: "http://www.wanelo.com",
        image: "new/sponsors/wanelo-silver.svg"
      ],
      [ link: "http://envylabs.com/",
        image: "new/sponsors/envylabs-silver.svg"
      ],
      [ link: "http://hashrocket.com/",
        image: "new/sponsors/hashrocket-silver.svg"
      ],
      [ link: "http://ruby5.envylabs.com/",
        image: "new/sponsors/Ruby5-silver.svg"
      ],
      [ link: "http://hybridgroup.com/",
        image: "new/sponsors/hybridgroup-silver.svg"
      ],
      [ link: "http://magmaconf.s3.amazonaws.com/sponsorship/prospectus-magmaconf.pdf",
        image: "new/sponsors/your-logo-here-silver-01.svg"
      ]
    ]
  end
end
