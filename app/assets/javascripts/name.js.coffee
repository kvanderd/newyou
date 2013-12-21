


$ ->
  $("#name_given_name").focus()
  $("#alive-today").highcharts
    chart:
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false

    title:
      color: "#30beda"
      text: "Living US Population With Your Name"

    subtitle:
      text: "Source: US Birth Data"

      plotOptions: [
        pie: [
            allowPointSelect: true
            curser: 'pointer'
            dataLabels: [
                enabled: true
                color: '#000000'
                connectorColor: '#000000'
                format: '<b>{point.name}</b>: {point.percentage:.5f} %'
            ]
        ]
      ]

    tooltip:
      pointFomrat: 'pointFormat: {series.name}: <b>{point.percentage:.5f}%</b>'

    series: [
      type: 'pie'
      data: [
            ["#{user.us_population_alive} % named #{user.name}", user.us_population_alive]
            [" #{user.populationRemainder()}% With Other Name", user.populationRemainder()]
            ["Most Common Name in US: Michael 1.6%", 1.6]
        ]
    ]

  $("#us_births").highcharts
    chart:
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false

    title:
      text: "Birth Rate With Your Name"

    subtitle:
      text: "Source: 2012 US birth data"

      plotOptions: [
        pie: [
            allowPointSelect: true
            curser: 'pointer'
            dataLabels: [
                enabled: true
                color: '#000000'
                connectorColor: '#000000'
                format: '<b>{point.name}</b>: {point.percentage:.7f} %'
            ]
        ]
      ]

    tooltip:
      pointFomrat: 'pointFormat: {series.name}: <b>{point.percentage:.7f}%</b>'

    series: [
      type: 'pie'
      data: [
            ["#{user.us_births} % named #{user.name}", user.us_births]
            ["#{user.birthRemainder()}% Born With Other Name", user.birthRemainder()]
            ["Most Common Baby Name 2012 Sofia: 1.6%", 1.6]
        ]
    ]


  user.displayName()

class Users
    constructor: (@name, @interpretation, @alternative_names, @etymology, @us_population_alive, @us_births) ->

    populationRemainder: ->
      (100 - (Number @us_population_alive)) -  1.6

    birthRemainder: ->
      (100 - (Number @us_births)) - 1.6

    displayName: ->
      $('#interpretation').append(@interpretation)
      $('#etymology').append(@etymology)
      $('#alternative_names ').append(@alternative_names )

    displayChart: ->
      #this should be a class or a mixin.
  
  user = new Users(gon.nameInfo.given_name, gon.nameInfo.interpretation, gon.nameInfo.alternative_names, gon.nameInfo.etymology, gon.nameInfo.us_population_alive, gon.nameInfo.us_births)




