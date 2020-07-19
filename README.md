# Paperclips (back end)
* A JS React/Ruby on Rails journaling application that allows users to track word counts, writing analytics, and awards cute animal pics and videos for hitting goals.  

<img src="https://github.com/cooljasonmelton/paperclips-back-end/blob/master/Animated%20GIF-downsized_large%20(2).gif?raw=true" width=""/>
<a href="https://www.youtube.com/watch?v=vqtw3m22R2k&t=4s"> Demo </a>


### Link to Front End
<a href='https://github.com/cooljasonmelton/paperclips-front-end'>https://github.com/cooljasonmelton/paperclips-front-end<a>
## Application Features
* Text area for daily journal entries that tracks word count and automatically updates date
* Awards cute animal pictures for every 100 words from Unsplash API (https://unsplash.com/)
* Writing prompts scraped from https://thejohnfox.com/2016/06/creative-nonfiction-prompts/
* Calendar showing progress and allowing user to read old journal entries
* Analytics and line graph showing writing progress and achievements 

## Built With​
* React
* Ruby on Rails RESTful API
* Redux and React Router
* <a href='https://github.com/fullcalendar/fullcalendar-react'>FullCalender</a>
* <a href='https://www.chartjs.org/'>Chart.js</a>
* <a href='http://watir.com/'>Watir (webscraper)</a>
* Semantic UI React
​
## Installation Instructions
1. Cd into preferred directory and clone repo for front-end and back-end:
```bash
git clone git@github.com:cooljasonmelton/paperclips-front-end.git
git clone git@github.com:cooljasonmelton/paperclips-back-end.git
```
2. Cd into directory 'paperclips-back-end' and migrate database:
```bash
rails db:migrate
```
3. Start rails server:
```bash
rails server
```
4. Open a new terminal tab. Cd into 'paperclips-front-end'. Install and run npm:
```bash
npm install && npm start
```
When prompted, run npm in a new port:
```bash
Y
```
5. Navigate browser to window opened by npm, by default: <a href='http://localhost:3001/'> http://localhost:3001/ </a> 

## Author
* <a href='https://github.com/cooljasonmelton'> Jason Melton</a>

## Acknowledgments
* Special thanks to Raza Jafri and Derek Castillo for all the help.




