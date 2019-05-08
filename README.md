# Programming Project Report : Group 3

## Introduction

We are group 3 of the programming project groups .For this data and visualisation project
we made newsdude.org which was a platform much like Reddit or Pinterest in which
stories are displayed after the data has been sorted.

The members of our group are Alan Abraham, Diego Molamphy, Daniel Ilyin and Tom Tye.

## How we split up the work

Our team held our first meeting after teams were allotted and we planned who was to do
what part of the program. We decided as follows:

- Tom Tye agreed to do the UI.
- Alan Abraham agreed to do the relevancy filter and search.
- Diego Molamphy agreed to do the search, search-bar and some widget and data-
    loading work.
- Daniel Ilyin agreed to load and parse the JSON files.

After this meeting we met up regularly to revise the plan and designate more work such
as the other classes and other code.


## Outline of Design

**- Main (Done by Tom/Diego/Alan/Daniel)**
As in most programs, our main acted as a control centre. It initialises instances of classes,
loaded our images, set up the screens, loaded the screens by fetching the information,
loaded the JSON data, set up mousePressed function, mouseMoved function and drew
the data. Essentially, the main was the heart of our program.


**- ButtonWidget (Done by Tom/Diego)**
The ButtonWidget class was an extension of our Widget class. It created our relevancy
filter buttons in the main page.


**- Comments (Done by Tom)**
The Comments class deconstructs the JSON Object data and constructs comments to
be displayed on the screen.


**- Constants (Done by Tom/Diego/Alan/Daniel)**
The Constants class was a simple yet important part of our program. It sets a number for
each query type used to set specific queries in mouse moved and mouse pressed. This is
used in the same way to sort our data in ascending or descending order in the main. It
also sets colours, sizes, fonts, and page numbers.

**- ID (Done by Tom/Diego/Alan)**
The ID class is used to search through the stories for a user inputted id.


**- Relevancy Filter (Done by Alan)**
The Relevancy Filters searches through stories and can sort them in a number of different
ways such as:
    - Most/Least Comments
    - Most/Least Score
    - Newest/Oldest Date
    
    
**- Screen (Done by Tom/Diego)**
The Screen class creates the widgets and adds them to the screen. It also has methods
to draw the screens and has functions to getEvents for the various widgets we
implemented.


**- Search (Done by Alan)**
The Search class contains different methods to search through comments and stories for
specific data. It also sorts the results into arrayLists.

**- SearchBar (Done by Diego)**
The SearchBar/TextBox class is an extension of Widget class, It creates widgets and has
functions to allow widgets of this type to take in text through the append method.

**- Story (Done by Tom)**
The Story class deconstructs the JSON Object data and constructs stories to be
displayed on the screen.

**- Username (Done by Tom/Diego/Alan)**
The Username class is used to search through the stories for a user inputted username.

**- Widget (Done by Tom/Diego)**
The Widgets abstract is the basis of all our widget related classes.


## Features implemented:

## Loading screen –

We implemented a loading screen, which plays a gif that we made ourselves, but sadly
due to the data being loaded as fast as our gif, we don’t get to see it.

## Search Bar -

We also had a search bar, which could be used to search for either a user or a keyword,
which would show all the posts made by that user, or all stories containing the keyword,
respectively

## Relevancy filter -

We had a relevancy filter which would sort out all the stories based on 3 factors,
comments; likes; date; so that all 3 queries could be sorted from highest/most – lowest/
least.

## Hyperlinks-


While deciding on the design of our programme, we decided to have a simplistic and user
friendly experience, therefore when constructing the stories, instead of showing the link,
we made them into hyperlinks and put them onto a world icon at the bottom of the story
overview page.

## Problems encountered by the team

Throughout the making of this project our team encountered many problems, however we
worked diligently on our code and asked teammates to review our code to fix these
problems.

Some of these problems include:

- Null pointer exceptions
- Stack overflow exceptions
- Errors displaying stories
- Errors in displaying comments
- Errors in loading the JSON files
- Errors in the sort function of the relevancy filter
- Errors in the search class

It took a lot of hard work from all of the team to fix these errors that were prominent in our
code but you could say error handling was part of the experience.
