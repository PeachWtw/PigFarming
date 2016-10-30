function Chart(data){
	this.title = data.title;
	this.subtitle = data.subtitle;
	this.xScale = data.xScale;
	this.yTitle = data.yTitle
	this.valueSuffix = data.valueSuffix;
	this.series = data.series;
}

Chart.prototype.init= function(){
    	var date = new Date(Date.parse("June 4,2013"));
    	console.log(date.getTime()+28800000);
        $('#container').highcharts({
        	credits: {//版权信息
        	/*enabled:false // 禁用版权信息*/
            text: 'HCharts.cn',
            href: 'http://www.hcharts.cn'
        	},
            chart: {
                zoomType: 'x'
            },
            title: {
                text: this.title
            },
            subtitle: {
                text: document.ontouchstart === undefined ?
                this.subtitle : this.subtitle
            },
            xAxis: {
                type: 'datetime',
                dateTimeLabelFormats: {
                    millisecond: '%H:%M:%S.%L',
                    second: '%H:%M:%S',
                    minute: '%H:%M',
                    hour: '%H:%M',
                    day: '%m-%d',
                    week: '%m-%d',
                    month: '%Y-%m',
                    year: '%Y'
                }
            },
            tooltip: {
                dateTimeLabelFormats: {
                    millisecond: '%H:%M:%S.%L',
                    second: '%H:%M:%S',
                    minute: '%H:%M',
                    hour: '%H:%M',
                    day: '%Y-%m-%d',
                    week: '%m-%d',
                    month: '%Y-%m',
                    year: '%Y'
                }
            },
            yAxis: {
                title: {
                    text: this.yTitle
                }
            },
            legend: {
                enabled: false
            },
            plotOptions: {
                area: {
                    fillColor: {
                        linearGradient: {
                            x1: 0,
                            y1: 0,
                            x2: 0,
                            y2: 1
                        },
                        stops: [
                            [0, Highcharts.getOptions().colors[0]],
                            [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                        ]
                    },
                    marker: {
                        radius: 2
                    },
                    lineWidth: 1,
                    states: {
                        hover: {
                            lineWidth: 1
                        }
                    },
                    threshold: null
                }
            },
            series: [{
                type: 'area',
                name: this.series.name,
                data: this.series.data
            }]
        });
}
