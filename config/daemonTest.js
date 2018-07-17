function DaemonSettings() {
  var credentials = {
    postgres: {
      database: "sgesss",
      username: "docker",
      password: "docker",
      host: "127.0.0.1",
      schema:"public"

    },
    couchdb: {
      url: 'http://127.0.0.1:5984'
    }
  };

  return credentials;
};

module.exports = DaemonSettings;

