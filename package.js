Package.describe({
  name: "mattimo:stockquotes",
  version: "0.0.1",
  // Brief, one-line summary of the package.
  summary: "This meteor package exposes an api for grabbing current stock quotes as well as historical data.",
  // URL to the Git repository containing the source code for this package.
  git: "https://github.com/dubvfan87/meteor-stockquotes",
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: "README.md"
});

Package.onUse(function(api) {
  api.versionsFrom("METEOR@0.9.0");

  // Ad quote-model files
  api.addFiles("lib/quotes.coffee");
  api.addFiles("server/publications.coffee", "server");
  api.addFiles("server/methods.coffee", "server");

  api.use([
    "meteor",
    "mongo",
    "coffeescript",
    "underscore",
    "http",
    "aldeed:simple-schema",
    "momentjs:moment",
    "ogourment:settings",
    "meteorhacks:async"
  ], ["client", "server"]);

  api.imply(["meteor", "mongo", "underscore"]);

  api.export(["Quotes"]);

});
