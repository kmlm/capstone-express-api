
# EPLdashboard API

EPLdashboard is an App that allows you to track key information about the English Premier League. Users can choose their favorite team and then add or subtract certain features from their dashboard. Features include fixtures, standings, and top scorers. Information is up to date and data is pulled from the StatsFC API.

The app also allows you to track games for your team. For those fans that like to keep track of key match events, the GameTracker function allows you to keep track of key events in the match and add any comments to jog their memory of the game when looking back later.

## Technologies Used

This is an Express API using MongoDB and mongoose.

## Unsolved Problems

The largest unsolved problem was in the API for this project. In order to add events to a user's game I was pushing new games to an array and sending a PATCH request with the new array. This did not pose any issues. The issue came in subtracting events. I used a filter function to create a new array that did not include the event that was going to be subtracted. I then sent a PATCH request with that array. This worked until I got to the last event for a game. When the filter produced an empty array as no more games were remaining, I consistently received a 500 internal server error and was not able to complete the PATCH passing an empty array. Hopefully, with more time I will be able to fix that problem to allow for delete event functionality.



## Links

- ERD: https://i.imgur.com/absho88.jpg
- Deployed API: https://hidden-beyond-66396.herokuapp.com/
- Client Repo: https://github.com/kmlm/capstone-project
- Deployed Client: https://kmlm.github.io/capstone-project/

## Dependencies

Install with npm install:

- express
- mongoose

List of Dependencies:

"dependencies": {
  "bcrypt": "^1.0.2",
  "body-parser": "^1.17.1",
  "cors": "^2.8.3",
  "debug": "^2.6.6",
  "dotenv": "^4.0.0",
  "express": "^4.15.2",
  "mongoose": "^4.9.8",
  "mongoose-unique-validator": "^1.0.5",
  "morgan": "^1.8.1",
  "multer": "^1.3.0",
  "serve-favicon": "^2.4.2"
},
"devDependencies": {
  "chai": "^3.5.0",
  "chai-as-promised": "^6.0.0",
  "eslint": "^3.19.0",
  "eslint-config-standard": "^10.2.1",
  "eslint-plugin-import": "^2.2.0",
  "eslint-plugin-node": "^4.2.2",
  "eslint-plugin-promise": "^3.5.0",
  "eslint-plugin-standard": "^3.0.1",
  "grunt": "^1.0.1",
  "grunt-concurrent": "^2.3.1",
  "grunt-eslint": "^19.0.0",
  "grunt-jsonlint": "^1.1.0",
  "grunt-mocha-cli": "^3.0.0",
  "grunt-nodemon": "^0.4.2",
  "load-grunt-config": "^0.19.2",
  "mocha": "^3.3.0",
  "supertest": "^3.0.0",
  "time-grunt": "^1.4.0"
}
