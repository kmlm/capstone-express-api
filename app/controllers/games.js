'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Game = models.game

const authenticate = require('./concerns/authenticate')
const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

const index = (req, res, next) => {
  Game.find()
    .then(games => res.json({
      games: games.map((e) =>
        e.toJSON({ virtuals: true, user: req.user }))
    }))
    .catch(next)
}

const show = (req, res) => {
  res.json({
    game: req.game.toJSON({ virtuals: true, user: req.user })
  })
}

const create = (req, res, next) => {
  const game = Object.assign(req.body.game, {
    _owner: req.user._id
  })
  Game.create(game)
    .then(game =>
      res.status(201)
        .json({
          game: game.toJSON({ virtuals: true, user: req.user })
        }))
    .catch(next)
}

const update = (req, res, next) => {
  delete req.body.game._owner  // disallow owner reassignment.

  req.game.update(req.body.game)
    .then(() => res.sendStatus(204))
    .catch(next)
}

const destroy = (req, res, next) => {
  req.game.remove()
    .then(() => res.sendStatus(204))
    .catch(next)
}

module.exports = controller({
  index,
  show,
  create,
  update,
  destroy
}, { before: [
  { method: setUser, only: ['index', 'show'] },
  { method: authenticate, except: ['index', 'show'] },
  { method: setModel(Game), only: ['show'] },
  { method: setModel(Game, { forUser: true }), only: ['update', 'destroy'] }
] })
