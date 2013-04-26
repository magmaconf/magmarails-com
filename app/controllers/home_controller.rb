# encoding: UTF-8
class HomeController < ApplicationController
  def index
    @speakers = [
      [ id: "1",
        name: "Tommy Rochette",
        twitter: "trochette",
        bio: "Sr. Consultant at Universal Mind, focused on building rich Internet applications with HTML5 and Javascript. "
      ],
      [ id: "2",
        name: "Johnny Winn",
        twitter: "johnny_rugger",
        bio: "Hashrocket Rocketeer, Ruby developer with a passion for software craftmanship."
      ],
      [ id: "3",
        name: "konstantin gredeskoul",
        twitter: "kig",
        bio: "Narrow specialist in wide generality, who works at wanelo.com and has worked on too many Ruby Applications."
      ],
      [ id: "4",
        name: "Ron Evans",
        twitter: "deadprogram",
        bio: "Software developer and OSS contributor, author and speaker; principal at The Hybrid Group in LA. Habla español!"
      ],
      [ id:"5",
        name: "Nick sutterer",
        twitter: "apotonick",
        bio: "Ruby OSS contributor and speaker. His projects Cells and Apotomo brings view modularity and event-driven programming to Rails."
      ],
      [ id: "6",
        name: "javier cervantes",
        twitter: "solojavier",
        bio: "Apprentice of artesanal software development, who works at Hybrid Group and runs the Ruby GDL user group."
      ],
      [ id: "7",
        name: "iván acosta rubio",
        twitter: "ivanacostarubio",
        bio: "Venezuelan in Mexico, co-founder of SoftwareCriollo.com, building Meals.mx"
      ],
      [ id: "8",
        name: "mario a chávez",
        twitter: "Mario_Chavez",
        bio: "A software developer who woke up to Ruby after a few boring years in .NET"
      ],
      [ id: "9",
        name: "francisco viramontes",
        twitter: "kidpollo",
        bio: "Mac lover and Rubyst, experienced on building fast, secure and reliable Ruby on Rails enterprise applications."
      ],
      [ id: "10",
        name: 'norberto hernández',
        twitter: "norbertohdez",
        bio: "Web designer and front-end developer, passionate about HTML5 and CSS3, proud vegetarian."
      ],
      [ id: "11",
        name: "edwin cruz",
        twitter: "softr8",
        bio: "Crazy dude obsessed with high performance web applications, specialized in Ruby on Rails, scalable solutions and team work."
      ],
      [ id: "12",
        name: "Herman Moreno",
        twitter: "supherman",
        bio: "Software engineer, passionate programmer, Rubyst and DIY guy, also a best code practices enthusiast."
      ],
      [ id: "13",
        name: "jon dean",
        twitter: "jonathanedean",
        bio: "Web sites builder, in love with OSS, focused on Ruby on Rails, Javascript and CSS. Working at Stitch Fix."
      ],
      [ id: "14",
        name: "eric saxby",
        twitter: "ecdysone",
        bio: "Software engineer at Wanelo.com, uses Chef to manage their growing infraestructure. Worked on a circus once."
      ],
      [ id: "15",
        name: "manuel vidaurre",
        twitter: "mvidaurre",
        bio: "Mexican developer, writer and salesman; self taught, eager for knowledge."
      ],
      [ id: "16",
        name: "blake mizerany",
        twitter: "bmizerany",
        bio: "Sinatra's creator who currently builds systems in Go language for Heroku."
      ],
      [ id: "17",
        name: "Konstantin Haase",
        twitter: "konstantinhaase",
        bio: "A german working at TravisCI, who works in so many OSS projects, like: Sinatra, Puma, Rubinius."
      ],
      [ id: "18",
        name: "Sonya Green",
        twitter: "sundaykofax",
        bio: "Sonya has been dubbed the Chief Empathy Officer of GitHub. She works with the supportocats to answer the ever-increasing volume of support requests from developers. She nerds out on books like \"How to Win Friends and Influence People\", which is not as creepy of a book as it sounds. Sonya's previous jobs include being a forum moderator, firefighter, bike mechanic, and an editor. Guess which one required the most fires be put out."
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
       name_presentation: "Applicaciones web 2.0, API's con RoR y frontend con EmberJS",
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
      [name: "sponsor conference",
       img_key: "new/schedule/spacer.png",
       name_presentation: "",
       img: "new/schedule/spacer.png"
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
  end
end
