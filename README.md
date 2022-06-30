# Project 3 - *Instagram*

**Instagram** is a photo sharing app using Parse as its backend.

Time spent: **20** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User can sign up to create a new account using Parse authentication
- [X] User can log in and log out of his or her account
- [X] The current signed in user is persisted across app restarts
- [X] User can take a photo, add a caption, and post it to "Instagram"
- [X] User can view the last 20 posts submitted to "Instagram"
- [X] User can pull to refresh the last 20 posts submitted to "Instagram"
- [X] User can tap a post to view post details, including timestamp and caption

The following **optional** features are implemented:

- [X] Run your app on your phone and use the camera to take the photo
- [X] User can load more posts once he or she reaches the bottom of the feed using infinite scrolling
- [X] Show the username and creation time for each post
- [X] User can use a Tab Bar to switch between a Home Feed tab (all posts) and a Profile tab (only posts published by the current user)
- User Profiles:
  - [X] Allow the logged in user to add a profile photo
  - [X] Display the profile photo with each post
  - [X] Tapping on a post's username or profile photo goes to that user's profile page
- [X] After the user submits a new post, show a progress HUD while the post is being uploaded to Parse
- [X] User can comment on a post and see all comments for each post in the post details screen
- [X] User can like a post and see number of likes for each post in the post details screen
- [X] Style the login page to look like the real Instagram login page
- [X] Style the feed to look like the real Instagram feed
- [ ] Implement a custom camera view

The following **additional** features are implemented:

- like and comment counts differentiate plurality
- comments feature profile pictures
- profile view is formatted similar to instagram
- editing profile has checks for null values and an alert for no values
- set constraints for every view (autolayout)
- making a new post updates the timeline
- editing the profile automatically updates the profile page

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Custom Camera View (AVFoundation) - curious about this but didn't have time to fully implement it (an attempt was made) because my capstone has to do with livestreaming together
2. Design wise, the best way to transition between views for the smoothest experience possible

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![Kapture 2022-06-30 at 15 27 31](https://user-images.githubusercontent.com/65429031/176789782-72eaba95-f931-4f5d-bfd3-46dcebb0e472.gif)
![Kapture 2022-06-30 at 15 42 29](https://user-images.githubusercontent.com/65429031/176790593-faf9b157-ff49-4ae8-b593-a292d7bec0e5.gif)
![Kapture 2022-06-30 at 15 45 27](https://user-images.githubusercontent.com/65429031/176790860-421f930e-60c0-4b28-a5bc-1f2b2b8f72d5.gif)
![Kapture 2022-06-30 at 15 47 44](https://user-images.githubusercontent.com/65429031/176791092-d2a3cb0e-da18-4762-b4ca-4c51ce99d47d.gif)
![Kapture 2022-06-30 at 15 53 31](https://user-images.githubusercontent.com/65429031/176791645-68897de0-7b61-4ef3-8231-8257d2a1c77d.gif)


GIF created with [Kap](https://getkap.co/).

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## Notes

Describe any challenges encountered while building the app.

## License

    Copyright [2022] [Nancy Wu]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
