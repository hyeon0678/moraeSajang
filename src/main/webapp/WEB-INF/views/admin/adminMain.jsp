<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap: 디자인을 위한 프레임워크 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 합니다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<!-- 그래프 차트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
<!-- 도넛 차트 -->

</head>
<body>
<div id="donutChartContainer" style="position: relative;">
	<label for="date">날짜를 선택하세요:
        <input type="date" id="dfirstsearchdate" value="" />
        ~
        <input type="date" id="dlastsearchdate" value="" />
        <input type="button" id="dsearchButton" value="검색" />
    </label>
  <canvas id="donutchart" height="350" width="350"></canvas>
  <div id="centerText" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center; font-size: 20px; color: #333;">Your Text</div>
</div>
<div id="graphChartContainer" >
	<select id="category">
	</select>
	<input type="button" id="csearchButton" value="검색" />
	<label for="date">날짜를 선택하세요:
        <input type="date" id="gfirstsearchdate" value="" />
        ~
        <input type="date" id="glastsearchdate" value="" />
        <input type="button" id="gsearchButton" value="검색" />
    </label>
<canvas id="myChart" width="450" height="350"></canvas>
</div>


</body>
<script>
// ------------------------------------------도넛차트--------------------------------------
const donutChartContainer = document.getElementById('donutChartContainer');
const centerText = document.getElementById('centerText');

// 도넛 차트 설정
const donutChartOptions = {
  responsive: false,
  plugins: {
    legend: {
      display: true,
      position: 'bottom', 
    },
  },
};

// 도넛 차트 데이터
const donutChartData = {
  labels: ['거래지역1', '거래지역2', '거래지역3', '거래지역4', '거래지역5', '거래지역6'],
  datasets: [
    {
      label: '최다 거래지역 TOP6',
      data: [1, 2, 3, 4, 5, 6],
      backgroundColor: [
        'rgba(255, 99, 132, 0.2)',
        'rgba(54, 162, 235, 0.2)',
        'rgba(255, 206, 86, 0.2)',
        'rgba(75, 192, 192, 0.2)',
        'rgba(153, 102, 255, 0.2)',
        'rgba(255, 159, 64, 0.2)',
      ],
      borderColor: [
        'rgba(255, 99, 132, 1)',
        'rgba(54, 162, 235, 1)',
        'rgba(255, 206, 86, 1)',
        'rgba(75, 192, 192, 1)',
        'rgba(153, 102, 255, 1)',
        'rgba(255, 159, 64, 1)',
      ],
      borderWidth: 1,
    },
  ],
};

const ctx = document.getElementById('donutchart').getContext('2d');

// 도넛 차트 생성
const myDonutChart = new Chart(ctx, {
  type: 'doughnut',
  data: donutChartData,
  options: donutChartOptions,
});

// 중앙 텍스트 업데이트
centerText.textContent = '거래량 합계';

// 중앙 텍스트 위치 조정
const chartWidth = donutChartContainer.offsetWidth;
const chartHeight = donutChartContainer.offsetHeight;

centerText.style.top = chartHeight / 2 + 'px';
centerText.style.left = chartWidth / 2 + 'px';
centerText.style.transform = 'translate(-438%, -68%)';
// 왼쪽 : 숫자가 작아질수록 오른쪽으로 이동
// 오른쪽 : 숫자가 작아질수록 아래쪽으로 이동





// -------------------------도넛 차트 ajax---------------------------

const today = new Date();
const yesterday = new Date(today);
yesterday.setDate(today.getDate() - 1);

// 어제 날짜를 "yyyy-mm-dd" 형식으로 포맷
const formattedYesterday = yesterday.getFullYear() + '-' + (yesterday.getMonth() + 1).toString().padStart(2, '0') + '-' + yesterday.getDate().toString().padStart(2, '0');

// 두 개의 input 요소에 formattedYesterday 값을 설정
const dfirstSearchDateInput = document.getElementById('dfirstsearchdate');
const dlastSearchDateInput = document.getElementById('dlastsearchdate');

dfirstSearchDateInput.value = formattedYesterday;
dlastSearchDateInput.value = formattedYesterday;


drawChartAdress(dfirstSearchDateInput.value,dlastSearchDateInput.value);

// 도넛차트 날짜 검색 버튼 클릭 
document.getElementById('dsearchButton').addEventListener('click', function () {
	  const dfirstSearchDate = dfirstSearchDateInput.value;
	  const dlastSearchDate = dlastSearchDateInput.value;
	  drawChartAdress(dfirstSearchDate, dlastSearchDate);
	});


function drawChartAdress(dfirstSearchDate,dlastSearchDate){
	$.ajax({
		type:'GET',
		url:'analysis/Adress.ajax',
		data:{'dfirstSearchDate':dfirstSearchDate,'dlastSearchDate':dlastSearchDate},
		dataType :'json',
		success:function(data){
			const labels = data.chartAdress.map(function (item) {
		        return item.gbDetailAddress;
		    });

		    const topAddresses = data.chartAdress.map(function (item) {
		        return item.topAddress;
		    });

		    // 도넛 차트 데이터 업데이트
		    myDonutChart.data.labels = labels;
		    myDonutChart.data.datasets[0].data = topAddresses;
		    myDonutChart.update(); // 차트 업데이트
		   
		    const totalTopAddress = topAddresses.reduce(function (total, current) {
		        return total + current;
		    }, 0);

		    // 합계를 centerText에 표시
		   centerText.innerHTML = '총 거래량<br>' + totalTopAddress+'건';
		    console.log(data);
			
		},
		error:function(error){
			console.error(error)
		}
				
	});
}


// ----------------------------------그래프 차트 --------------------------------------
const gctx = document.getElementById('myChart');
const myChart = new Chart(gctx, {
    type: 'bar',
    data: {
        labels: ['React', 'Vue', 'Angular', 'Svelte', 'Ember.js', 'Backbone.js'],
        datasets: [{
            label: '최다 거래지역 TOP6',
            data: [185134, 195514, 80460, 57022, 22165, 27862],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
    	responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
const categorySelect = document.getElementById('category');
drawcategory();
// --------------------------------------카테고리 차트 ajax--------------------------------
function drawcategory(){
	$.ajax({
		type:'GET',
		url:'analysis/drawcategory.ajax',
		dataType :'json',
		success:function(data){
		    console.log(data);
		 // 카테고리 정보를 받아온 후, <select> 요소에 옵션을 추가
            data.category.forEach(function (item) {
                const option = document.createElement('option');
                option.value = item.categoryType;
                option.text = item.categoryType;
                categorySelect.appendChild(option);
            });
		},
		error:function(error){
			console.error(error)
		}	
	});
}


</script>
</html>