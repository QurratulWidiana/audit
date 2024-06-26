class Selectize {
    constructor() {
        this.init();
    }

    init() {
        let initValue;
        $('.action-box').selectric({
            onInit: function(element) {
                initValue = $(this).val();
            },
            onChange: function(element) {
                if ($(this).val() !== initValue)
                    $(element).parents('form').submit();
            }
        });
    }
}

class Charts {
    constructor() {
        // Update the color theme based on your reference
        this.colors = ["#FF5733", "#33FF57", "#5733FF", "#FF5733"];
        this.tickColor = "#FF5733";

        this.initRadar();
        this.initBarHorizontal();
        this.initDoughnut();
    }

    initRadar() {
        let ctxD = document.getElementById('radarChartDark');
        let chartData = {
            type: 'radar',
            data: {
                labels: ["Education", "Food", "Transport", "Drinks", "Other"],
                datasets: [
                    {
                        label: "2014",
                        backgroundColor: this.convertHex(this.colors[0], 20),
                        borderColor: this.colors[0],
                        borderWidth: 1,
                        pointRadius: 2,
                        data: [51, 67, 90, 31, 16],
                    },
                    {
                        label: "2015",
                        backgroundColor: this.convertHex(this.colors[1], 20),
                        borderColor: this.colors[1],
                        borderWidth: 1,
                        pointRadius: 2,
                        data: [75, 44, 19, 22, 43],
                    },
                    {
                        label: "2015",
                        backgroundColor: this.convertHex(this.colors[2], 20),
                        borderColor: this.colors[2],
                        borderWidth: 1,
                        pointRadius: 2,
                        data: [7, 14, 29, 82, 33]
                    }
                ]
            },
            options: {
                scale: {
                    pointLabels: {
                        fontColor: this.tickColor
                    },
                    ticks: {
                        display: false,
                        stepSize: 25
                    }
                },
                legend: {
                    position: "bottom",
                    labels: {
                        boxWidth: 11,
                        fontColor: this.tickColor,
                        fontSize: 11
                    }
                }
            }
        };

        let myDarkRadarChart = new Chart(ctxD, chartData);
    }

    initBarHorizontal() {
        let ctxD = document.getElementById("barChartHDark");
        let chartData = {
            type: 'horizontalBar',
            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                datasets: [{
                    data: [27, 59, 68, 26, 79, 55, 36, 43, 44, 30, 55, 64],
                    backgroundColor: this.colors[0],
                    hoverBackgroundColor: this.convertHex(this.colors[0], 70)
                },
                {
                    data: [136, 23, 44, 30, 79, 55, 61, 94, 27, 59, 98, 91],
                    backgroundColor: this.colors[1],
                    hoverBackgroundColor: this.convertHex(this.colors[1], 70)
                },
                {
                    data: [88, 31, 87, 61, 77, 27, 59, 58, 136, 26, 79, 85],
                    backgroundColor: this.colors[2],
                    hoverBackgroundColor: this.convertHex(this.colors[2], 70)
                }]
            },
            options: {
                barThickness: 10,
                scales: {
                    xAxes: [{
                        stacked: true,
                        ticks: {
                            fontColor: this.tickColor,
                        },
                        gridLines: {
                            drawOnChartArea: false
                        }
                    }],
                    yAxes: [{
                        stacked: true,
                        ticks: {
                            fontColor: this.tickColor,
                            min: 0,
                            max: 175,
                            stepSize: 25
                        }
                    }]
                },
                legend: {
                    display: false
                }
            }
        };

        let myDarkRadarChart = new Chart(ctxD, chartData);
    }

    initDoughnut() {
        let ctxD = document.getElementById('doughnutChartDark');
        let chartData = {
            type: 'doughnut',
            data: {
                labels: ["Brasil", "India", "China"],
                datasets: [{
                    data: [300, 50, 100],
                    borderWidth: 0,
                    backgroundColor: [
                        this.convertHex(this.colors[0], 60),
                        this.convertHex(this.colors[1], 60),
                        this.convertHex(this.colors[2], 60),
                    ],
                    hoverBackgroundColor: [
                        this.colors[0],
                        this.colors[1],
                        this.colors[2],
                    ]
                }]
            },
            options: {
                responsive: true,
                legend: {
                    position: "bottom",
                    labels: {
                        boxWidth: 11,
                        fontColor: this.tickColor,
                        fontSize: 11
                    }
                }
            }
        };

        let myDarkRadarChart = new Chart(ctxD, chartData);
    }

    convertHex(hex, opacity) {
        hex = hex.replace('#', '');
        let r = parseInt(hex.substring(0, 2), 16);
        let g = parseInt(hex.substring(2, 4), 16);
        let b = parseInt(hex.substring(4, 6), 16);

        let result = 'rgba(' + r + ',' + g + ',' + b + ',' + opacity / 100 + ')';
        return result;
    }
}

new Selectize();
new Charts();
