


$ ->

  $("#name_given_name").focus()
  $("#alive_today").highcharts
    chart:
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,

    title:
      text: "Living US Population With Your Name"
      style:
        color: "#6AB238"

    subtitle:
      text: "Source: US Birth Data"
      style:
        color: "#081206"

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
            ["#{user.us_population_alive} % Living US Population named: #{user.name}", user.us_population_alive]
            [" #{user.populationRemainder()}% With Other Name", user.populationRemainder()]
            ["Most common living name: Michael: 1.6%", 1.6]
        ]
    ]

  $("#us_births").highcharts
    chart:
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false

    title:
      text: "Birth Rate With Your Name"
      style:
        color: "#6AB238"

    subtitle:
      text: "Source: 2012 US birth data"
      style:
        color: "#081206"

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
            ["#{user.us_births}% of US births are named #{user.name}", user.us_births]
            ["#{user.birthRemainder()}% Born With Other Name", user.birthRemainder()]
            ["Most Common Baby Name of 2012 Sofia: 1.6%", 1.6]
        ]
    ]

  # $('#bar-sample').highcharts
  #   chart: 
  #     type: 'bar'
    
  #   title: 
  #     text: 'Name Popularity In US'
      
  #   xAxis: 
  #     categories: ['Apples', 'Bananas', 'Oranges']
      
  #   yAxis: 
  #     title: 
  #       text: 'US Population By Percentage'
          
  #   series: [
  #     name: 'Jane',
  #     data: [1, 0, 4]

  #     name: 'John',
  #     data: [5, 7, 3]
  #   ]
        
    



  user.displayName()

class Users
    constructor: (@name, @interpretation, @alternative_names, @etymology, @us_population_alive, @us_births) ->

    populationRemainder: ->
      ((100 - (Number @us_population_alive)) -  1.6)


    birthRemainder: ->
      ((100 - (Number @us_births)) - 1.6)

    displayName: ->
      $('#interpretation').append(@interpretation)
      $('#etymology').append(@etymology)
      $('#alternative_names ').append(@alternative_names )

    displayChart: ->
      #this should be a class or a mixin.
  
  user = new Users(gon.nameInfo.given_name, gon.nameInfo.interpretation, gon.nameInfo.alternative_names, gon.nameInfo.etymology, gon.nameInfo.us_population_alive, gon.nameInfo.us_births)




