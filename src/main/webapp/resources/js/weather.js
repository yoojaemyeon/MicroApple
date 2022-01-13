
$(document).ready(function() {
	console.log("실행")
	$("select[name=location]").change(function(){
		getweather();
		forecast();
	});
	
	
	getweather();
	function getweather(){
		var city = $("select[name=location]").val();
		console.log(city);
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=5d8072c6a22454670a833f5562e17cd3&lang=kr";
		$.ajax({
		    url: apiURI,
		    dataType: "json",
		    type: "GET",
		    async: "false",
		    success: function(resp) {
		        console.log(resp);
		        console.log("현재온도 : "+ (resp.main.temp- 273.15) );
		        console.log("현재습도 : "+ resp.main.humidity);
		        console.log("날씨 : "+ resp.weather[0].main );
		        console.log("상세날씨설명 : "+ resp.weather[0].description );
		        console.log("날씨 이미지 : "+ resp.weather[0].icon );
		        console.log("바람   : "+ resp.wind.speed );
		        console.log("나라   : "+ resp.sys.country );
		        console.log("도시이름  : "+ resp.name );
		        console.log("구름  : "+ (resp.clouds.all) +"%" );
		        
		        
		        temp = Math.round(resp.main.temp- 273.15); //온도
		        humidity = resp.main.humidity; //습도
		        weather = resp.weather[0].main; //날씨
		        description = resp.weather[0].description; // 날씨 상세설명
		        icon = resp.weather[0].icon; //날씨 이미지
		        wind = Math.round(resp.wind.speed); //바람
		        city = resp.name; //도시
		        
		        $("#temp").html(temp) // 온도 넣기
		        $("#humidity").html(humidity) // 습도 넣기
		        $("#weather").html(weather) // 날씨 넣기
		        $("#weatherDetail").html(description) // 날씨종류 넣기
// 		        $("#icon").html(icon) // 날씨이미지 넣기
		        $("#wind").html(wind) // 바람 넣기
		        $("#city").html(city) // 도시 넣기
		        
		        
		        //아이콘 값에 따라서 날씨 아이콘과 배경을 변경
		        //이미지는 지금처럼 저장한 이미지나 cdn주소를 사용해서 적용하자
		        console.log(icon);
		        if (icon == "01n") {
			        $("#icon").attr("class", "mdi mdi-weather-night");
			        $('#weatherforecast').css({"background-image":"url(/resources/weather/01n.jpg)"});
				} else if (icon == "02n") {
					$("#icon").attr("class", "mdi mdi-weather-night-partly-cloudy");
					$('#weatherforecast').css({"background-image":"url(/resources/weather/02n.jpg)"});
				} else if (icon == "03n") {
					$("#icon").attr("class", "mdi mdi-weather-cloudy");
					$('#weatherforecast').css({"background-image":"url(/resources/weather/03n.jpg)"});
				} else if (icon == "04n") {
					$("#icon").attr("class", "mdi mdi-weather-cloudy");
					$('#weatherforecast').css({"background-image":"url(/resources/weather/04n.jpg)"});
				} else if (icon == "09n") {
					$("#icon").attr("class", "mdi mdi-weather-pouring");
					$('#weatherforecast').css({"background-image":"url(/resources/weather/09n.jpg)"});
				} else if (icon == "10n") {
					$("#icon").attr("class", "mdi mdi-weather-rainy");
					$('#weatherforecast').css({"background-image":"url(/resources/weather/10n.jpg)"});
				} else if (icon == "11n") {
					$("#icon").attr("class", "mdi mdi-weather-lightning");
					$('#weatherforecast').css({"background-image":"url(/resources/weather/11n.jpg)"});
				} else if (icon == "13n") {
					$("#icon").attr("class", "mdi mdi-weather-snowy-heavy");
					$('#weatherforecast').css({"background-image":"url(/resources/weather/13n.jpg)"});
				} else if (icon == "50n") {
					$("#icon").attr("class", "mdi mdi-weather-fog");
					$('#weatherforecast').css({"background-image":"url(/resources/weather/50n.jpg)"});
				} else if (icon == "01d") { // 해 수정
			        $("#icon").attr("class", "mdi mdi-white-balance-sunny");
			        $('#weatherforecast').css({"background-image":"url(/resources/weather/01d.jpg)"});
				} else if (icon == "02d") {
					$("#icon").attr("class", "mdi mdi-weather-partly-cloudy");
					 $('#weatherforecast').css({"background-image":"url(/resources/weather/02d.jpg)"});
				} else if (icon == "03d") {
					$("#icon").attr("class", "mdi mdi-weather-cloudy");
					 $('#weatherforecast').css({"background-image":"url(/resources/weather/03d.jpg)"});
				} else if (icon == "04d") {
					$("#icon").attr("class", "mdi mdi-cloud");
					 $('#weatherforecast').css({"background-image":"url(/resources/weather/04d.jpg)"});
				} else if (icon == "09d") {
					$("#icon").attr("class", "mdi mdi-weather-pouring");
					 $('#weatherforecast').css({"background-image":"url(/resources/weather/09d.jpg)"});
				} else if (icon == "10d") {
					$("#icon").attr("class", "mdi mdi-weather-partly-rainy");
					 $('#weatherforecast').css({"background-image":"url(/resources/weather/10d.jpg)"});
				} else if (icon == "11d") {
					$("#icon").attr("class", "mdi mdi-weather-partly-lightning");
					 $('#weatherforecast').css({"background-image":"url(/resources/weather/11d.jpg)"});
				} else if (icon == "13d") {
					$("#icon").attr("class", "mdi mdi-weather-snowy-heavy");
					 $('#weatherforecast').css({"background-image":"url(/resources/weather/13d.jpg)"});
				} else if (icon == "50d") {
					$("#icon").attr("class", "mdi mdi-weather-fog");
					 $('#weatherforecast').css({"background-image":"url(/resources/weather/50d.jpg)"});
				}
		        
// 		        var imgURL = "http://openweathermap.org/img/w/" + icon + ".png";
// 		        $("#icon").attr("src", imgURL);
		        
		        
		    }
		});	
	}
	
	//온도 꺼내기
	forecast();
	function forecast(){
		console.log("일기예보TEST");
		var city = $("select[name=location]").val();
		
		//도시별 경 위도 설정하여 도시 이름이 바뀔때 경위도 값이 바뀌도록 한다.(이것은 ajax가져올시 경위도 설정을 하게됨)
		//나중에 지도 api를 섞어서 장소 선택시 값을 넘겨서 사용하도록 해보자
		var lat;
		var lon;
		if(city=="seoul"){
			lat=37;
			lon=126;
		} else if(city=="daejeon"){
			lat=36.35;
			lon=127.38;
		} else if(city=="daegu"){
			lat=35.87;
			lon=128.60;
		} else if(city=="busan"){
			lat=35.17;
			lon=129.07;
		} else if(city=="incheon"){
			lat=37.45;
			lon=126.70;
		} else if(city=="Gwangju"){
			lat=35.15;
			lon=126.85;
		} else if(city=="Ulsan"){
			lat=35.53;
			lon=129.31;
		} else if(city=="Sejong"){
			lat=36.48;
			lon=127.28;
		} else if(city=="Jeju-do"){
			lat=33.50;
			lon=126.51;
		}
		
		
		console.log(lat);
		
		//일주일간의 예보 데이터 ajax로 가져오기
		var apiURI = "https://api.openweathermap.org/data/2.5/onecall?lat="+lat+"&lon="+lon+"&exclude=hourly&appid=5d8072c6a22454670a833f5562e17cd3&lang=kr";
		$.ajax({
		    url: apiURI,
		    dataType: "json",
		    type: "GET",
		    async: "false",
		    success: function(resp) {
		    	var minTemp;
		    	var maxTemp;
		    	var description;
		    	var icon;
		    	for (var i = 0; i < resp.daily.length; i++) {
					day=resp.daily[i].dt;	
		    		var date = new Date(day*1000);
		    		
		    		var week; //요일 변환(0~6)
		    		if(date.getDay() == 0){
		    			week = "일";
		    		} else if(date.getDay() == 1){
		    			week = "월";
		    		} else if(date.getDay() == 2){
		    			week = "화";
		    		} else if(date.getDay() == 3){
		    			week = "수";
		    		} else if(date.getDay() == 4){
		    			week = "목";
		    		} else if(date.getDay() == 5){
		    			week = "금";
		    		} else if(date.getDay() == 6){
		    			week = "토";
		    		}
		    		
		    		//변수선언 및 값 넣기와 데이터 가공
					var dateFormat = date.getDate() + "일(" + week+")";
					minTemp=Math.round(resp.daily[i].temp.min -273.15);	
					maxTemp=Math.round(resp.daily[i].temp.max -273.15);	
					description=resp.daily[i].weather[0].description;	
					subIcon=resp.daily[i].weather[0].icon;	
					
					//데이터 확인
					console.log(resp);
					console.log(resp.daily[i].weather[0]);
					console.log("--------------");
					console.log(dateFormat);
					console.log(minTemp);
					console.log(maxTemp);
					console.log(description);
					console.log(subIcon);
					console.log("--------------");
					
					$("#dateFormat"+i).html(dateFormat) // 날짜 넣기
					$("#minTemp"+i).html(minTemp) // 온도 넣기
					$("#maxTemp"+i).html(maxTemp) // 온도 넣기
					$("#description"+i).html(description) // 날씨정보 넣기
					
					
					//이미지 바꿔 끼우기
				if (subIcon == "01n") {
			        $("#subIcon"+i).attr("class", "mdi mdi-weather-night");
				} else if (subIcon == "02n") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-night-partly-cloudy");
				} else if (subIcon == "03n") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-cloudy");
				} else if (subIcon == "04n") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-cloudy");
				} else if (subIcon == "09n") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-pouring");
				} else if (subIcon == "10n") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-rainy");
				} else if (subIcon == "11n") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-lightning");
				} else if (subIcon == "13n") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-snowy-heavy");
				} else if (subIcon == "50n") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-fog");
				} else if (subIcon == "01d") { // 해 수정
			        $("#subIcon"+i).attr("class", "mdi mdi-white-balance-sunny");
				} else if (subIcon == "02d") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-partly-cloudy");
				} else if (subIcon == "03d") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-cloudy");
				} else if (subIcon == "04d") {
					$("#subIcon"+i).attr("class", "mdi mdi-cloud");
				} else if (subIcon == "09d") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-pouring");
				} else if (subIcon == "10d") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-partly-rainy");
				} else if (subIcon == "11d") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-partly-lightning");
				} else if (subIcon == "13d") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-snowy-heavy");
				} else if (subIcon == "50d") {
					$("#subIcon"+i).attr("class", "mdi mdi-weather-fog");
				}
					
				console.log("날씨 테스트(배경)");
				var currentIcon = resp.current.weather[0].icon; //현재시간에 해당하는 아이콘 코드 불러오기
				
				//7일간 일기예보 배경 바꾸기(일마다 정해진 시간을 출력하기에 밤낮을 바꾸려면 코드가 길어짐)
				if (currentIcon == "01d" || currentIcon == "02d" || currentIcon == "03d" || currentIcon == "04d" || currentIcon == "09d" || currentIcon == "10d" || currentIcon == "11d" || currentIcon == "13d" || currentIcon == "50d") { //낮이면
			        $("#weatherForecast").css({"background-image": "url(/resources/weather/day.jpg)"});
				} else if (currentIcon == "01n" || currentIcon == "02n" || currentIcon == "03n" || currentIcon == "04n" || currentIcon == "09n" || currentIcon == "10n" || currentIcon == "11n" || currentIcon == "13n" || currentIcon == "50n") { //밤이면
					$("#weatherForecast").css({"background-image": "url(/resources/weather/weatherForecast.jpg)"});
				} 
					
					
				}
		    }
		})
		
	}
	
})

 	