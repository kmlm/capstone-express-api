'use strict'

const mongoose = require('mongoose')

const gameSchema = new mongoose.Schema({
  date: {
    type: Date,
    required: true
  },
  home: {
    type: String,
    required: true
  },
  away: {
    String,
    required: true
  },
  events:[
      {
        minute: Number,
        required: true
    },
    {
      type: String,
      required: true
    },
    {
      player: String,
      required: true
    },
    {
      comment: String
    }
  ],
  _owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, {
  timestamps: true,
  toJSON: {
    virtuals: true,
    transform: function (doc, ret, options) {
      const userId = (options.user && options.user._id) || false
      ret.editable = userId && userId.equals(doc._owner)
      return ret
    }
  }
})

gameSchema.virtual('length').get(function length () {
  return this.text.length
})

const Game = mongoose.model('Game', gameSchema)

module.exports = Game
