# Jeidos

## About the programme and me

I've started something like this several times, but this time I hope I am going to make it bigger and better.
This little 'DOS' is suppose to be a little clone of MS-Dos. My first "Operating System" was [JeytasOS](http://jeytas.github.io/JeytasOS/) and I discontinued working on it after a while.
This was my first big project after over half a year. This will also be a project you'll be able to find on my [JeytasGame](http://jeytasgame.de.vc) website, after it moved to my new [jeytas.ddns.net](http://jeytas.ddns.net) server.

**About me**

If you don't know me that well, I can tell you a little about myself. I am a German (part Swedish) programmer who's currently living in a small town in the region of Westphalia.
I've always been interested in electronics, computers and languages. And on one day of 2008, I decided to make my own website called [Tierworld](http://tierworld.repage6.de/). That was my first website ever. Then I continued making websites and taught myself HTML5 and Javascript. Afterwards I wanted to start making *real* programmes. I went to an [Ubuntu Forum](http://forum.ubuntuusers.de/) and posted this post: [Programming-Post](http://forum.ubuntuusers.de/topic/programmieren-6/). Then I searched around the Internet a bit to find good beginner tutorials and I found a website that promoted KidsRuby: [KidsRuby Promotion](http://rorbecker.com/spelskola/komigang.html). I looked at it and thought: "I could use that... but that would be too easy". So I used the "hard" way and installed everything by myself. But the post promoted something else. It was a gem called Gosu. They said you can make games with it, so I tried installing it. After it didn't work, I gave up and used the normal version of Ruby. I made my first game (a text adventure), called [The Legend of Dimando](http://thelegendofdimando.jimdo.com/). I worked on it almost every day, but then I slowly stopped doing anything with it and it eventually stopped.
Then, in 2014, I came back to Gosu. I got in contact with its developer **Julian Raschke**. He helped me programme, and so my first game was being made. After a while and a lot of programmes, I decided to take a break from programming. But that break was not to last long, because we had to do work experience in school. I wanted to do something I really like and I can do. 
I *worked* in the IKT (Informations- und Kommunikationstechnologie / Information and communications techonolgy) of the Wittekindshof in [Bad Oeynhausen](http://en.wikipedia.org/wiki/Bad_Oeynhausen). I worked there for three weeks and got a lot of new knowledge about IT itself. I've visited every part of the IKT, including the server room. This let to the idea of making my own server with my Raspberry Pi (and so I did [Server](http://jeytas.ddns.net)). I also learnt the programming language used there, called FOP (at least its basics). But besides that, my programming skills are all self-taught. I learnt Ruby on my own with no help. The reason why is, because I can learn stuff very good on my own. I'm also very interested in languages (be it real or computer languages). I even made my own language called [Jeiios](http://jeytas.ddns.net/jeiios).

-----

## Jeidos itself
Jeidos is the name of this little *operating system*. You can download it (.exe files will be available later) and start it. Just follow the instruction that says `[...] Start by typing in 'help'` and you will be able to get an interactive help menu.
If you do not want the system to remind you of the help, open the file help.txt and follow the included instructions
There are already quite a few features, including a little *user management* that you can try out for yourself. 

### How to start the OS
Starting the OS is actually fairy simple. If you're on Linux, just start the "start.rb" file in your Terminal, and if you are on Windows just open the Jeidos.exe file. Then you will be asked to create an account or login. 

### User management system
The *user management system* is currently still in development, but the biggest part of it is complete. Using it is very simple. Just start the *start.rb* file and it will ask:

`1.) Create username`

`2.) Login`

When you type in *1* (and press enter), the system will ask you for your desired username. Please only use ASCII symbols. Then you press enter and the system shuts down. Now you have a folder called *user* and in that folder there is a file called *your_username.user*. That is your userfile that currently just includes one line of text. I am working on different features that use more than just one line. Now, open *start.rb* once again and this time, type in *2* (and press enter) and you will be able to login. enter your username and your password and you're good to go! The system will now start!

### Where is the password?
Your password is saved under `your_username.user`. That can be opened with a normal text editor. The password in that file was create with my random password generator. If you wish to change it, just replace the password with your desired password.

**Caution:**
It is important that the file only includes **one line**. Any more than one line and the system won't be able to properly detect your password
