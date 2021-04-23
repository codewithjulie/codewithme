# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




MicroBlog.delete_all

MicroBlog.create(title: "All Aboard Day 0", content: "I got the invite to join All Aboard Bootcamp! I am so excited because I finally get to work on the same tech stack as my good friend Cole. Thank you for letting me know about this amazing opportunity! \n\n I began my coding journey in 2019 learning Ruby using App Academy Open's free curriculum. Free! Unfortunately, I found it difficult to stay motivated and continue learning when going through it alone. \n\n In 2020, I had the opportunity to be a part of Code In Place. Code In Place is an introductory computer science course led by Stanford's computer science instructors as an act of community service during a very difficult time. There was a community of over 900 mentors and 10,000 students that I could ask questions to and learn along with. \n\n I look forward to meeting the person behind All Aboard Bootcamp and want to express my gratitude for the opportunity. Let's go 2021!", created_at: "2021-02-28 16:35:18")

MicroBlog.create(title: "All Aboard Day 1", content: "Today is the first day of All Aboard Bootcamp! John you are an amazing person and I thank you for creating All Aboard Bootcamp! \n\n John is a staff software engineer at GitHub, a founder of multiple companies, a speaker, a dad to five children, a husband, a woodworker, loves beer and cars, and spends any time left over to help underrepresented groups break into tech. To pay my respects to John, I will give 110% in the bootcamp, and do my best to not get behind. \n\n The first day was all about getting our environment setup so that we can code! GitHub's new feature Codespaces in beta, is the only thing we will need for the course. Codespaces is an in browser editor where we don't have to install anything on our local machines! Our whole dev environment is on the cloud! Fifteen days to go!", created_at: "2021-03-01 16:35:18")

MicroBlog.create(title: "All Aboard Day 2", content: "Tuesdays and Thursdays are Talkie Days! We get to meet with a guest speaker and learn about their journey into tech. Today's guest speaker was Mary Moore-Simmons, Director Of Engineering at GitHub. Mary, thank you so much for spending time with us today, I had a lot of fun hearing about how you switched from chemical engineering to software engineering and moving up from Project Manager as a woman in tech. \n\n First day of Ruby and we hit the ground running! We learned about variables, numbers, strings, arrays, hashes and how to read the Ruby Docs. For some reason...the docs always scared me, now I can't live without it. The first time I learned Ruby, it took me a month to get through all this material that John taught us in one day! John just explained Big O Notation to a 5 year old. \n\n I really appreciate how much time John spends after class is over to answer questions. He ensures  that there are no more questions before we sign off. Thirteen days to go!", created_at: "2021-03-02 16:35:18")

MicroBlog.create(title: "All Aboard Day 4", content: "And just like that 25% of the bootcamp is over. Today was all about classes, and finally three languages later, I understand how classes work. John - thank you for the mental model on classes. \n\n We also had an awesome guest speaker today Denise Yu. Denise is a senior software engineer at GitHub. I love the advice about thinking about the user, at the end of the day, if the user can't use the product, then there might as well be no product. Denise is also an amazing artist! Thank you for taking the time to speak to us today!", created_at: "2021-03-04 16:35:18")

MicroBlog.create(title: "All Aboard Day 5", content: "Over the weekend I was working on the data I received for learners requesting additional support. More than 40 students signed up and I decided to get some extra SQL practice by importing the CSV file into MySQL. I managed to group the members by level of programming experience with their availability. \n\n I also held a study session yesterday where we chatted about classes and the exercises from Session 4. It helped solidify the concepts for me and hope that it helped others too. \n\n Today...Clases continued. We learned about attr_readers, class methods, and class variables. Would you believe that it took me at least 6 months learning on my own to get to this point? I wasn't as lucky to have John show me the way the first time. I can't believe we are on to Rails tomorrrow!!", created_at: "2021-03-08 16:35:18")

