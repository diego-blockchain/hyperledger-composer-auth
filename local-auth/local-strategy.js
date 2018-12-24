const localStrategy = require('passport-local').Strategy;
const util = require('util');

function CustomLocalStrategy(options, verify) {
    //Apply this strategy to middleware routing(loopback - express(server))
    console.log('CustomLocalStrategy', options, verify);

    localStrategy.Strategy.call(this, options, verify);
}

util.inherits(CustomLocalStrategy, localStrategy.Strategy);

module.exports = {
    Strategy: CustomLocalStrategy
};

//Add any custom logic and export it