// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require d3
//= require jquery3
//= require popper
//= require bootstrap
//= require activestorage
//= require turbolinks
//= require_tree .


$(document).ready(function(){

  var button1 = $('#all-diseases')
  var button2 = $('#active-patients')
  var button3 = $('#points')

  button1.click(function(){
    $.get("admin/all_users",function(infos){

      doctor = infos[0]
      patient = infos[1]

      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Users', 'Doctor', 'Patient'],
          ['2018',doctor,patient]
        ]);

        var options = {
          chart: {
            title: 'Doctors and Patients'
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    },"json")
  })

    button2.click(function(){
      $.get("admin/all_active_patients",function(infos){

        console.log(infos)
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Day');
      data.addColumn('number', 'Obeses');
      data.addColumn('number', 'Diabetes');
      data.addColumn('number', 'Hypertensions');

      data.addRows([
        infos[0],
        infos[1],
        infos[2],
        infos[3],
        infos[4],
        infos[5],
        infos[6],
        infos[7]
      ]);

      var options = {
        chart: {
          title: 'Daily Active Users'
        },
        width: 900,
        height: 500
      };

      var chart = new google.charts.Line(document.getElementById('barchart_material'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }
    },"json")
    })

    button3.click(function(){
      $.get("admin/all_points",function(infos){

        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
          var data = google.visualization.arrayToDataTable([
            ['Points', 'points'],
            infos[0],
            infos[1],
            infos[2],
            infos[3],
          ]);

          var options = {
            title: 'Points of Patients',
            is3D: true,
          };

          var chart = new google.visualization.PieChart(document.getElementById('barchart_material'));
          chart.draw(data, options);
        }
      },"json")

    })
	
})