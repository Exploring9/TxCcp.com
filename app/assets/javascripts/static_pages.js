/*$.ajax({
           type: "GET",
           contentType: "application/json; charset=utf-8",
           url: 'data',
           dataType: 'json',
           success: function (data) {
           	   console.log(data);
               draw(data);
               second_draw();
           },
           error: function (result) {
               error();
           }
       });

function draw(data) {
	var data = [1,2,3,4,5]
	console.log("Called draw data");
	d3.select("p").append("p").text("Hey");
    var color = d3.scale.category20b();
    var width = 420,
        barHeight = 20;
 
    var x = d3.scale.linear()
        .range([0, width])
        .domain([0, d3.max(data)]);
 
    var chart = d3.select("#graph")
        .attr("width", width)
        .attr("height", barHeight * data.length);
 
    var bar = chart.selectAll("g")
        .data(data)
        .enter().append("g")
        .attr("transform", function (d, i) {
                  return "translate(0," + i * barHeight + ")";
              });
 
    bar.append("rect")
        .attr("width", x)
        .attr("height", barHeight - 1)
        .style("fill", function (d) {
                   return color(d)
               })
 
    bar.append("text")
        .attr("x", function (d) {
                  return x(d) - 10;
              })
        .attr("y", barHeight / 2)
        .attr("dy", ".35em")
        .style("fill", "white")
        .text(function (d) {
                  return d;
              });
}
 
function error() {
    console.log("error")
}

	
function second_draw(){ 
			var width=500,
				height=500,
				padding=50;
			
				var map=data.map(function(i){returnparseInt(i.age);});
				
				var histogram=d3.layout.histogram()
									.bins(7)
									(map)
				
				var y=d3.scale.linear()
								.domain([0,d3.max(histogram.map(function(i){returni.length;}))])
								.range([0,height])
								
				var x=d3.scale.linear()
							.domain([0,d3.max(map)])
							.range([0,width])
				
				var xAxis=d3.svg.axis()
								.scale(x)
								.orient("bottom");
				
				
				var canvas=d3.select("body").append("svg")
								.attr("width",width)
								.attr("height",height+padding)
								.append("g")
								.attr("transform","translate(20,0)")
								
				var group=canvas.append("g")
								.attr("transform","translate(0,"+height+")")
								.call(xAxis);
								
								
				var bars=canvas.selectAll(".bar")
									.data(histogram)
									.enter()
									.append("g")
				bars.append("rect")
					.attr("x",function(d){returnx(d.x);})
					.attr("y",function(d){return500-y(d.y)})
					.attr("width",function(d){returnx(d.dx);})
					.attr("height",function(d){returny(d.y);})
					.attr("fill","steelblue")
				
				bars.append("text")
					.attr("x",function(d){returnx(d.x)})
					.attr("y",function(d){return500-y(d.y)})
					.attr("dy","20px")
					.attr("dx",function(d){returnx(d.dx)/2;})
					.attr("fill","#fff")
					.attr("text-anchor","middle")
					.text(function(d){returnd.y;})
					
				console.log(histogram);
}
*/