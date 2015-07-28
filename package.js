Package.describe({
  name: 'mattimo:stockquotes',
  version: '0.0.1',
  // Brief, one-line summary of the package.
  summary: 'This meteor package exposes an api for grabbing current stock quotes as well as historical data.',
  // URL to the Git repository containing the source code for this package.
  git: 'https://github.com/dubvfan87/meteor-stockquotes',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('METEOR@0.9.0');
  api.addFiles('stockquotes.js');

  api.use([
    'templating',
    'coffeescript',
    'underscore',
    'http',
    'ogourment:settings@0.1.4'
  ]);

});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('stockquotes');
  api.addFiles('stockquotes-tests.js');
});