MicroBlog.create(title: "All Aboard Day 6", content: "We had a special guest speaker today! Eileen Uchitelle is a principal software engineer at GitHub and a member of the Rails Core team! Eileen your story is truly inspiring and it helps keep me motivated to learning every day. I wish I could attend RailsConf and hear you speak. \n\n The one day I was late to class and John asked us to be on time - sorry John, sorry Eileen! \n\n It wasn't until John and Rails that I really understood the MVC, or as John prefers,'MCV model.\n * Model —> how you interact with the database \n * Controller —> decides what to do when a user visits your page \n * View —> what it will look like (html) \n\n We also set up rails for the first time and created our first controller and action. Rails is quick!", created_at: "2021-03-09 16:35:18")

MicroBlog.create(title: "All Aboard Day 8", content: "Talkie Thursday! Today we had Enrique Gonzales, a software engineer at GitHub Sponsors.  I enjoyed hearing about your background and how you originally struggled with programming since english was not your first language. I also love the advice about being kind to yourself and not having to be productive all the time. \n\n We are learning how magical Rails is. On the one hand, I wish I had learned it sooner, but on the other hand, I might not appreciate it as much if I didn't struggle through python/flask and node.js/express first. I don't have to know SQL to work with SQL databases....what?? \n\n Today was the hardest day yet, we learned about two model associations and views. Looking forward to the weekend to review the material. 50% of the bootcamp is over, 8 Days left to go!!", created_at: "2021-03-11 16:35:18")

