PropTypes = require('../src/PropTypes')
expect = require('chai').expect

# data = [{
#     'type': 'single-line',
#     'disabled': false,
#     'hint': 'Hint'
#   }, 'hint', 'TextField', 'prop']


describe 'PropTypes', ->
  it 'string', ->

    expect(PropTypes.string())
      .to.have.property('type')
      .that.equals('string')

    expect(PropTypes.string())
      .to.not.have.property('examples')

    expect(PropTypes.string.example(['foo', 'bar']))
      .to.have.property('examples')
      .that.deep.equals(['foo', 'bar'])

  it 'oneOf', ->

    expect(PropTypes.oneOf(['one', 'two']))
      .to.have.property('type')
      .that.equals('oneOf')

    expect(PropTypes.oneOf(['one', 'two']))
      .to.have.property('value')
      .that.deep.equals(['one', 'two'])

    expect(PropTypes.oneOf(['one', 'two']))
      .to.not.have.property('examples')

    expect(PropTypes.oneOf(['one', 'two']).example([1, 2]))
      .to.have.property('examples')
      .that.deep.equals([1, 2])
