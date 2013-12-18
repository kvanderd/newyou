// Generated by CoffeeScript 1.6.3
var Users, user;

$(function() {
  $("#alive-today").highcharts({
    chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false
    },
    title: {
      text: "Living US Population With Your Name"
    },
    subtitle: {
      text: "Source: Wolfram Alpha",
      plotOptions: [
        {
          pie: [
            {
              allowPointSelect: true,
              curser: 'pointer',
              dataLabels: [
                {
                  enabled: true,
                  color: '#000000',
                  connectorColor: '#000000',
                  format: '<b>{point.name}</b>: {point.percentage:.7f} %'
                }
              ]
            }
          ]
        }
      ]
    },
    tooltip: {
      pointFomrat: 'pointFormat: {series.name}: <b>{point.percentage:.7f}%</b>'
    },
    series: [
      {
        type: 'pie',
        data: [["" + user.us_population_alive + " % named " + user.name, user.us_population_alive], [" " + (user.populationRemainder()) + "% With Other Name", user.populationRemainder()]]
      }
    ]
  });
  $("#us_births").highcharts({
    chart: {
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false
    },
    title: {
      text: "Birth Rate With Your Name"
    },
    subtitle: {
      text: "Source: Wolfram Alpha",
      plotOptions: [
        {
          pie: [
            {
              allowPointSelect: true,
              curser: 'pointer',
              dataLabels: [
                {
                  enabled: true,
                  color: '#000000',
                  connectorColor: '#000000',
                  format: '<b>{point.name}</b>: {point.percentage:.7f} %'
                }
              ]
            }
          ]
        }
      ]
    },
    tooltip: {
      pointFomrat: 'pointFormat: {series.name}: <b>{point.percentage:.7f}%</b>'
    },
    series: [
      {
        type: 'pie',
        data: [["" + user.us_births + " % named " + user.name, user.us_births], ["" + (user.birthRemainder()) + "% With Other Name", user.birthRemainder()]]
      }
    ]
  });
  return user.displayName();
});

Users = (function() {
  function Users(name, interpretation, alternative_names, etymology, us_population_alive, us_births) {
    this.name = name;
    this.interpretation = interpretation;
    this.alternative_names = alternative_names;
    this.etymology = etymology;
    this.us_population_alive = us_population_alive;
    this.us_births = us_births;
  }

  Users.prototype.populationRemainder = function() {
    return 100 - (Number(this.us_population_alive));
  };

  Users.prototype.birthRemainder = function() {
    return 100 - (Number(this.us_births));
  };

  Users.prototype.displayName = function() {
    $('#interpretation').append(this.interpretation);
    $('#etymology').append(this.etymology);
    return $('#alternative_names ').append(this.alternative_names);
  };

  Users.prototype.displayChart = function() {};

  return Users;

})();

user = new Users(gon.nameInfo.given_name, gon.nameInfo.interpretation, gon.nameInfo.alternative_names, gon.nameInfo.etymology, gon.nameInfo.us_population_alive, gon.nameInfo.us_births);
