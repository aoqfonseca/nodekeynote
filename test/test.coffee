vows = require 'vows'
assert = require 'assert'

vows
  .describe('Division by zero')
  .addBatch
    'when dividing a number by zero':
      topic: -> 42/ 0

      'we get Infinity': (topic) ->
        assert.equal topic, Infinity

    'but when dividing zero by zero':
      topic: -> 0 / 0

      'we get a value which':
        'is not a number': (topic) ->
          assert.isNaN topic

        'is not equal to itself': (topic) ->
          assert.notEqual topic, topic

  .export(module)

