Original App Design Project - README Template
===

# Run Track Application

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Application to track a user's run and collects information like the run distance, time elapsed, average speed. The user will create an account and has options like staying logged in and registering with an email. There will also be a way to show the user's run on a map. The application will have a home page with various tabs to let the user select what they want to do next.

### App Evaluation
- **Category: Health and Fitness**
- **Mobile: iPhone 12**
- **Story: We decided to make this application to allow users to track their runs. As a runner, I wanted an alternative to Strava and to experiment with iOS development**
- **Market: People of all ages and levels that enjoy running.**
- **Habit: Used on an ad hoc basis. Depends on when the user goes for a run**
- **Scope: Pertains to individual users as opposed to businesses.**

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can create a new account
* User can login
* Managing the backend with Parse
* User can view run information on the home page dashboard
* User can track their current run on the active run page
* Active run page

**Optional Nice-to-have Stories**

* User can add friends

### 2. Screen Archetypes

* Login Screen
   * If the user has an account, then they can enter their username and password to login
   * If the user does not have an account, then they are redirected to the sign up screen and can create an account
* Sign Up Screen
   * On the sign in screen, the user enters their email, username, and password
   * They can either create the account or cancel
* Feed Screen
   * The feed screen shows a map, time elapsed, distance, and pace for past user runs
   * There is also a settings button for the user to go and change their information
* Active Run Screen
   * The active run screen shows a map, time elapsed, distance, and pace for the user's current run
   * The active run screen also includes a button for the user to start and stop their run
* Settings Screen
   * On the setttings screen, the user has the option to update their username, email, or password

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* [fill out your first tab]
* [fill out your second tab]
* [fill out your third tab]

**Flow Navigation** (Screen to Screen)

* [list first screen here]
   * [list screen navigation here]
   * ...
* [list second screen here]
   * [list screen navigation here]
   * ...

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]