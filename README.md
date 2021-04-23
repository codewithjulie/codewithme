# Welcome to my All Aboard Bootcamp Final Project

An education platform where enrolled users can enroll in multiple courses and access their course materials all in one place. Live now at [Heroku](https://codewithjulie.herokuapp.com)

Video walkthrough of this app available on [YouTube](https://youtu.be/ZQFei6xD3-s).

#### Future Improvements
1. Continue to refactor code and add tests in all areas
2. Use Action Cable for all messages including edits, deletes, and replies
3. Add gamification component that will help motivate users to complete a course
4. Limit admins to specific courses and create a third role, owner, who has access to everything
5. Fix account verification using e-mail and add password reset functionality
6. Make the app responsive
7. Create quizzes?


#### As of Friday April 16th:
1. Users can request to enroll in specific courses
2. Admins can enroll or unenroll users from a course
3. Pop up modal to confirm deleting courses, announcements, assignments, etc
4. Courses have an image, a short description viewable in 'courses_path' and a longer descrption vieable in 'course_path'
5. Logic included for users who are not enrolled to see an enroll button, and their enrolled courses/pending courses at the bottom of '/courses' page
6. Forum received a redesign, when messages are hovered, users will have access to edit and delete (if original author), or reply. Admins can add a channel or edit channel when hovering over the channel names.
7. Add search for all submissions and all users (admin only)


#### As of Friday April 9th:
1. Action Cable is running for new posts in the forum. Editing, deleting, and replying to posts with Action Cable will be a goal for this week. 
2. Unit and integrated testing for announcements and micro blog
3. Redesigned forum and replies to posts, and edits can be done within the forum 
4. Users can submit assignments with full CRUD operations. List of submitted assignments are viewable in the course. Admin can view all assignments in the course
5. Announcements and micro blog have pagination
6. Multiple courses with CRUD functionality! However, this last one broke a few things


#### As of Friday April 2nd:

1. Users have full CRUD functionality and able to login (if enrolled) to see course materials and logout
2. Assignments, lectures, announcements, and forums have full CRUD functionality for admins only
3. Posts/replies have full CRUD functionality only applicable to the user who wrote post/reply
4. Posts/replies are auto refreshed using JavaScript
5. Deployed to Heroku!


#### As of Monday March 29, 2021:

1. Users can register, login, edit their account information, and log out
2. Only users who are logged in can see the forum, assignments, and lectures
3. Assignments and lectures for All Aboard Bootcamp are linked in the appropiate drop down menus in the navbar
4. Forum/chat has topics i.e. Introductions and General and users can create a post as well as reply to a post
5. Basic CSS using Bootstrap 5 but needs a lot of work around Forum/chat, and figure out scrolling
6. Some flash messages 
7. Unrelated to project - but adding content about me in the footer (micro blog, about me, contact me)