MicroBlog.create(title: "All Aboard Day 9", content: "Today we learned about resources in Rails. It is unbelievable that by typing in: \n\n <code>resources :users</code> \n\n you get:  \n\n <code>get '/users', to: 'users#index' # Lists all users (users_path) </code>
<code>get '/users/:id', to: 'users#show' # Show one user (user_path(user))</code>
<code>get '/users/new', to: 'users#new' # Page to make new user (new_user_path)</code>
<code>post '/users', to: 'user#create' # Create new user </code>
<code>get '/users/:id/edit', to: 'users#edit' # Page to edit user (edit_user_path)</code>
<code>patch '/users/:id', to: 'users#update' # Update user</code>
<code>delete '/users/:id', to: 'users#destroy' # Delete user</code> \n\n I also hosted a study session over the weekend where we created a Rails app from scratch and created a Car model and Cars controller. It was very collaborative and it helps me a lot to review the material. Hopefully it helped others who joined the session too.", created_at: "2021-03-15 16:35:18")

MicroBlog.create(title: "All Aboard Day 10", content: "The first and hopefully only day that I miss class, sorry John! Today my family and I went skiing! The kids had so much fun that we stayed until they closed. I also fell on a cactus, but luckily had my ski pants on, though surprised that some spikes went through and caught me. \n\n It looks like we went over redirects, before_action, forms & nested resources and I missed Talkie Tuesday! It is going to be a long night trying to catch up and get the assignment in before the next class. \n\n Update: I had the pleasure of 'meeting' Eddie Washington our guest speaker for today! Eddie is the head of recruiting at Genius. I really appreciate hearing your story because you have a background in tech and you continue to have the motivation to keep learning more. Thank you for your time and I'm sorry I missed it. Thank goodness for recordings!", created_at: "2021-03-16 16:35:18")

MicroBlog.create(title: "All Aboard Day 12", content: "What a doozy of a lecture yesterday. Thank goodness for some lighter material today. We learned some CSS today. I admit, no matter how many times I try to learn HTML/CSS, I just can't retain it and I can't get the elements to do what I want it to do. \n\n We also had the pleasure of hearing from Jenn Schiffer today! Jenn is a Director of Community at Glitch. Thank you Jenn for chatting with us today, I love your personality and it was really inspiring to hear your story and learn about some of your creations. Including your pixel art ;) \n\n Since this week was so difficult, I decided I would host three study sessions over the weekend. I love that I am learning in a community again. John, I can't thank you enough and really appreciate what you are doing for All Aboard Bootcamp!", created_at: "2021-03-18 16:35:18")

MicroBlog.create(title: "All Aboard Day 13", content: "JavaScript...I've come to this realization, that front end is very difficult for me. I can likely figure out how to solve easy LeetCode problems using JavaScript...but ask me to interact with the Dom and I run the other way. Well guess what, I need to get it, and what better time then now when I have an amazing teacher to help me along the way.  \n\n Over the weekend some members of All Aboard Bootcamp and I met for some rails review. We created a 'food stand' app and had two models that associate with each other. We ended up with a sloppy but working CRUD app! Thank you to those who joined the study session, I hope it was as helpful for you as it was for me. \n\n Last week!! We got this!", created_at: "2021-03-22 16:35:18")

MicroBlog.create(title: "All Aboard Day 14", content: "Sadly...today was our last Talkie Day. Our guest speaker today was, Brian Douglas aka Bdougie, a Staff Developer Advocate for Github. Brian shared his story about how he learned to program while staying at the hospital watching his son who was born early fight for his life. We also got to meet his son! Brian, thank you for your time and everything you do! \n\n Day 2 of JavaScript..and John makes it look so easy. Then when I try to do it, I want to throw my computer out the window. \n\n Two days to go....I can't believe it's almost over.", created_at: "2021-03-23 16:35:18")

MicroBlog.create(title: "All Aboard Day 15", content: "I was traveling all day and listened to the lecture on the drive. I don't think that was the best way to absorb the material. While driving... I was so worried there was not going to be a recording, since John's computer froze. It was probably the one day I needed it most. Thank goodness the video saved. \n\n Will be another late night tonight...", created_at: "2021-03-24 16:35:18")

MicroBlog.create(title: "All Aboard Day 16", content: "I made it...it is the last day...unbelievable how much we learned in the last four weeks: Ruby, Rails, HTML, CSS, and JavaScript. And finally, the final project. Our proposal is due on Saturday and I have been thinking about a final project idea for a few weeks now. Originally i was thinking of creating a blog site, which would force me to write out my progress in the last four weeks. But after having done a couple of courses that had a community, I wanted to create a platform that can help consolidate all of the different tools and technology we need to use. Emails, slack, youtube, assignments, I want to be able to access them all in one place. 

I also managed to apply to be a section leader for Code In Place 2021!", created_at: "2021-03-25 16:35:18")

MicroBlog.create(title: "Final Project Time!", content: "Today felt a bit weird not logging in for class for the first time on a Monday. Good news, I got the go ahead for my final project idea! Well sort of, I was worried that if I had already been working on the final project before the class was over, then it would not be accepted. I'm so excited to be working on a one stop education platform. 

My ideas:
 * Users can create an account and have access to course materials
 * Assignments, lecture videos and forum or chat function will be available
 * Include gamification so that users will be motivated to complete the course

I can't wait to hear and see what everyone else is working on!", created_at: "2021-03-29 16:35:18")

MicroBlog.create(title: "Feeling Really High", content: "It's been 3 days since we all got the ok on our project. I am feeling really good today. I helped WWC SF chapter with a GitHub repo error and I also got through probably the most difficult (aside from having to style this) part of my project. I have a deepish nested resource that looks something like this:

<code>resources :chat do
  resources :message do
    resources :replies
  end
end
</code>

Think Slack, and I just figured out how to implement CRUD on the posts and responses. My brain is very much jumbled at the moment, but the app works, thank goodness. I am now able to unplug on time today =) 9:30pm. 

Also - no school for 10 days, so I get to finally take the kids somewhere fun in the morning!", created_at: "2021-04-01 16:35:18")

MicroBlog.create(title: "Rails Action Cable", content: "I have a basic understanding of what websockets are and have even used it in a previous app using node.js. However if I’m being honest, I couldn’t really explain how it works to you.

Today I started learning Action Cable which is basically web sockets built for Rails. And I’m finding I’m still unable to explain it to you. I’ll be playing with it more over the next several days and hopefully I'll have a better understanding of how it works.

So far I have been able to remove my original JavaScript auto refresh and it seems to be working. One thing I should have done first was refactor my views. It’s a mess with the nested resources and the views talking to the database - whoops!", created_at: "2021-04-04 16:35:18")

MicroBlog.create(title: "Another Rejection", content: "I got the 'I'm sorry to inform you...' email from Code In Place 2021. I felt multiple emotions, sad...relieved...self doubt...curious...let people down... Sorry Chris and Julie I wasn't good enough to be your Section Leader, but now I won't have to pivot to Python and focus on my resume/linkedin profile instead...did they make a mistake?! 

Code In Place 2020 was the start of how I got to where I am today. I made a lot of connections and some long lasting friendships. I will forever remember my amazing experience but it does sting a little to be rejected. I'll take this as a sign that I can't pivot to another programming language anymore. Good bye Code In Place, hello to finding a job!", created_at: "2021-04-06 08:35:18")

MicroBlog.create(title: "Rails Action Cable Take 2", content: "After reverting my project to pre-action-cable, I attempted to try action cable again. One of the reasons was that my forums/posts/responses views were very cluttered and hard to follow. I needed to really understand what my code was saying. The other reason was that I couldn't deploy it to Heroku without adding a credit card on file. 

Today I managed to use action cable again and managed to get it deployed! (This link was super helpful in getting my app to deploy: [https://medium.com/swlh/deploying-a-rails-react-app-with-actioncable-to-heroku-cb5d42f41a2a](https://medium.com/swlh/deploying-a-rails-react-app-with-actioncable-to-heroku-cb5d42f41a2a)). I also managed to throw some JavaScript together that I remembered from study session to allow users to add and edit posts/responses from within the forum. Thank goodness for those study sessions.", created_at: "2021-04-08 21:35:18")

MicroBlog.create(title: "Rails Many to Many", content: "Most if not all of the associations in my final project are a one to many. I am so glad I attempted to add the ability to have multiple courses. This required a many to many relationship. One course can have many students, and one student can have many courses. This required the use of the has_many :through association and another table that lists the relationships between student and course.

I also could have saved a lot of time if I had just originally thought of having multiple courses in the first place. I had to move the announcements, assignments, and lectures resources nested within courses which meant all my paths had to change. This was a whole day project, but I think I've got out most of the bugs!", created_at: "2021-04-09 23:53:18")

MicroBlog.create(title: "It's a marathon, not a sprint", content: "I'm really stubborn. So stubborn, that I should take a break instead of figuring out the cause of a bug. But instead, I might stay up trying to figure it out. Two days ago, I attempted to learn how to send users an email to verify their account. I wouldn't stop trying to figure it out. If I fixed one problem, a different problem would arise. I originally tried SendGrid and worked on that for a day and a half, then got fed up so I switched to mailgun. 

Well it is still not working, and that's ok. It usually means that I didn't understand the basic fundamentals. I couldn't tell you how Action Mailer works...and that's a problem. I take this as a learning opportunity. It's good to get the big picture, but in a few days when I'm ready - I'll tackle Action Mailer again. I need to keep reminding myself that the tortoise wins the race.", created_at: "2021-04-12 22:26:25")

MicroBlog.create(title: "Heroku Logs", content: "I've been using Heroku to deploy my final project. Many times - I have seen the dreaded “We're sorry, but something went wrong.” At first, I was frustrated because I could never figure out why I was receiving this page. Slowly I discovered using 'heroku logs —tail' in the cli to see the logs while you're accessing your application. And then later on discovered the heroku logs directly in my heroku account for my app. For anyone who is having trouble with heroku deployment, check out the logs and it will help you figure out where the problem originates.", created_at: "2021-04-14 12:27:24")